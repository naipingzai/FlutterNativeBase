#include "bridge_api.h"
#include <unistd.h>

static const char* kVersion = "0.1.0";

/// Returns the version string of the native bridge library.
FFI_PLUGIN_EXPORT const char* native_bridge_version() {
  return kVersion;
}

/// A longer lived native function (simulates work).
FFI_PLUGIN_EXPORT intptr_t bridge_sum_long_running(intptr_t a, intptr_t b) {
#if _WIN32
  Sleep(5000);
#else
  usleep(5000 * 1000);
#endif
  return a + b;
}

/// Sums all elements in an intptr_t array.
FFI_PLUGIN_EXPORT intptr_t bridge_sum_array(const intptr_t* data, intptr_t length) {
  if (data == NULL || length <= 0) return 0;
  intptr_t total = 0;
  for (intptr_t i = 0; i < length; i++) {
    total += data[i];
  }
  return total;
}
