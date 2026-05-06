import "dart:io";
import "dart:math";

Future<String?> sanitizeDirectory(String? path) async {
  if (path == null || path.isEmpty) {
    return null;
  }

  final String normalized = path.trim();
  if (normalized.isEmpty) {
    return null;
  }

  final Directory directory = Directory(normalized).absolute;
  try {
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    await _writeProbeFile(directory);
  } on Object catch (error) {
    throw Exception("logDirectory validation failed: $error");
  }
  return directory.path;
}

Future<void> _writeProbeFile(Directory directory) async {
  final int suffix = Random().nextInt(99999);
  final Uri probeUri = directory.uri.resolve(".yata_probe_$suffix");
  final File probe = File.fromUri(probeUri);
  await probe.writeAsString("probe", flush: true);
  try {
    await probe.delete();
  } on Object {
    // ignore deletion failure
  }
}
