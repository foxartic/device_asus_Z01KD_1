/* Android 10 folded libhidltransport and libhwbinder into libhidlbase. The 8.1
 * vendor HALs still list the old names in DT_NEEDED, so their dlopen fails on
 * Android 11. These two names carry no symbols of their own; they only pull in
 * libhidlbase, which is where the HIDL runtime now lives.
 */
