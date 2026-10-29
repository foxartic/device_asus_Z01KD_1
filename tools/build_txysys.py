#!/usr/bin/env python3
"""Create libtxysys.so (renamed SONAME copy of the platform tinyxml2) and
libeffectsconfig.so with its libtinyxml2.so DT_NEEDED repointed at it.

Both edits stay inside .dynstr, which is deduplicated, so every name has exactly
one offset and no other file layout changes."""
import subprocess, sys, os, re, shutil

LINEAGE = os.environ.get("LINEAGE", "/home/harry/lineage")
OUT = os.environ.get("OUT", os.path.join(LINEAGE, "out/target/product/Z01KD_1"))
TOOLS = os.path.dirname(os.path.abspath(__file__))
SRC_TXY = os.environ.get("LIBTINYXML2", os.path.join(OUT, "system/lib/libtinyxml2.so"))
SRC_CFG = os.environ.get("LIBEFFECTSCONFIG",
                         os.path.join(OUT, "system/vendor/lib/libeffectsconfig.so"))
DST = os.environ.get("DST", os.path.join(TOOLS, "..", "prebuilts", "livepatch", "lib"))
os.makedirs(DST, exist_ok=True)

def dynstr(path):
    out = subprocess.run(["readelf", "-W", "-S", path], capture_output=True, text=True).stdout
    for line in out.splitlines():
        parts = line.split()
        if ".dynstr" in parts:
            i = parts.index(".dynstr")
            return int(parts[i + 3], 16), int(parts[i + 4], 16)   # sh_offset, sh_size
    sys.exit("no .dynstr in " + path)

def names(path, tag):
    out = subprocess.run(["readelf", "-W", "-d", path], capture_output=True, text=True).stdout
    for line in out.splitlines():
        m = re.search(r"\((%s)\).*\[(.+)\]" % tag, line)
        if m:
            yield m.group(2)

def patch(path, tag, old, new):
    if old not in list(names(path, tag)):
        sys.exit("%s: no DT_%s(%s)" % (path, tag, old))
    off, size = dynstr(path)
    data = bytearray(open(path, "rb").read())
    blob = bytes(data[off:off + size])
    needle = b"\x00" + old.encode() + b"\x00"
    hay = b"\x00" + blob
    hits = []
    i = 0
    while True:
        j = hay.find(needle, i)
        if j < 0:
            break
        hits.append(j)          # index into hay == offset of the name inside .dynstr
        i = j + 1
    if len(hits) != 1:
        sys.exit("%s: %r found %d times in .dynstr" % (path, old, len(hits)))
    foff = off + hits[0]
    assert data[foff - 1] == 0 and data[foff + len(old)] == 0
    data[foff:foff + len(old) + 1] = new.encode() + b"\x00" * (len(old) + 1 - len(new))
    open(path, "wb").write(data)
    print("%s: DT_%s %r -> %r at file offset %s" % (os.path.basename(path), tag, old, new, hex(foff)))

cfg_dst = os.path.join(DST, "libeffectsconfig.so")
txy_dst = os.path.join(DST, "libtxysys.so")
shutil.copyfile(SRC_CFG, cfg_dst)
shutil.copyfile(SRC_TXY, txy_dst)

patch(txy_dst, "SONAME", "libtinyxml2.so", "libtxysys.so")
patch(cfg_dst, "NEEDED", "libtinyxml2.so", "libtxysys.so")

subprocess.run(["file", txy_dst, cfg_dst])
NM = os.environ.get("NM", os.path.join(
    LINEAGE, "prebuilts/clang/host/linux-x86/clang-r344140b/bin/llvm-nm"))
for label, p in (("libtxysys", txy_dst), ("libeffectsconfig", cfg_dst)):
    print("=== %s dynamic" % label)
    for line in subprocess.run(["readelf", "-W", "-d", p], capture_output=True,
                                text=True).stdout.splitlines():
        if "NEEDED" in line or "SONAME" in line:
            print("  " + line.strip())
print("=== libtxysys provides every symbol the patched cfg wants")
want = subprocess.run([NM, "-D", "--undefined-only", cfg_dst], capture_output=True,
                      text=True).stdout.split()
want = [w for w in want if "tinyxml" in w]
have = set(subprocess.run([NM, "-D", "--defined-only", txy_dst], capture_output=True,
                          text=True).stdout.split())
for s in sorted(set(want)):
    print("  %s %s" % ("HAVE" if s in have else "MISS", s))
subprocess.run("md5sum %s %s" % (txy_dst, cfg_dst), shell=True, executable="/bin/bash")
