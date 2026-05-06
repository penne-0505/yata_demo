import "../log_config.dart";
import "sink.dart";

/// Web 環境で使用する no-op ファイルシンク。
/// logger.dart 内で [FileSink] 型として参照されるため、同名クラスを提供する。
class FileSink implements LogSink<String> {
  FileSink(LogConfig _);

  Object? lastError;
  String? get activeFilePath => null;

  @override
  Future<void> add(String data) async {}

  @override
  Future<void> flush() async {}

  @override
  Future<void> close() async {}
}
