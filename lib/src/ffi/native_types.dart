/// Type mappings and error codes for native bridge operations.
library;

/// Error codes returned by native functions.
enum NativeErrorCode {
  ok(0),
  invalidArgument(-1),
  internalError(-2),
  outOfMemory(-3);

  final int code;
  const NativeErrorCode(this.code);

  factory NativeErrorCode.fromCode(int code) {
    return NativeErrorCode.values.firstWhere(
      (e) => e.code == code,
      orElse: () => NativeErrorCode.internalError,
    );
  }
}
