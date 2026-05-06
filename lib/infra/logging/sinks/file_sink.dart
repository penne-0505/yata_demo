export "file_sink_native.dart"
  if (dart.library.js_interop) "file_sink_web.dart";
