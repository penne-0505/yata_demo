import "dart:async";

import "package:flutter/foundation.dart";

import "sink.dart";

/// コンソールへログを出力するシンク。
///
/// Web 環境でも `debugPrint` を使って動作する。
class ConsoleSink implements LogSink<String> {
  ConsoleSink() : _isEnabled = true;

  bool _isEnabled;
  bool _reportedFailure = false;

  void _handleWriteFailure(Object error, StackTrace stackTrace) {
    _isEnabled = false;
    if (!_reportedFailure && kDebugMode) {
      _reportedFailure = true;
      debugPrint("ConsoleSink disabled: $error");
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  @override
  Future<void> add(String data) async {
    if (!_isEnabled) {
      return;
    }
    try {
      debugPrint(data);
    } on Object catch (error, stackTrace) {
      _handleWriteFailure(error, stackTrace);
    }
  }

  @override
  Future<void> flush() async {
    // debugPrint は同期的に出力されるため、flush は不要。
  }

  @override
  Future<void> close() async {
    _isEnabled = false;
  }
}
