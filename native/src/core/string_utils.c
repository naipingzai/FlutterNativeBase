#include "bridge_api.h"
#include <ctype.h>
#include <stddef.h>

/// Converts a null-terminated UTF-8 string to uppercase in-place.
FFI_PLUGIN_EXPORT void bridge_to_upper(char* buffer) {
  if (buffer == NULL) return;
  for (size_t i = 0; buffer[i] != '\0'; i++) {
    buffer[i] = (char)toupper((unsigned char)buffer[i]);
  }
}
