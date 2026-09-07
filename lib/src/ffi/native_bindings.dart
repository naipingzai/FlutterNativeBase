/// FFI function declarations and library loading.
library;

import 'package:ffi/ffi.dart';

import 'native_bridge_bindings_generated.dart' as bindings;

/// Returns the version string of the native bridge library.
String get version =>
    bindings.native_bridge_version().cast<Utf8>().toDartString();

/// Returns platform info string (os|arch|compiler|os_version).
String get platformInfo =>
    bindings.get_platform_info().cast<Utf8>().toDartString();
