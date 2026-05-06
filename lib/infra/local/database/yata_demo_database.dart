import "package:drift/drift.dart";

import "../../../core/constants/enums.dart";
import "type_converters.dart";

part "yata_demo_database.g.dart";

const String demoUserId = "demo-user";

int _localIdSequence = 0;

String _createLocalId() {
  final int timestamp = DateTime.now().microsecondsSinceEpoch;
  return "local-$timestamp-${_localIdSequence++}";
}

mixin DemoEntityColumns on Table {
  TextColumn get id => text().clientDefault(_createLocalId)();

  TextColumn get userId =>
      text().named("user_id").withDefault(const Constant(demoUserId))();
}

mixin TimestampColumns on Table {
  DateTimeColumn get createdAt => dateTime().named("created_at").nullable()();

  DateTimeColumn get updatedAt => dateTime().named("updated_at").nullable()();
}

@DataClassName("MaterialCategoryRow")
class MaterialCategories extends Table
    with DemoEntityColumns, TimestampColumns {
  TextColumn get name => text()();

  IntColumn get displayOrder => integer().named("display_order")();

  TextColumn get code => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("MaterialRow")
class Materials extends Table with DemoEntityColumns, TimestampColumns {
  TextColumn get name => text()();

  TextColumn get categoryId => text().named("category_id")();

  TextColumn get unitType =>
      text().named("unit_type").map(const UnitTypeConverter())();

  RealColumn get currentStock => real().named("current_stock")();

  RealColumn get alertThreshold => real().named("alert_threshold")();

  RealColumn get criticalThreshold => real().named("critical_threshold")();

  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("RecipeRow")
class Recipes extends Table with DemoEntityColumns, TimestampColumns {
  TextColumn get menuItemId => text().named("menu_item_id")();

  TextColumn get materialId => text().named("material_id")();

  RealColumn get requiredAmount => real().named("required_amount")();

  BoolColumn get isOptional => boolean().named("is_optional")();

  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("SupplierRow")
class Suppliers extends Table with DemoEntityColumns, TimestampColumns {
  TextColumn get name => text()();

  TextColumn get contactInfo => text().named("contact_info")();

  TextColumn get notes => text().nullable()();

  BoolColumn get isActive =>
      boolean().named("is_active").withDefault(const Constant(true))();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("StockTransactionRow")
class StockTransactions extends Table with DemoEntityColumns, TimestampColumns {
  TextColumn get materialId => text().named("material_id")();

  TextColumn get transactionType =>
      text().named("transaction_type").map(const TransactionTypeConverter())();

  RealColumn get changeAmount => real().named("change_amount")();

  TextColumn get referenceType => text()
      .named("reference_type")
      .map(const ReferenceTypeConverter())
      .nullable()();

  TextColumn get referenceId => text().named("reference_id").nullable()();

  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("PurchaseRow")
class Purchases extends Table with DemoEntityColumns, TimestampColumns {
  DateTimeColumn get purchaseDate => dateTime().named("purchase_date")();

  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("PurchaseItemRow")
class PurchaseItems extends Table with DemoEntityColumns {
  TextColumn get purchaseId => text().named("purchase_id")();

  TextColumn get materialId => text().named("material_id")();

  RealColumn get quantity => real()();

  DateTimeColumn get createdAt => dateTime().named("created_at").nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("StockAdjustmentRow")
class StockAdjustments extends Table with DemoEntityColumns, TimestampColumns {
  TextColumn get materialId => text().named("material_id")();

  RealColumn get adjustmentAmount => real().named("adjustment_amount")();

  DateTimeColumn get adjustedAt => dateTime().named("adjusted_at")();

  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("MenuCategoryRow")
class MenuCategories extends Table with DemoEntityColumns, TimestampColumns {
  TextColumn get name => text()();

  IntColumn get displayOrder => integer().named("display_order")();

  TextColumn get code => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("MenuItemRow")
class MenuItems extends Table with DemoEntityColumns, TimestampColumns {
  TextColumn get name => text()();

  TextColumn get categoryId => text().named("category_id")();

  IntColumn get price => integer()();

  TextColumn get description => text().nullable()();

  BoolColumn get isAvailable =>
      boolean().named("is_available").withDefault(const Constant(true))();

  IntColumn get displayOrder => integer().named("display_order")();

  TextColumn get imageUrl => text().named("image_url").nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("OrderRow")
class Orders extends Table with DemoEntityColumns, TimestampColumns {
  IntColumn get totalAmount => integer().named("total_amount")();

  TextColumn get orderNumber => text().named("order_number").nullable()();

  BoolColumn get isCart =>
      boolean().named("is_cart").withDefault(const Constant(false))();

  TextColumn get status => text()
      .map(const OrderStatusConverter())
      .withDefault(Constant<String>(OrderStatus.inProgress.value))();

  TextColumn get paymentMethod =>
      text().named("payment_method").map(const PaymentMethodConverter())();

  IntColumn get discountAmount =>
      integer().named("discount_amount").withDefault(const Constant(0))();

  TextColumn get customerName => text().named("customer_name").nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get orderedAt => dateTime().named("ordered_at")();

  DateTimeColumn get startedPreparingAt =>
      dateTime().named("started_preparing_at").nullable()();

  DateTimeColumn get readyAt => dateTime().named("ready_at").nullable()();

  DateTimeColumn get completedAt =>
      dateTime().named("completed_at").nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("OrderItemRow")
class OrderItems extends Table with DemoEntityColumns {
  TextColumn get orderId => text().named("order_id")();

  TextColumn get menuItemId => text().named("menu_item_id")();

  IntColumn get quantity => integer()();

  IntColumn get unitPrice => integer().named("unit_price")();

  IntColumn get subtotal => integer()();

  TextColumn get selectedOptions => text()
      .named("selected_options")
      .map(const StringMapJsonConverter())
      .nullable()();

  TextColumn get specialRequest => text().named("special_request").nullable()();

  DateTimeColumn get createdAt => dateTime().named("created_at").nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("DailySummaryRow")
class DailySummaries extends Table with DemoEntityColumns, TimestampColumns {
  DateTimeColumn get summaryDate => dateTime().named("summary_date")();

  IntColumn get totalOrders => integer().named("total_orders")();

  IntColumn get completedOrders => integer().named("completed_orders")();

  IntColumn get pendingOrders => integer().named("pending_orders")();

  IntColumn get totalRevenue => integer().named("total_revenue")();

  IntColumn get averagePrepTimeMinutes =>
      integer().named("average_prep_time_minutes").nullable()();

  TextColumn get mostPopularItemId =>
      text().named("most_popular_item_id").nullable()();

  IntColumn get mostPopularItemCount =>
      integer().named("most_popular_item_count")();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName("DemoSeedMarkerRow")
class DemoSeedMarkers extends Table {
  TextColumn get seedKey => text().named("seed_key")();

  IntColumn get seedVersion => integer().named("seed_version")();

  DateTimeColumn get appliedAt => dateTime().named("applied_at")();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{seedKey};
}

@DriftDatabase(
  tables: <Type>[
    MaterialCategories,
    Materials,
    Recipes,
    Suppliers,
    StockTransactions,
    Purchases,
    PurchaseItems,
    StockAdjustments,
    MenuCategories,
    MenuItems,
    Orders,
    OrderItems,
    DailySummaries,
    DemoSeedMarkers,
  ],
)
class YataDemoDatabase extends _$YataDemoDatabase {
  YataDemoDatabase(QueryExecutor executor) : super(executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator migrator) => migrator.createAll(),
    onUpgrade: (Migrator migrator, int from, int to) async {
      if (from < 2) {
        await migrator.createTable(demoSeedMarkers);
      }
    },
  );
}
