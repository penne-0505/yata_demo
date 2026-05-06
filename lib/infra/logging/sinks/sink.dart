import "dart:async";

/// ログ出力先の抽象インターフェース。
abstract class LogSink<T> {
  Future<void> add(T data);
  Future<void> flush();
  Future<void> close();
}
