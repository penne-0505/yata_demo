import "package:flutter_riverpod/flutter_riverpod.dart";

import "database_connection.dart";
import "yata_demo_database.dart";

final Provider<YataDemoDatabase> yataDemoDatabaseProvider =
    Provider<YataDemoDatabase>((Ref ref) {
      final YataDemoDatabase database = YataDemoDatabase(createDatabaseConnection());
      ref.onDispose(database.close);
      return database;
    });
