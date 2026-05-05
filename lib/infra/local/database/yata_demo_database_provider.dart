import "package:flutter_riverpod/flutter_riverpod.dart";

import "yata_demo_database.dart";

final Provider<YataDemoDatabase> yataDemoDatabaseProvider =
    Provider<YataDemoDatabase>((Ref ref) {
      final YataDemoDatabase database = YataDemoDatabase();
      ref.onDispose(database.close);
      return database;
    });
