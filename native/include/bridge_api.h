#ifndef BRIDGE_API_H
#define BRIDGE_API_H

#include <stdint.h>

#if _WIN32
#include <windows.h>
#define FFI_PLUGIN_EXPORT __declspec(dllexport)
#else
#define FFI_PLUGIN_EXPORT
#endif

/// Returns the version string of the native bridge library.
FFI_PLUGIN_EXPORT const char* native_bridge_version();

/// Returns platform info as a null-terminated string.
/// Format: "os|arch|compiler|os_version"
/// e.g. "Linux|x86_64|GCC 12.3.0|6.5.0"
FFI_PLUGIN_EXPORT const char* get_platform_info();

#endif // BRIDGE_API_H
