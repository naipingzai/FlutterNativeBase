#include "bridge_api.h"

/// Adds two integers.
FFI_PLUGIN_EXPORT intptr_t bridge_sum(intptr_t a, intptr_t b) {
  return a + b;
}

/// Multiplies two integers.
FFI_PLUGIN_EXPORT intptr_t bridge_multiply(intptr_t a, intptr_t b) {
  return a * b;
}

/// Computes the factorial of n.
FFI_PLUGIN_EXPORT intptr_t bridge_factorial(intptr_t n) {
  if (n < 0) return -1;
  intptr_t result = 1;
  for (intptr_t i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
}

/// Computes the nth Fibonacci number.
FFI_PLUGIN_EXPORT intptr_t bridge_fibonacci(intptr_t n) {
  if (n < 0) return -1;
  if (n == 0) return 0;
  if (n == 1) return 1;
  intptr_t a = 0, b = 1;
  for (intptr_t i = 2; i <= n; i++) {
    intptr_t temp = a + b;
    a = b;
    b = temp;
  }
  return b;
}
