import "package:flutter_riverpod/flutter_riverpod.dart";

import "../database/yata_demo_database.dart";
import "../database/yata_demo_database_provider.dart";
import "demo_seed_service.dart";

final Provider<DemoSeedService> demoSeedServiceProvider =
    Provider<DemoSeedService>((Ref ref) {
      final YataDemoDatabase database = ref.read(yataDemoDatabaseProvider);
      return DemoSeedService(database: database);
    });
