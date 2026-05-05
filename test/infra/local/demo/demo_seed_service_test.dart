import "package:drift/native.dart";
import "package:flutter_test/flutter_test.dart";
import "package:yata/infra/local/database/yata_demo_database.dart";
import "package:yata/infra/local/demo/demo_seed_service.dart";

void main() {
  late YataDemoDatabase database;
  late DemoSeedService service;

  setUp(() {
    database = YataDemoDatabase(NativeDatabase.memory());
    service = DemoSeedService(
      database: database,
      clock: () => DateTime(2026, 5, 6, 9),
    );
  });

  tearDown(() async {
    await database.close();
  });

  test("ensureSeeded inserts demo data once", () async {
    expect(await service.ensureSeeded(), isTrue);
    expect(await _count(database, "menu_items"), 4);
    expect(await _count(database, "materials"), 8);
    expect(await _count(database, "orders"), 4);
    expect(await _count(database, "daily_summaries"), 2);
    expect(await _count(database, "demo_seed_markers"), 1);

    expect(await service.ensureSeeded(), isFalse);
    expect(await _count(database, "menu_items"), 4);
    expect(await _count(database, "orders"), 4);
  });

  test(
    "resetAndSeed clears user changes and restores the demo dataset",
    () async {
      await service.ensureSeeded();
      await database.customInsert("""
INSERT INTO menu_items (
  id, user_id, name, category_id, price, description, is_available,
  display_order, image_url, created_at, updated_at
) VALUES (
  'custom-menu', 'demo-user', 'Custom', 'menu-cat-main', 999, NULL, 1,
  99, NULL, '2026-05-06T09:00:00.000', '2026-05-06T09:00:00.000'
)
""");
      expect(await _count(database, "menu_items"), 5);

      await service.resetAndSeed();
      expect(await _count(database, "menu_items"), 4);
      expect(await _count(database, "demo_seed_markers"), 1);
    },
  );
}

Future<int> _count(YataDemoDatabase database, String tableName) async {
  final row = await database
      .customSelect('SELECT COUNT(*) AS count FROM "$tableName"')
      .getSingle();
  return row.read<int>("count");
}
