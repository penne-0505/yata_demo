import "dart:io";

Map<String, String> readSystemEnvironment() =>
    Map<String, String>.from(Platform.environment);

Map<String, String> loadEnvFromFile({String? path}) {
  final File file = File(path ?? ".env");
  if (!file.existsSync()) {
    return <String, String>{};
  }

  final Map<String, String> env = <String, String>{};
  try {
    final List<String> lines = file.readAsLinesSync();
    for (final String raw in lines) {
      final String line = raw.trim();

      if (line.isEmpty || line.startsWith("#")) {
        continue;
      }

      final int idx = line.indexOf("=");
      if (idx <= 0) {
        continue;
      }

      final String key = line.substring(0, idx).trim();
      String value = line.substring(idx + 1).trim();

      if (value.startsWith('"') && value.endsWith('"') && value.length >= 2) {
        value = value.substring(1, value.length - 1);
      }

      env[key] = value;
    }
  } catch (_) {
    // ignore
  }

  return env;
}
