/// Encapsulated Dart service class for native bridge operations.
library;

import 'native_bindings.dart' as bridge;

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

  /// Returns platform info as a parsed map.
  Map<String, String> get platformInfo {
    try {
      final raw = bridge.platformInfo;
      final parts = raw.split('|');
      return {
        'os': parts.isNotEmpty ? parts[0] : 'Unknown',
        'arch': parts.length > 1 ? parts[1] : 'Unknown',
        'compiler': parts.length > 2 ? parts[2] : 'Unknown',
        'osVersion': parts.length > 3 ? parts[3] : 'Unknown',
      };
    } catch (e) {
      return {
        'os': 'Unknown',
        'arch': 'Unknown',
        'compiler': 'Unknown',
        'osVersion': 'Unknown',
      };
    }
  }
}
