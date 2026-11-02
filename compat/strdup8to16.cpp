// strdup8to16() was part of libcutils until Android 11 deleted it. The stock
// libdpmframework.so blob still imports it, so without this dpmd cannot even be
// exec'd ("cannot locate symbol strdup8to16 referenced by /system/lib64/libdpm-
// framework.so") and init restarts it forever.
//
// The contract is the one the Android 9 libcutils exported, read out of its
// disassembly: the caller gets a malloc'd buffer of exactly len16 char16_t
// units (no terminator) and the unit count through the second argument.
#include <cstddef>
#include <cstdint>
#include <cstdlib>

namespace {

constexpr uint32_t kMinCodePoint[] = {0, 0, 0x80, 0x800, 0x10000};

// Walks one modified UTF-8 string, counting units when dst is null and
// filling the buffer otherwise, so the two passes cannot disagree.
size_t convert(const char* src, char16_t* dst) {
    const uint8_t* s = reinterpret_cast<const uint8_t*>(src);
    size_t units = 0;
    size_t i = 0;
    for (;;) {
        uint8_t lead = s[i];
        if (lead == '\0') {
            break;
        }
        size_t len = 0;
        uint32_t cp = lead;
        if (lead < 0x80) {
            len = 1;
        } else if ((lead & 0xe0) == 0xc0) {
            len = 2;
            cp = lead & 0x1f;
        } else if ((lead & 0xf0) == 0xe0) {
            len = 3;
            cp = lead & 0x0f;
        } else if ((lead & 0xf8) == 0xf0) {
            len = 4;
            cp = lead & 0x07;
        }
        for (size_t k = 1; len != 0 && k < len; k++) {
            uint8_t cont = s[i + k];
            if ((cont & 0xc0) != 0x80) {
                len = 0;
                break;
            }
            cp = (cp << 6) | (cont & 0x3f);
        }
        // C0 80 is how modified UTF-8 spells U+0000, so it stays legal even
        // though it is an overlong form.
        bool valid = len != 0 && cp <= 0x10ffff && (cp >= kMinCodePoint[len] || cp == 0);

        if (valid && len == 3 && cp >= 0xd800 && cp <= 0xdbff) {
            // A non-BMP character arrives as a surrogate pair written into two
            // 3-byte sequences, so the high half is followed by its low half.
            uint8_t second = s[i + 3];
            if (second == 0xed && (s[i + 4] & 0xf0) == 0xb0 && (s[i + 5] & 0xc0) == 0x80) {
                if (dst != nullptr) {
                    dst[units] = static_cast<char16_t>(cp);
                    dst[units + 1] = static_cast<char16_t>(0xdc00 | ((s[i + 4] & 0x0f) << 6) |
                                                           (s[i + 5] & 0x3f));
                }
                units += 2;
                i += 6;
                continue;
            }
            valid = false;
        } else if (valid && len == 3 && cp >= 0xdc00 && cp <= 0xdfff) {
            valid = false;
        }

        if (!valid) {
            if (dst != nullptr) {
                dst[units] = 0xfffd;
            }
            units += 1;
            i += len != 0 ? len : 1;
            continue;
        }

        if (cp <= 0xffff) {
            if (dst != nullptr) {
                dst[units] = static_cast<char16_t>(cp);
            }
            units += 1;
        } else {
            uint32_t v = cp - 0x10000;
            if (dst != nullptr) {
                dst[units] = static_cast<char16_t>(0xd800 | (v >> 10));
                dst[units + 1] = static_cast<char16_t>(0xdc00 | (v & 0x3ff));
            }
            units += 2;
        }
        i += len;
    }
    return units;
}

}  // namespace

extern "C" char16_t* strdup8to16(const char* str8, size_t* len16) {
    if (str8 == nullptr) {
        return nullptr;
    }
    size_t units = convert(str8, nullptr);
    if (units > SIZE_MAX / 2) {
        return nullptr;
    }
    char16_t* out = static_cast<char16_t*>(malloc(units * 2));
    if (out == nullptr) {
        return nullptr;
    }
    convert(str8, out);
    if (len16 != nullptr) {
        *len16 = units;
    }
    return out;
}
