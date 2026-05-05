import "package:drift/native.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:yata/app/wiring/override_demo.dart";
import "package:yata/app/wiring/provider.dart";
import "package:yata/core/constants/enums.dart";
import "package:yata/core/constants/query_types.dart";
import "package:yata/features/inventory/models/inventory_model.dart"
    as inventory;
import "package:yata/features/order/models/order_model.dart" as order;
import "package:yata/infra/local/database/drift_crud_repository.dart";
import "package:yata/infra/local/database/yata_demo_database.dart";
import "package:yata/infra/local/database/yata_demo_database_provider.dart";

void main() {
  group("DriftCrudRepository", () {
    late YataDemoDatabase database;
    late DriftCrudRepository<inventory.Material> materialRepository;
    late DriftCrudRepository<order.OrderItem> orderItemRepository;

    setUp(() {
      database = YataDemoDatabase(NativeDatabase.memory());
      materialRepository = DriftCrudRepository<inventory.Material>(
        database: database,
        tableName: "materials",
        fromJson: inventory.Material.fromJson,
        currentUserId: () => demoUserId,
      );
      orderItemRepository = DriftCrudRepository<order.OrderItem>(
        database: database,
        tableName: "order_items",
        fromJson: order.OrderItem.fromJson,
        currentUserId: () => demoUserId,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test(
      "creates, reads, updates, filters, counts, and deletes demo rows",
      () async {
        final DateTime now = DateTime.utc(2026, 5, 5, 10);
        final inventory.Material? created = await materialRepository.create(
          inventory.Material(
            name: "Chicken",
            categoryId: "cat-meat",
            unitType: UnitType.gram,
            currentStock: 12.5,
            alertThreshold: 5,
            criticalThreshold: 2,
            createdAt: now,
            updatedAt: now,
          ),
        );

        expect(created, isNotNull);
        expect(created!.id, isNotNull);
        expect(created.userId, demoUserId);
        expect(created.createdAt?.toIso8601String(), now.toIso8601String());

        final inventory.Material? updated = await materialRepository.updateById(
          created.id!,
          <String, dynamic>{"current_stock": 4.5},
        );
        expect(updated?.currentStock, 4.5);

        await materialRepository.bulkCreate(<inventory.Material>[
          inventory.Material(
            name: "Beef",
            categoryId: "cat-meat",
            unitType: UnitType.gram,
            currentStock: 3,
            alertThreshold: 5,
            criticalThreshold: 2,
          ),
          inventory.Material(
            name: "Rice",
            categoryId: "cat-grain",
            unitType: UnitType.kilogram,
            currentStock: 20,
            alertThreshold: 6,
            criticalThreshold: 2,
          ),
        ]);

        final List<inventory.Material> meatMaterials = await materialRepository
            .find(
              filters: <QueryFilter>[
                QueryConditionBuilder.eq("category_id", "cat-meat"),
              ],
              orderBy: <OrderByCondition>[
                const OrderByCondition(column: "current_stock"),
              ],
            );
        expect(
          meatMaterials.map((inventory.Material material) => material.name),
          <String>["Beef", "Chicken"],
        );

        final List<inventory.Material> keywordResults = await materialRepository
            .find(
              filters: <QueryFilter>[
                QueryConditionBuilder.ilike("name", "%rice%"),
              ],
            );
        expect(keywordResults.single.name, "Rice");

        final List<inventory.Material> orResults = await materialRepository
            .find(
              filters: <QueryFilter>[
                QueryConditionBuilder.or(<QueryFilter>[
                  QueryConditionBuilder.eq("name", "Chicken"),
                  QueryConditionBuilder.eq("name", "Rice"),
                ]),
              ],
              orderBy: <OrderByCondition>[
                const OrderByCondition(column: "name"),
              ],
            );
        expect(
          orResults.map((inventory.Material material) => material.name),
          <String>["Chicken", "Rice"],
        );

        expect(await materialRepository.count(), 3);

        await materialRepository.deleteById(created.id!);
        expect(await materialRepository.getById(created.id!), isNull);
        expect(await materialRepository.count(), 2);
      },
    );

    test("round-trips JSON map columns", () async {
      final order.OrderItem? created = await orderItemRepository.create(
        order.OrderItem(
          orderId: "order-1",
          menuItemId: "menu-1",
          quantity: 2,
          unitPrice: 500,
          subtotal: 1000,
          selectedOptions: <String, String>{"sauce": "mild"},
          createdAt: DateTime.utc(2026, 5, 5, 11),
        ),
      );

      expect(created?.selectedOptions, <String, String>{"sauce": "mild"});

      final order.OrderItem? found = await orderItemRepository.getById(
        created!.id!,
      );
      expect(found?.selectedOptions, <String, String>{"sauce": "mild"});
    });
  });

  test("demo overrides wire feature repositories to Drift", () async {
    final YataDemoDatabase overrideDatabase = YataDemoDatabase(
      NativeDatabase.memory(),
    );
    final ProviderContainer container = ProviderContainer(
      overrides: buildDemoOverrides(
        extra: <Override>[
          yataDemoDatabaseProvider.overrideWithValue(overrideDatabase),
        ],
      ),
    );
    addTearDown(container.dispose);
    addTearDown(overrideDatabase.close);

    final materialRepo = container.read(materialRepositoryProvider);
    final inventory.Material? created = await materialRepo.create(
      inventory.Material(
        name: "Demo Lettuce",
        categoryId: "cat-vegetable",
        unitType: UnitType.piece,
        currentStock: 8,
        alertThreshold: 3,
        criticalThreshold: 1,
      ),
    );

    expect(created?.userId, demoUserId);
    expect(await materialRepo.getById(created!.id!), isNotNull);
  });
}
