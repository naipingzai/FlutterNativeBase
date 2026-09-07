/// FFI function declarations and library loading.
///
/// This file wraps the auto-generated bindings from `package:ffigen`
/// and provides clean Dart function names.
library;

import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'package:ffi/ffi.dart';

import 'native_bridge_bindings_generated.dart' as bindings;

/// Returns the version string of the native bridge library.
String get version =>
    bindings.native_bridge_version().cast<Utf8>().toDartString();

/// Adds two integers.
int sum(int a, int b) => bindings.bridge_sum(a, b);

/// Multiplies two integers.
int multiply(int a, int b) => bindings.bridge_multiply(a, b);

/// Computes the factorial of n.
int factorial(int n) => bindings.bridge_factorial(n);

/// Computes the nth Fibonacci number.
int fibonacci(int n) => bindings.bridge_fibonacci(n);

/// Sums all elements in a list of integers.
int sumArray(List<int> data) {
  final ptr = calloc.allocate<IntPtr>(data.length * sizeOf<IntPtr>());
  for (var i = 0; i < data.length; i++) {
    ptr[i] = data[i];
  }
  final result = bindings.bridge_sum_array(ptr, data.length);
  calloc.free(ptr);
  return result;
}

/// Converts a string to uppercase using the C implementation.
String toUpper(String input) {
  final ptr = input.toNativeUtf8();
  bindings.bridge_to_upper(ptr.cast());
  final result = ptr.toDartString();
  calloc.free(ptr);
  return result;
}

/// A longer lived native function, which occupies the thread calling it.
Future<int> sumAsync(int a, int b) async {
  final SendPort helperIsolateSendPort = await _helperIsolateSendPort;
  final int requestId = _nextSumRequestId++;
  final _SumRequest request = _SumRequest(requestId, a, b);
  final Completer<int> completer = Completer<int>();
  _sumRequests[requestId] = completer;
  helperIsolateSendPort.send(request);
  return completer.future;
}

class _SumRequest {
  final int id;
  final int a;
  final int b;
  const _SumRequest(this.id, this.a, this.b);
}

class _SumResponse {
  final int id;
  final int result;
  const _SumResponse(this.id, this.result);
}

int _nextSumRequestId = 0;
final Map<int, Completer<int>> _sumRequests = <int, Completer<int>>{};

Future<SendPort> _helperIsolateSendPort = () async {
  final Completer<SendPort> completer = Completer<SendPort>();
  final ReceivePort receivePort = ReceivePort()
    ..listen((dynamic data) {
      if (data is SendPort) {
        completer.complete(data);
        return;
      }
      if (data is _SumResponse) {
        final Completer<int> c = _sumRequests[data.id]!;
        _sumRequests.remove(data.id);
        c.complete(data.result);
        return;
      }
      throw UnsupportedError('Unsupported message type: ${data.runtimeType}');
    });

  await Isolate.spawn((SendPort sendPort) async {
    final ReceivePort helperReceivePort = ReceivePort()
      ..listen((dynamic data) {
        if (data is _SumRequest) {
          final int result = bindings.bridge_sum_long_running(data.a, data.b);
          sendPort.send(_SumResponse(data.id, result));
          return;
        }
        throw UnsupportedError('Unsupported message type: ${data.runtimeType}');
      });
    sendPort.send(helperReceivePort.sendPort);
  }, receivePort.sendPort);

  return completer.future;
}();
