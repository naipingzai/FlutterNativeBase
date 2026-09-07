/// flutter_native_base – A Flutter FFI package providing C native functions.
///
/// This package demonstrates the modern `hook/build.dart` approach
/// for compiling and bundling native C code with Dart/Flutter applications.
///
/// ## Usage
///
/// ```dart
/// import 'package:flutter_native_base/src/ffi/native_bindings.dart';
///
/// final result = sum(2, 3);
/// print('2 + 3 = $result');
/// ```
///
/// The C source code is compiled automatically by the build hook defined
/// in `hook/build.dart`. No CMakeLists.txt or manual compilation needed.
library;

export 'src/ffi/native_bindings.dart';
export 'src/ffi/native_service.dart';
export 'src/ffi/native_types.dart';
