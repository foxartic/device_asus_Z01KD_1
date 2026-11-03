// libsettings.so is an Android-8.1 Qualcomm blob that was linked against
// protobuf 3.2, where the empty-string singleton was exported as
// google::protobuf::internal::empty_string_. Protobuf 3.7 renamed it to
// fixed_address_empty_string, so Android 11's libprotobuf-cpp-full.so has no
// such symbol: every process that loads libsettings.so (directly or through
// libril-qc-qmi-1.so / libril-qc-hal-qmi.so / libqcrilFramework.so) exec-fails
// with
//   dlopen failed: cannot locate symbol
//     "_ZN6google8protobuf8internal13empty_string_E"
//       referenced by "/system/vendor/lib64/libsettings.so"
// which is why ril-daemon and ril-daemon2 exit with status 1 over and over, and
// why qcrilmsgtunnel keeps stopping: the rild2 socket it connects to never
// exists.
//
// The old symbol was a plain std::string object holding an empty string (the
// 3.9.1 replacement is the same object under a different name, 24 bytes on
// arm64), so re-exporting it under the old name costs one object and every other
// protobuf reference in the blob already resolves.

#include <string>

namespace google {
namespace protobuf {
namespace internal {

// extern is required: a namespace-scope const object with an initializer has
// internal linkage, and the first build of this file therefore exported nothing
// at all - readelf --dyn-syms showed only the two libc entries.
extern const std::string empty_string_ = std::string();

}  // namespace internal
}  // namespace protobuf
}  // namespace google
