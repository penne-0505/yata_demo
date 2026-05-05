import "package:drift/drift.dart";

import "../../../core/constants/enums.dart";
import "../database/yata_demo_database.dart";

typedef DemoClock = DateTime Function();

class DemoSeedService {
  DemoSeedService({required YataDemoDatabase database, DemoClock? clock})
    : _database = database,
      _clock = clock ?? DateTime.now;

  static const String seedKey = "yata-demo-core";
  static const int seedVersion = 1;

  final YataDemoDatabase _database;
  final DemoClock _clock;

  Future<bool> ensureSeeded() async {
    final List<DemoSeedMarkerRow> markers = await _database
        .customSelect(
          'SELECT seed_key, seed_version, applied_at FROM "demo_seed_markers" '
          'WHERE seed_key = ? LIMIT 1',
          variables: <Variable>[Variable<String>(seedKey)],
        )
        .map(
          (QueryRow row) => DemoSeedMarkerRow(
            seedKey: row.read<String>("seed_key"),
            seedVersion: row.read<int>("seed_version"),
            appliedAt: _readDate(row.data["applied_at"]) ?? _clock(),
          ),
        )
        .get();

    if (markers.isNotEmpty && markers.first.seedVersion == seedVersion) {
      return false;
    }

    await resetAndSeed();
    return true;
  }

  Future<void> resetAndSeed() async {
    await _database.transaction(() async {
      await clearDemoData(includeMarker: true);
      await _insertSeedData();
      await _markSeeded();
    });
  }

  Future<void> clearDemoData({bool includeMarker = true}) async {
    for (final String tableName in <String>[
      "order_items",
      "orders",
      "recipes",
      "menu_items",
      "menu_categories",
      "purchase_items",
      "purchases",
      "stock_transactions",
      "stock_adjustments",
      "suppliers",
      "materials",
      "material_categories",
      "daily_summaries",
      if (includeMarker) "demo_seed_markers",
    ]) {
      await _database.customUpdate('DELETE FROM "$tableName"');
    }
  }

  Future<void> _insertSeedData() async {
    final DateTime now = _clock();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = today.subtract(const Duration(days: 1));
    final DateTime twoDaysAgo = today.subtract(const Duration(days: 2));

    await _insertRows("material_categories", <Map<String, Object?>>[
      _baseRow("mat-cat-protein", now)..addAll(<String, Object?>{
        "name": "肉・たんぱく",
        "display_order": 1,
        "code": "protein",
      }),
      _baseRow("mat-cat-vegetable", now)..addAll(<String, Object?>{
        "name": "野菜",
        "display_order": 2,
        "code": "vegetable",
      }),
      _baseRow("mat-cat-staple", now)..addAll(<String, Object?>{
        "name": "主食・麺",
        "display_order": 3,
        "code": "staple",
      }),
      _baseRow("mat-cat-seasoning", now)..addAll(<String, Object?>{
        "name": "調味料",
        "display_order": 4,
        "code": "seasoning",
      }),
      _baseRow("mat-cat-packaging", now)..addAll(<String, Object?>{
        "name": "包材",
        "display_order": 5,
        "code": "packaging",
      }),
    ]);

    await _insertRows("materials", <Map<String, Object?>>[
      _material(
        "mat-chicken",
        "鶏もも肉",
        "mat-cat-protein",
        UnitType.gram,
        5400,
        1500,
        800,
        now,
      ),
      _material(
        "mat-pork",
        "豚こま肉",
        "mat-cat-protein",
        UnitType.gram,
        3200,
        1200,
        600,
        now,
      ),
      _material(
        "mat-cabbage",
        "キャベツ",
        "mat-cat-vegetable",
        UnitType.gram,
        4600,
        1800,
        900,
        now,
      ),
      _material(
        "mat-noodle",
        "焼きそば麺",
        "mat-cat-staple",
        UnitType.gram,
        6800,
        2500,
        1200,
        now,
      ),
      _material(
        "mat-sauce",
        "屋台ソース",
        "mat-cat-seasoning",
        UnitType.liter,
        7.5,
        2,
        1,
        now,
      ),
      _material(
        "mat-miso",
        "味噌",
        "mat-cat-seasoning",
        UnitType.gram,
        2200,
        800,
        400,
        now,
      ),
      _material(
        "mat-tea",
        "緑茶ボトル",
        "mat-cat-staple",
        UnitType.piece,
        36,
        12,
        6,
        now,
      ),
      _material(
        "mat-bowl",
        "紙容器",
        "mat-cat-packaging",
        UnitType.piece,
        120,
        40,
        20,
        now,
      ),
    ]);

    await _insertRows("suppliers", <Map<String, Object?>>[
      _baseRow("supplier-central", now)..addAll(<String, Object?>{
        "name": "中央食品",
        "contact_info": "03-0000-1111 / central-foods@example.invalid",
        "notes": "肉類・麺類の定期仕入れ",
        "is_active": true,
      }),
      _baseRow("supplier-local", now)..addAll(<String, Object?>{
        "name": "駅前青果",
        "contact_info": "03-0000-2222",
        "notes": "野菜のスポット仕入れ",
        "is_active": true,
      }),
    ]);

    await _insertRows("menu_categories", <Map<String, Object?>>[
      _baseRow("menu-cat-main", now)..addAll(<String, Object?>{
        "name": "主菜",
        "display_order": 1,
        "code": "main",
      }),
      _baseRow("menu-cat-side", now)..addAll(<String, Object?>{
        "name": "汁物・副菜",
        "display_order": 2,
        "code": "side",
      }),
      _baseRow("menu-cat-drink", now)..addAll(<String, Object?>{
        "name": "ドリンク",
        "display_order": 3,
        "code": "drink",
      }),
    ]);

    await _insertRows("menu_items", <Map<String, Object?>>[
      _menuItem(
        "menu-yakisoba",
        "屋台焼きそば",
        "menu-cat-main",
        700,
        1,
        now,
        "定番ソース焼きそば",
      ),
      _menuItem(
        "menu-karaage",
        "唐揚げ弁当",
        "menu-cat-main",
        650,
        2,
        now,
        "揚げたて唐揚げと千切りキャベツ",
      ),
      _menuItem(
        "menu-tonjiru",
        "豚汁",
        "menu-cat-side",
        380,
        1,
        now,
        "具だくさんの温かい汁物",
      ),
      _menuItem("menu-tea", "緑茶", "menu-cat-drink", 200, 1, now, "ペットボトル緑茶"),
    ]);

    await _insertRows("recipes", <Map<String, Object?>>[
      _recipe(
        "recipe-yakisoba-noodle",
        "menu-yakisoba",
        "mat-noodle",
        180,
        false,
        now,
      ),
      _recipe(
        "recipe-yakisoba-cabbage",
        "menu-yakisoba",
        "mat-cabbage",
        80,
        false,
        now,
      ),
      _recipe(
        "recipe-yakisoba-pork",
        "menu-yakisoba",
        "mat-pork",
        60,
        false,
        now,
      ),
      _recipe(
        "recipe-yakisoba-sauce",
        "menu-yakisoba",
        "mat-sauce",
        0.05,
        false,
        now,
      ),
      _recipe(
        "recipe-karaage-chicken",
        "menu-karaage",
        "mat-chicken",
        180,
        false,
        now,
      ),
      _recipe(
        "recipe-karaage-cabbage",
        "menu-karaage",
        "mat-cabbage",
        50,
        false,
        now,
      ),
      _recipe("recipe-karaage-bowl", "menu-karaage", "mat-bowl", 1, false, now),
      _recipe(
        "recipe-tonjiru-pork",
        "menu-tonjiru",
        "mat-pork",
        70,
        false,
        now,
      ),
      _recipe(
        "recipe-tonjiru-miso",
        "menu-tonjiru",
        "mat-miso",
        35,
        false,
        now,
      ),
      _recipe("recipe-tea", "menu-tea", "mat-tea", 1, false, now),
    ]);

    await _insertRows("purchases", <Map<String, Object?>>[
      _baseRow("purchase-restock-1", yesterday)..addAll(<String, Object?>{
        "purchase_date": _iso(yesterday.add(const Duration(hours: 8))),
        "notes": "デモ用の朝仕入れ",
      }),
    ]);

    await _insertRows("purchase_items", <Map<String, Object?>>[
      _purchaseItem(
        "purchase-item-chicken",
        "purchase-restock-1",
        "mat-chicken",
        3000,
        yesterday,
      ),
      _purchaseItem(
        "purchase-item-noodle",
        "purchase-restock-1",
        "mat-noodle",
        4000,
        yesterday,
      ),
      _purchaseItem(
        "purchase-item-tea",
        "purchase-restock-1",
        "mat-tea",
        24,
        yesterday,
      ),
    ]);

    final DateTime order1At = yesterday.add(
      const Duration(hours: 12, minutes: 15),
    );
    final DateTime order2At = today.add(const Duration(hours: 11, minutes: 45));
    final DateTime order3At = today.add(const Duration(hours: 13, minutes: 5));

    await _insertRows("orders", <Map<String, Object?>>[
      _order(
        id: "order-demo-cart",
        totalAmount: 0,
        orderNumber: null,
        isCart: true,
        status: OrderStatus.inProgress.value,
        paymentMethod: PaymentMethod.cash.value,
        discountAmount: 0,
        orderedAt: now,
        createdAt: now,
      ),
      _order(
        id: "order-demo-1001",
        totalAmount: 1600,
        orderNumber: "D-1001",
        isCart: false,
        status: OrderStatus.completed.value,
        paymentMethod: PaymentMethod.cash.value,
        discountAmount: 0,
        orderedAt: order1At,
        startedPreparingAt: order1At.add(const Duration(minutes: 2)),
        readyAt: order1At.add(const Duration(minutes: 12)),
        completedAt: order1At.add(const Duration(minutes: 15)),
        createdAt: order1At,
        customerName: "A12",
      ),
      _order(
        id: "order-demo-1002",
        totalAmount: 1230,
        orderNumber: "D-1002",
        isCart: false,
        status: OrderStatus.completed.value,
        paymentMethod: PaymentMethod.paypay.value,
        discountAmount: 0,
        orderedAt: order2At,
        startedPreparingAt: order2At.add(const Duration(minutes: 1)),
        readyAt: order2At.add(const Duration(minutes: 9)),
        completedAt: order2At.add(const Duration(minutes: 13)),
        createdAt: order2At,
        customerName: "B04",
      ),
      _order(
        id: "order-demo-1003",
        totalAmount: 700,
        orderNumber: "D-1003",
        isCart: false,
        status: OrderStatus.inProgress.value,
        paymentMethod: PaymentMethod.cash.value,
        discountAmount: 0,
        orderedAt: order3At,
        startedPreparingAt: order3At.add(const Duration(minutes: 3)),
        createdAt: order3At,
        customerName: "C07",
      ),
    ]);

    await _insertRows("order_items", <Map<String, Object?>>[
      _orderItem(
        "order-item-1001-1",
        "order-demo-1001",
        "menu-yakisoba",
        2,
        700,
        order1At,
      ),
      _orderItem(
        "order-item-1001-2",
        "order-demo-1001",
        "menu-tea",
        1,
        200,
        order1At,
      ),
      _orderItem(
        "order-item-1002-1",
        "order-demo-1002",
        "menu-karaage",
        1,
        650,
        order2At,
      ),
      _orderItem(
        "order-item-1002-2",
        "order-demo-1002",
        "menu-tonjiru",
        1,
        380,
        order2At,
      ),
      _orderItem(
        "order-item-1002-3",
        "order-demo-1002",
        "menu-tea",
        1,
        200,
        order2At,
      ),
      _orderItem(
        "order-item-1003-1",
        "order-demo-1003",
        "menu-yakisoba",
        1,
        700,
        order3At,
      ),
    ]);

    await _insertRows("stock_transactions", <Map<String, Object?>>[
      _stockTransaction(
        "stock-tx-purchase-chicken",
        "mat-chicken",
        TransactionType.purchase,
        3000,
        ReferenceType.purchase,
        "purchase-restock-1",
        yesterday,
        "朝仕入れ",
      ),
      _stockTransaction(
        "stock-tx-purchase-noodle",
        "mat-noodle",
        TransactionType.purchase,
        4000,
        ReferenceType.purchase,
        "purchase-restock-1",
        yesterday,
        "朝仕入れ",
      ),
      _stockTransaction(
        "stock-tx-sale-1001-noodle",
        "mat-noodle",
        TransactionType.sale,
        -360,
        ReferenceType.order,
        "order-demo-1001",
        order1At,
        "焼きそば2食",
      ),
      _stockTransaction(
        "stock-tx-sale-1002-chicken",
        "mat-chicken",
        TransactionType.sale,
        -180,
        ReferenceType.order,
        "order-demo-1002",
        order2At,
        "唐揚げ弁当1食",
      ),
      _stockTransaction(
        "stock-tx-waste-sauce",
        "mat-sauce",
        TransactionType.waste,
        -0.2,
        null,
        null,
        twoDaysAgo,
        "閉店時の廃棄",
      ),
    ]);

    await _insertRows("daily_summaries", <Map<String, Object?>>[
      _dailySummary(
        id: "summary-yesterday",
        date: yesterday,
        totalOrders: 1,
        completedOrders: 1,
        pendingOrders: 0,
        totalRevenue: 1600,
        averagePrepTimeMinutes: 10,
        mostPopularItemId: "menu-yakisoba",
        mostPopularItemCount: 2,
        now: now,
      ),
      _dailySummary(
        id: "summary-today",
        date: today,
        totalOrders: 2,
        completedOrders: 1,
        pendingOrders: 1,
        totalRevenue: 1230,
        averagePrepTimeMinutes: 8,
        mostPopularItemId: "menu-yakisoba",
        mostPopularItemCount: 1,
        now: now,
      ),
    ]);
  }

  Future<void> _markSeeded() async {
    await _insert("demo_seed_markers", <String, Object?>{
      "seed_key": seedKey,
      "seed_version": seedVersion,
      "applied_at": _iso(_clock()),
    });
  }

  Map<String, Object?> _baseRow(String id, DateTime now) => <String, Object?>{
    "id": id,
    "user_id": demoUserId,
    "created_at": _iso(now),
    "updated_at": _iso(now),
  };

  Map<String, Object?> _material(
    String id,
    String name,
    String categoryId,
    UnitType unitType,
    double currentStock,
    double alertThreshold,
    double criticalThreshold,
    DateTime now,
  ) => _baseRow(id, now)
    ..addAll(<String, Object?>{
      "name": name,
      "category_id": categoryId,
      "unit_type": unitType.value,
      "current_stock": currentStock,
      "alert_threshold": alertThreshold,
      "critical_threshold": criticalThreshold,
      "notes": null,
    });

  Map<String, Object?> _menuItem(
    String id,
    String name,
    String categoryId,
    int price,
    int displayOrder,
    DateTime now,
    String description,
  ) => _baseRow(id, now)
    ..addAll(<String, Object?>{
      "name": name,
      "category_id": categoryId,
      "price": price,
      "description": description,
      "is_available": true,
      "display_order": displayOrder,
      "image_url": null,
    });

  Map<String, Object?> _recipe(
    String id,
    String menuItemId,
    String materialId,
    double requiredAmount,
    bool isOptional,
    DateTime now,
  ) => _baseRow(id, now)
    ..addAll(<String, Object?>{
      "menu_item_id": menuItemId,
      "material_id": materialId,
      "required_amount": requiredAmount,
      "is_optional": isOptional,
      "notes": null,
    });

  Map<String, Object?> _purchaseItem(
    String id,
    String purchaseId,
    String materialId,
    double quantity,
    DateTime now,
  ) => <String, Object?>{
    "id": id,
    "user_id": demoUserId,
    "purchase_id": purchaseId,
    "material_id": materialId,
    "quantity": quantity,
    "created_at": _iso(now),
  };

  Map<String, Object?> _order({
    required String id,
    required int totalAmount,
    required String? orderNumber,
    required bool isCart,
    required String status,
    required String paymentMethod,
    required int discountAmount,
    required DateTime orderedAt,
    required DateTime createdAt,
    DateTime? startedPreparingAt,
    DateTime? readyAt,
    DateTime? completedAt,
    String? customerName,
  }) => <String, Object?>{
    "id": id,
    "user_id": demoUserId,
    "total_amount": totalAmount,
    "order_number": orderNumber,
    "is_cart": isCart,
    "status": status,
    "payment_method": paymentMethod,
    "discount_amount": discountAmount,
    "customer_name": customerName,
    "notes": null,
    "ordered_at": _iso(orderedAt),
    "started_preparing_at": startedPreparingAt == null
        ? null
        : _iso(startedPreparingAt),
    "ready_at": readyAt == null ? null : _iso(readyAt),
    "completed_at": completedAt == null ? null : _iso(completedAt),
    "created_at": _iso(createdAt),
    "updated_at": _iso(createdAt),
  };

  Map<String, Object?> _orderItem(
    String id,
    String orderId,
    String menuItemId,
    int quantity,
    int unitPrice,
    DateTime createdAt,
  ) => <String, Object?>{
    "id": id,
    "user_id": demoUserId,
    "order_id": orderId,
    "menu_item_id": menuItemId,
    "quantity": quantity,
    "unit_price": unitPrice,
    "subtotal": quantity * unitPrice,
    "selected_options": null,
    "special_request": null,
    "created_at": _iso(createdAt),
  };

  Map<String, Object?> _stockTransaction(
    String id,
    String materialId,
    TransactionType transactionType,
    double changeAmount,
    ReferenceType? referenceType,
    String? referenceId,
    DateTime createdAt,
    String notes,
  ) => <String, Object?>{
    "id": id,
    "user_id": demoUserId,
    "material_id": materialId,
    "transaction_type": transactionType.value,
    "change_amount": changeAmount,
    "reference_type": referenceType?.value,
    "reference_id": referenceId,
    "notes": notes,
    "created_at": _iso(createdAt),
    "updated_at": _iso(createdAt),
  };

  Map<String, Object?> _dailySummary({
    required String id,
    required DateTime date,
    required int totalOrders,
    required int completedOrders,
    required int pendingOrders,
    required int totalRevenue,
    required int averagePrepTimeMinutes,
    required String mostPopularItemId,
    required int mostPopularItemCount,
    required DateTime now,
  }) => <String, Object?>{
    "id": id,
    "user_id": demoUserId,
    "summary_date": _iso(date),
    "total_orders": totalOrders,
    "completed_orders": completedOrders,
    "pending_orders": pendingOrders,
    "total_revenue": totalRevenue,
    "average_prep_time_minutes": averagePrepTimeMinutes,
    "most_popular_item_id": mostPopularItemId,
    "most_popular_item_count": mostPopularItemCount,
    "created_at": _iso(now),
    "updated_at": _iso(now),
  };

  Future<void> _insertRows(
    String tableName,
    List<Map<String, Object?>> rows,
  ) async {
    for (final Map<String, Object?> row in rows) {
      await _insert(tableName, row);
    }
  }

  Future<void> _insert(String tableName, Map<String, Object?> values) async {
    final List<String> columns = values.keys.toList(growable: false);
    final String placeholders = List<String>.filled(
      columns.length,
      "?",
    ).join(", ");
    await _database.customInsert(
      'INSERT INTO "$tableName" (${columns.map((String column) => '"$column"').join(", ")}) '
      "VALUES ($placeholders)",
      variables: values.values
          .map<Variable>(_variableFor)
          .toList(growable: false),
    );
  }

  Variable _variableFor(Object? value) {
    if (value is int) {
      return Variable<int>(value);
    }
    if (value is double) {
      return Variable<double>(value);
    }
    if (value is bool) {
      return Variable<bool>(value);
    }
    if (value is String) {
      return Variable<String>(value);
    }
    return Variable<Object>(value);
  }

  static DateTime? _readDate(Object? value) {
    if (value is DateTime) {
      return value;
    }
    if (value is String) {
      return DateTime.tryParse(value);
    }
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    }
    return null;
  }

  String _iso(DateTime date) => date.toIso8601String();
}
