#!/usr/bin/env python3
# Build a new ld.config.29.txt:
#   [vendor]  stays system-first (A10-built binaries: vndservicemanager, toolbox, ...)
#   [legacy]  is vendor-first, used for the 8.1 blobs under /vendor/bin/hw/
#             except the four binaries the 17.1 build produces itself.
import sys

src, dst = sys.argv[1], sys.argv[2]
lines = open(src, encoding="utf-8").read().split("\n")

# 1. locate dir block
anchor = lines.index("dir.vendor = /odm/bin/")
dirs = [
    "dir.legacy = /vendor/bin/legacy/",
    "",
]
lines[anchor:anchor] = dirs

# 2. duplicate the [vendor] section as [legacy]
v = lines.index("[vendor]")
u = lines.index("[unrestricted]")
block = lines[v:u]
legacy = []
for l in block:
    if l == "[vendor]":
        legacy.append("[legacy]")
    elif l.startswith("namespace.default.search.paths"):
        # drop until the first non-search line, then emit the 15.1-era order
        continue
    else:
        legacy.append(l)

# rebuild the ordered search paths from the original (pre-reorder) file
paths = [
    "namespace.default.search.paths  = /odm/${LIB}",
    "namespace.default.search.paths += /vendor/${LIB}",
    "namespace.default.search.paths += /system/${LIB}",
    "namespace.default.search.paths += /system/${LIB}/hw",
    "namespace.default.search.paths += /apex/com.android.runtime/${LIB}",
]
# insert them where the old ones were (right before permitted.paths)
pi = next(i for i, l in enumerate(legacy) if l.startswith("namespace.default.permitted.paths"))
legacy[pi:pi] = paths

lines[u:u] = legacy + ["# end of [legacy] (8.1 blob namespace, vendor-first)"]
open(dst, "w", encoding="utf-8").write("\n".join(lines))
print("wrote", dst, len(lines), "lines")
