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

/// Adds two integers.
FFI_PLUGIN_EXPORT intptr_t bridge_sum(intptr_t a, intptr_t b);

/// Multiplies two integers.
FFI_PLUGIN_EXPORT intptr_t bridge_multiply(intptr_t a, intptr_t b);

/// A longer lived native function (simulates work).
FFI_PLUGIN_EXPORT intptr_t bridge_sum_long_running(intptr_t a, intptr_t b);

/// Computes the factorial of n.
FFI_PLUGIN_EXPORT intptr_t bridge_factorial(intptr_t n);

/// Computes the nth Fibonacci number.
FFI_PLUGIN_EXPORT intptr_t bridge_fibonacci(intptr_t n);

/// Sums all elements in an intptr_t array.
FFI_PLUGIN_EXPORT intptr_t bridge_sum_array(const intptr_t* data, intptr_t length);

/// Converts a null-terminated UTF-8 string to uppercase in-place.
FFI_PLUGIN_EXPORT void bridge_to_upper(char* buffer);

#endif // BRIDGE_API_H
