import "package:drift/native.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:yata/app/wiring/override_demo.dart";
import "package:yata/app/wiring/provider.dart";
import "package:yata/core/contracts/export/export_contracts.dart";
import "package:yata/features/auth/presentation/providers/auth_providers.dart";
import "package:yata/features/auth/repositories/demo_auth_repository.dart";
import "package:yata/infra/local/database/yata_demo_database.dart";
import "package:yata/infra/local/database/yata_demo_database_provider.dart";
import "package:yata/infra/local/demo/demo_seed_service.dart";

void main() {
  test(
    "demo runtime wires seeded Drift data, no-op realtime, and local CSV export",
    () async {
      final YataDemoDatabase database = YataDemoDatabase(
        NativeDatabase.memory(),
      );
      final ProviderContainer container = ProviderContainer(
        overrides: buildDemoOverrides(
          extra: <Override>[
            yataDemoDatabaseProvider.overrideWithValue(database),
          ],
        ),
      );
      addTearDown(container.dispose);
      addTearDown(database.close);

      await DemoSeedService(
        database: database,
        clock: () => DateTime(2026, 5, 6, 9),
      ).ensureSeeded();

      container.read(authStateNotifierProvider);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      expect(
        container.read(currentUserIdProvider),
        DemoAuthRepository.demoUserId,
      );

      final inventoryService = container.read(inventoryServiceProvider);
      final menuService = container.read(menuServiceProvider);
      final orderManagementService = container.read(
        orderManagementServiceProvider,
      );

      await inventoryService.enableRealtimeFeatures();
      await menuService.enableRealtimeFeatures();
      await orderManagementService.enableRealtimeFeatures();

      expect(inventoryService.isRealtimeConnected(), isTrue);
      expect(menuService.isRealtimeConnected(), isTrue);
      expect(orderManagementService.isRealtimeConnected(), isTrue);

      expect(
        await inventoryService.getMaterialsByCategory(null),
        hasLength(greaterThanOrEqualTo(8)),
      );
      expect(
        await menuService.getMenuItemsByCategory(null),
        hasLength(greaterThanOrEqualTo(4)),
      );
      expect(
        await container.read(orderRepositoryProvider).findRecentOrders(),
        hasLength(greaterThanOrEqualTo(3)),
      );

      final CsvExportResult export = await container
          .read(csvExportServiceProvider)
          .exportSalesLineItems(
            dateFrom: DateTime(2026, 5, 5),
            dateTo: DateTime(2026, 5, 6),
            organizationId: "demo-org",
            locationId: "demo-location",
          );

      expect(export.dataset, CsvExportDataset.salesLineItems);
      expect(export.rowCount, 6);
      expect(export.fileName, "sales_line_items_20260505_20260506.csv");
    },
  );
}
