import re, struct, subprocess, sys

BIN = "/home/harry/lineage/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin"
OBJDUMP = BIN + "/aarch64-linux-android-objdump"
PARCEL_CTOR = "_ZN7android6ParcelC"
OLD_SIZE, NEW_SIZE = 104, 120
GROW = NEW_SIZE - OLD_SIZE

LINE = re.compile(r"^\s*([0-9a-f]+):\s([0-9a-f]{8})\s+(\S+)\s*(.*)$")
HDR = re.compile(r"^([0-9a-f]{16}) <(.*)>:$")
INT = lambda s: int(s, 16) if s.startswith("-0x") or s.startswith("0x") else int(s)
MEM = re.compile(r"^(?P<regs>.*),\s*\[(?P<base>x29|sp)(?:,\s*#(?P<off>-?0x[0-9a-f]+|-?\d+))?\](?P<tail>.*)$")
IMM = re.compile(r"#(-?0x[0-9a-f]+|-?\d+)\s*$")


class Elf:
    def __init__(self, path):
        self.data = bytearray(open(path, "rb").read())
        assert self.data[:4] == b"\x7fELF" and self.data[4] == 2, "need ELF64"
        e_phoff, = struct.unpack_from("<Q", self.data, 0x20)
        e_phentsize, e_phnum = struct.unpack_from("<HH", self.data, 0x36)
        e_shoff, = struct.unpack_from("<Q", self.data, 0x28)
        e_shentsize, e_shnum = struct.unpack_from("<HH", self.data, 0x3A)
        self.loads = []
        for i in range(e_phnum):
            o = e_phoff + i * e_phentsize
            if struct.unpack_from("<I", self.data, o)[0] != 1:
                continue
            p_offset, p_vaddr, _, _, p_memsz = struct.unpack_from("<QQQQQ", self.data, o + 8)
            self.loads.append((p_vaddr, p_offset, p_memsz))
        self.symtab = None
        for want in (2, 11):
            for i in range(e_shnum):
                o = e_shoff + i * e_shentsize
                sh_type, = struct.unpack_from("<I", self.data, o + 4)
                if sh_type != want:
                    continue
                sh_off, sh_size = struct.unpack_from("<QQ", self.data, o + 0x18)
                sh_link, = struct.unpack_from("<I", self.data, o + 0x28)
                sh_entsize, = struct.unpack_from("<Q", self.data, o + 0x38)
                if sh_entsize == 24:
                    self.symtab = (sh_off, sh_size, sh_link)
                    break
            if self.symtab:
                break
        self.strtab = 0
        if self.symtab:
            o = e_shoff + self.symtab[2] * e_shentsize
            self.strtab = struct.unpack_from("<Q", self.data, o + 0x18)[0]

    def off(self, vaddr):
        for lo, fo, memsz in self.loads:
            if lo <= vaddr < lo + memsz:
                return fo + (vaddr - lo)

    def funcs(self):
        if not self.symtab:
            return []
        so, ss, _ = self.symtab
        out = []
        for i in range(ss // 24):
            o = so + i * 24
            st_name, st_info, _, st_shndx = struct.unpack_from("<IBBH", self.data, o)
            st_value, st_size = struct.unpack_from("<QQ", self.data, o + 8)
            if (st_info & 0xF) != 2 or not st_size or not st_shndx or self.off(st_value) is None:
                continue
            end = self.data.index(b"\0", self.strtab + st_name)
            out.append((st_value, st_size, self.data[self.strtab + st_name:end].decode()))
        return sorted(set(out))

    def get(self, a):
        return struct.unpack_from("<I", self.data, self.off(a))[0]

    def put(self, a, w):
        struct.pack_into("<I", self.data, self.off(a), w)


def parse(mn, opr):
    """-> (base, off, kind, form, scale) or None for x29/sp relative accesses."""
    if mn in ("add", "sub"):
        if not re.match(r"^[xw]\d+,\s*(x29|sp),\s*#", opr):
            return None
        m = IMM.search(opr)
        if not m:
            return None
        return ("x29" if "x29" in opr.split(",")[1] else "sp",
                INT(m.group(1)) * (-1 if mn == "sub" else 1), "imm12", "addr", 1)
    if mn not in ("ldr", "str", "ldp", "stp", "ldrsw"):
        return None
    m = MEM.match(opr)
    if not m:
        return None
    off = INT(m.group("off")) if m.group("off") else 0
    tail = m.group("tail").replace(" ", "")
    form = "offset"
    if tail.startswith("!"):
        form = "pre"
    elif tail.startswith(",#"):
        form = "post"
        m2 = re.match(r"^,?#(-?0x[0-9a-f]+|-?\d+)$", tail)
        if not m2:
            return None
        off = INT(m2.group(1))
    elif tail:
        return None
    first = opr.split(",")[0].strip()
    scale = {"x": 8, "w": 4, "s": 4, "d": 8, "q": 16}.get(first[0], 8)
    if mn == "ldrsw":
        scale = 4
    kind = "imm7" if mn in ("ldp", "stp") else "imm12"
    return (m.group("base"), off, kind, form, scale)


def set_field(word, new, kind, scale=1):
    if kind == "imm12":
        assert new % scale == 0, (new, scale)
        v = new // scale
        assert 0 <= v <= 0xFFF, v
        return (word & ~(0xFFF << 10)) | (v << 10)
    v = new // 8
    assert -64 <= v <= 63, new
    return (word & ~(0x7F << 15)) | ((v & 0x7F) << 15)


def run(path, outpath):
    elf = Elf(path)
    lines = dump_lines = subprocess.run([OBJDUMP, "-d", path], capture_output=True, text=True).stdout.splitlines()
    n_ok = n_skip = 0
    skipped = []
    for faddr, fsize, fname in elf.funcs():
        body = []
        for ln in lines:
            m = LINE.match(ln)
            if m:
                a = int(m.group(1), 16)
                if faddr <= a < faddr + fsize:
                    body.append((a, int(m.group(2), 16), m.group(3), m.group(4).strip()))
        if not body:
            continue
        ctors = [i for i, e in enumerate(body) if e[2] == "bl" and PARCEL_CTOR in e[3]]
        if not ctors:
            continue
        pro, epis, bad = None, [], []
        for a, w, mn, opr in body:
            p = parse(mn, opr)
            if not p:
                continue
            base, off, kind, form, scale = p
            if mn == "stp" and opr.startswith("x29, x30,") and base == "sp" and form == "pre" and pro is None:
                pro = (a, w, -off)
            elif mn == "ldp" and opr.startswith("x29, x30,") and base == "sp" and form == "post":
                epis.append((a, w, off))
            elif mn == "sub" and base in ("x29", "sp"):
                bad.append(a)
        if pro is None or not epis or any(e[2] != pro[2] for e in epis) or bad:
            skipped.append("form  %s" % fname[:70])
            n_skip += 1
            continue
        frame = pro[2]
        slots, unresolved = [], False
        for i in ctors:
            reg = None
            for j in range(max(0, i - 7), i):
                a, w, mn, opr = body[j]
                m = re.match(r"^x0,\s*(x\d+)$", opr) if mn == "mov" else None
                if m:
                    reg = m.group(1)
                elif mn == "add" and re.match(r"^x0,\s*(x29|sp),\s*#", opr):
                    reg = "x29" if "x29" in opr.split(",")[1] else "sp"
            if reg is None:
                unresolved = True
                break
            off = None
            for j in range(i - 1, -1, -1):
                a, w, mn, opr = body[j]
                if re.match(r"^%s,\s*(x29|sp),\s*#(-?0x[0-9a-f]+|-?\d+)$" % reg, opr):
                    if mn == "add":
                        off = INT(IMM.search(opr).group(1))
                    break
                if re.match(r"^%s," % reg, opr) and mn in ("mov", "add", "ldr", "sub", "blr"):
                    break
            if off is None:
                unresolved = True
                break
            slots.append(off)
        if unresolved:
            skipped.append("this  %s" % fname[:70])
            n_skip += 1
            continue
        slots = sorted(set(s for s in slots if 0 < s < frame))
        if not slots:
            skipped.append("slots %s" % fname[:70])
            n_skip += 1
            continue
        k = len(slots)
        new_frame = frame + GROW * k
        if new_frame > 504:
            skipped.append("frame %s" % fname[:70])
            n_skip += 1
            continue
        refs = 0
        epi_addrs = [e[0] for e in epis]
        for a, w, mn, opr in body:
            if a == pro[0] or a in epi_addrs:
                continue
            p = parse(mn, opr)
            if not p:
                continue
            base, off, kind, form, scale = p
            if form not in ("offset", "addr") or off <= slots[0]:
                continue
            shift = GROW * sum(1 for s in slots if s < off)
            if not shift:
                continue
            elf.put(a, set_field(w, off + shift, kind, scale))
            refs += 1
        elf.put(pro[0], set_field(pro[1], -new_frame, "imm7"))
        for a, w, o in epis:
            elf.put(a, set_field(w, new_frame, "imm7"))
        print("OK   %-58s frame %3d->%3d parcels=%d slots=%s refs=%d canary %d->%d" % (
            fname[:58], frame, new_frame, k, [hex(s) for s in slots], refs,
            frame - 8, new_frame - 8))
        n_ok += 1
    for s in skipped:
        print("SKIP", s)
    print("patched %d  skipped %d" % (n_ok, n_skip))
    open(outpath, "wb").write(bytes(elf.data))
    print("wrote", outpath)


if __name__ == "__main__":
    run(sys.argv[1], sys.argv[2])
