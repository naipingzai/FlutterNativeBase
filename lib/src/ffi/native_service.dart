/// Encapsulated Dart service class for native bridge operations.
///
/// Provides a high-level API that wraps FFI calls with error handling
/// and logging. Use this class instead of calling FFI functions directly.
library;

import 'native_bindings.dart' as bridge;
import 'native_types.dart';

/// Service class providing access to native bridge functionality.
class NativeService {
  /// Returns the version of the native bridge library.
  String get version {
    try {
      return bridge.version;
    } catch (e) {
      return 'unknown';
    }
  }

  /// Adds two integers.
  NativeResult<int> add(int a, int b) {
    try {
      return NativeResult.success(bridge.sum(a, b));
    } catch (e) {
      return NativeResult.error(NativeErrorCode.internalError);
    }
  }

  /// Multiplies two integers.
  NativeResult<int> multiply(int a, int b) {
    try {
      return NativeResult.success(bridge.multiply(a, b));
    } catch (e) {
      return NativeResult.error(NativeErrorCode.internalError);
    }
  }

  /// Computes the factorial of n.
  NativeResult<int> factorial(int n) {
    try {
      final result = bridge.factorial(n);
      if (result == -1) {
        return NativeResult.error(NativeErrorCode.invalidArgument);
      }
      return NativeResult.success(result);
    } catch (e) {
      return NativeResult.error(NativeErrorCode.internalError);
    }
  }

  /// Computes the nth Fibonacci number.
  NativeResult<int> fibonacci(int n) {
    try {
      final result = bridge.fibonacci(n);
      if (result == -1) {
        return NativeResult.error(NativeErrorCode.invalidArgument);
      }
      return NativeResult.success(result);
    } catch (e) {
      return NativeResult.error(NativeErrorCode.internalError);
    }
  }

  /// Sums all elements in a list.
  NativeResult<int> sumArray(List<int> data) {
    try {
      return NativeResult.success(bridge.sumArray(data));
    } catch (e) {
      return NativeResult.error(NativeErrorCode.internalError);
    }
  }

  /// Converts a string to uppercase using the C implementation.
  NativeResult<String> toUpper(String input) {
    try {
      return NativeResult.success(bridge.toUpper(input));
    } catch (e) {
      return NativeResult.error(NativeErrorCode.internalError);
    }
  }

  /// Adds two integers asynchronously on a separate isolate.
  Future<NativeResult<int>> addAsync(int a, int b) async {
    try {
      final result = await bridge.sumAsync(a, b);
      return NativeResult.success(result);
    } catch (e) {
      return NativeResult.error(NativeErrorCode.internalError);
    }
  }
}
