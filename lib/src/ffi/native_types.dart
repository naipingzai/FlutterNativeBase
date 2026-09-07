/// Type mappings and error codes for native bridge operations.
library;

/// Error codes returned by native functions.
enum NativeErrorCode {
  /// No error occurred.
  ok(0),

  /// Invalid argument was passed.
  invalidArgument(-1),

  /// An internal error occurred.
  internalError(-2),

  /// Memory allocation failed.
  outOfMemory(-3);

  final int code;
  const NativeErrorCode(this.code);

  /// Creates a NativeErrorCode from an integer code.
  factory NativeErrorCode.fromCode(int code) {
    return NativeErrorCode.values.firstWhere(
      (e) => e.code == code,
      orElse: () => NativeErrorCode.internalError,
    );
  }
}

/// Result wrapper for native operations.
class NativeResult<T> {
  final T? value;
  final NativeErrorCode errorCode;

  const NativeResult.success(this.value) : errorCode = NativeErrorCode.ok;
  const NativeResult.error(this.errorCode) : value = null;

  bool get isSuccess => errorCode == NativeErrorCode.ok;
  bool get isError => !isSuccess;
}
