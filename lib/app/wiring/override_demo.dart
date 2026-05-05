import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../core/base/base_model.dart";
import "../../features/analytics/models/analytics_model.dart";
import "../../features/auth/models/auth_config.dart";
import "../../features/auth/models/auth_state.dart";
import "../../features/auth/repositories/demo_auth_repository.dart";
import "../../features/auth/services/auth_service.dart";
import "../../features/inventory/models/inventory_model.dart";
import "../../features/inventory/models/supplier_model.dart";
import "../../features/inventory/models/transaction_model.dart";
import "../../features/inventory/repositories/material_category_repository.dart";
import "../../features/inventory/repositories/material_repository.dart";
import "../../features/inventory/repositories/purchase_item_repository.dart";
import "../../features/inventory/repositories/purchase_repository.dart";
import "../../features/inventory/repositories/recipe_repository.dart";
import "../../features/inventory/repositories/stock_adjustment_repository.dart";
import "../../features/inventory/repositories/stock_transaction_repository.dart";
import "../../features/inventory/repositories/supplier_repository.dart";
import "../../features/menu/models/menu_model.dart";
import "../../features/menu/repositories/menu_category_repository.dart";
import "../../features/menu/repositories/menu_item_repository.dart";
import "../../features/order/models/order_model.dart";
import "../../features/order/repositories/order_item_repository.dart";
import "../../features/order/repositories/order_repository.dart";
import "../../infra/local/database/drift_crud_repository.dart";
import "../../infra/local/database/yata_demo_database_provider.dart";
import "../../infra/local/export/local_csv_export_jobs_repository.dart";
import "../../infra/local/export/local_csv_export_repository.dart";
import "../../infra/realtime/noop_realtime_manager.dart";
import "provider.dart";

/// デモ展示用 runtime の設定。
///
/// 標準起動はローカル完結のデモアプリとして扱う。Supabase 経路を使う場合は
/// `--dart-define=YATA_DEMO_MODE=false` を指定して起動する。
class DemoRuntimeConfig {
  const DemoRuntimeConfig._();

  static const String dartDefineName = "YATA_DEMO_MODE";

  static const bool isEnabled = bool.fromEnvironment(
    dartDefineName,
    defaultValue: true,
  );
}

/// デモ展示用 ProviderScope overrides。
///
/// 固定デモ認証と Drift repository を標準で差し替える。no-op Realtime、
/// local CSV export は後続タスクでここに追加する。
List<Override> buildDemoOverrides({
  Iterable<Override> extra = const <Override>[],
}) {
  final DemoAuthRepository authRepository = DemoAuthRepository();

  return <Override>[
    authRepositoryProvider.overrideWithValue(authRepository),
    authServiceProvider.overrideWith(
      (Ref ref) => AuthService(
        logger: ref.read(loggerProvider),
        authRepository: authRepository,
        config: AuthConfig(
          supabaseUrl: "https://demo.invalid",
          supabaseAnonKey: "demo-anon-key",
          callbackUrl: "http://localhost/demo-auth-callback",
          platform: AuthPlatform.desktop,
        ),
        initialState: AuthState.authenticated(authRepository.currentUser),
        markInitialSessionReady: true,
      ),
    ),
    realtimeManagerProvider.overrideWithValue(NoopRealtimeManager()),
    csvExportRepositoryProvider.overrideWith(
      (Ref ref) => LocalCsvExportRepository(
        database: ref.read(yataDemoDatabaseProvider),
      ),
    ),
    csvExportJobsRepositoryProvider.overrideWith(
      (Ref ref) => LocalCsvExportJobsRepository(),
    ),
    materialRepositoryProvider.overrideWith(
      (Ref ref) => MaterialRepository(
        delegate: _driftRepository<Material>(
          ref: ref,
          tableName: "materials",
          fromJson: Material.fromJson,
        ),
      ),
    ),
    materialCategoryRepositoryProvider.overrideWith(
      (Ref ref) => MaterialCategoryRepository(
        delegate: _driftRepository<MaterialCategory>(
          ref: ref,
          tableName: "material_categories",
          fromJson: MaterialCategory.fromJson,
        ),
      ),
    ),
    recipeRepositoryProvider.overrideWith(
      (Ref ref) => RecipeRepository(
        delegate: _driftRepository<Recipe>(
          ref: ref,
          tableName: "recipes",
          fromJson: Recipe.fromJson,
        ),
      ),
    ),
    supplierRepositoryProvider.overrideWith(
      (Ref ref) => SupplierRepository(
        delegate: _driftRepository<Supplier>(
          ref: ref,
          tableName: "suppliers",
          fromJson: Supplier.fromJson,
        ),
      ),
    ),
    stockAdjustmentRepositoryProvider.overrideWith(
      (Ref ref) => StockAdjustmentRepository(
        delegate: _driftRepository<StockAdjustment>(
          ref: ref,
          tableName: "stock_adjustments",
          fromJson: StockAdjustment.fromJson,
        ),
      ),
    ),
    stockTransactionRepositoryProvider.overrideWith(
      (Ref ref) => StockTransactionRepository(
        delegate: _driftRepository<StockTransaction>(
          ref: ref,
          tableName: "stock_transactions",
          fromJson: StockTransaction.fromJson,
        ),
      ),
    ),
    purchaseRepositoryProvider.overrideWith(
      (Ref ref) => PurchaseRepository(
        delegate: _driftRepository<Purchase>(
          ref: ref,
          tableName: "purchases",
          fromJson: Purchase.fromJson,
        ),
      ),
    ),
    purchaseItemRepositoryProvider.overrideWith(
      (Ref ref) => PurchaseItemRepository(
        delegate: _driftRepository<PurchaseItem>(
          ref: ref,
          tableName: "purchase_items",
          fromJson: PurchaseItem.fromJson,
        ),
      ),
    ),
    menuItemRepositoryProvider.overrideWith(
      (Ref ref) => MenuItemRepository(
        delegate: _driftRepository<MenuItem>(
          ref: ref,
          tableName: "menu_items",
          fromJson: MenuItem.fromJson,
        ),
      ),
    ),
    menuCategoryRepositoryProvider.overrideWith(
      (Ref ref) => MenuCategoryRepository(
        delegate: _driftRepository<MenuCategory>(
          ref: ref,
          tableName: "menu_categories",
          fromJson: MenuCategory.fromJson,
        ),
      ),
    ),
    orderRepositoryProvider.overrideWith(
      (Ref ref) => OrderRepository(
        logger: ref.read(loggerProvider),
        delegate: _driftRepository<Order>(
          ref: ref,
          tableName: "orders",
          fromJson: Order.fromJson,
        ),
        identifierGenerator: ref.read(orderIdentifierGeneratorProvider),
      ),
    ),
    orderItemRepositoryProvider.overrideWith(
      (Ref ref) => OrderItemRepository(
        delegate: _driftRepository<OrderItem>(
          ref: ref,
          tableName: "order_items",
          fromJson: OrderItem.fromJson,
        ),
      ),
    ),
    dailySummaryRawRepositoryProvider.overrideWith(
      (Ref ref) => _driftRepository<DailySummary>(
        ref: ref,
        tableName: "daily_summaries",
        fromJson: DailySummary.fromJson,
      ),
    ),
    ...extra,
  ];
}

DriftCrudRepository<T> _driftRepository<T extends BaseModel>({
  required Ref ref,
  required String tableName,
  required T Function(Map<String, dynamic>) fromJson,
}) {
  return DriftCrudRepository<T>(
    database: ref.read(yataDemoDatabaseProvider),
    tableName: tableName,
    fromJson: fromJson,
    currentUserId: () => DemoAuthRepository.demoUserId,
  );
}
