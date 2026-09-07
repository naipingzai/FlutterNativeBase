/// FFI function declarations and library loading.
library;

import 'dart:io';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

/// Load the native library.
DynamicLibrary _loadLib() {
  if (Platform.isLinux) {
    return DynamicLibrary.open('libflutter_native_base.so');
  } else if (Platform.isAndroid) {
    return DynamicLibrary.open('libflutter_native_base.so');
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('flutter_native_base.dll');
  } else if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('libflutter_native_base.dylib');
  }
  throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
}

final _lib = _loadLib();

/// Returns the version string of the native bridge library.
String get version {
  final fn = _lib.lookupFunction<
    Pointer<Char> Function(),
    Pointer<Char> Function()
  >('native_bridge_version');
  return fn().cast<Utf8>().toDartString();
}

/// Returns platform info string (os|arch|compiler|os_version).
String get platformInfo {
  final fn = _lib.lookupFunction<
    Pointer<Char> Function(),
    Pointer<Char> Function()
  >('get_platform_info');
  return fn().cast<Utf8>().toDartString();
}
