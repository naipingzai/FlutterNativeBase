/// FFI function declarations and library loading.
library;

import 'dart:io';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

/// Load the native library.
DynamicLibrary _loadLib() {
  if (Platform.isLinux) {
    return DynamicLibrary.open('libnpz_flutter_code.so');
  } else if (Platform.isAndroid) {
    return DynamicLibrary.open('libnpz_flutter_code.so');
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('npz_flutter_code.dll');
  } else if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('libnpz_flutter_code.dylib');
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
