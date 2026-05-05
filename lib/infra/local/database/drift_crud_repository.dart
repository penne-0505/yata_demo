import "dart:convert";

import "package:drift/drift.dart";

import "../../../core/base/base_model.dart";
import "../../../core/constants/query_types.dart";
import "../../../core/contracts/repositories/crud_repository.dart";
import "yata_demo_database.dart";

typedef CurrentUserIdReader = String? Function();

class DriftCrudRepository<T extends BaseModel>
    implements CrudRepository<T, String> {
  DriftCrudRepository({
    required YataDemoDatabase database,
    required String tableName,
    required T Function(Map<String, dynamic>) fromJson,
    CurrentUserIdReader? currentUserId,
    bool enableMultiTenant = true,
    String userIdColumn = "user_id",
  }) : _database = database,
       _fromJson = fromJson,
       _currentUserId = currentUserId ?? (() => demoUserId),
       _enableMultiTenant = enableMultiTenant,
       _userIdColumn = userIdColumn,
       _config = DriftTableConfig.forTable(tableName);

  final YataDemoDatabase _database;
  final T Function(Map<String, dynamic>) _fromJson;
  final CurrentUserIdReader _currentUserId;
  final bool _enableMultiTenant;
  final String _userIdColumn;
  final DriftTableConfig _config;

  @override
  Future<T?> create(T entity) async {
    final Map<String, dynamic> payload = _entityToDatabasePayload(entity);
    payload["id"] ??= _createLocalId();

    if (_enableMultiTenant) {
      final String userId = _requireCurrentUserId();
      entity.userId = userId;
      payload[_userIdColumn] = userId;
    }

    final List<String> columns = payload.keys.toList(growable: false);
    final String placeholders = List<String>.filled(
      columns.length,
      "?",
    ).join(", ");
    final List<Variable> variables = columns
        .map<Variable>((String column) => Variable<Object>(payload[column]))
        .toList(growable: false);

    await _database.customInsert(
      "INSERT INTO ${_quoteIdentifier(_config.tableName)} "
      "(${columns.map(_quoteColumn).join(", ")}) VALUES ($placeholders)",
      variables: variables,
    );

    return getById(payload["id"] as String);
  }

  @override
  Future<List<T>> bulkCreate(List<T> entities) async {
    if (entities.isEmpty) {
      return <T>[];
    }

    final List<T> created = <T>[];
    await _database.transaction(() async {
      for (final T entity in entities) {
        final T? result = await create(entity);
        if (result != null) {
          created.add(result);
        }
      }
    });
    return created;
  }

  @override
  Future<T?> getById(String id) => getByPrimaryKey(<String, dynamic>{"id": id});

  @override
  Future<T?> getByPrimaryKey(PrimaryKeyMap keyMap) async {
    final List<QueryFilter> filters = keyMap.entries
        .map<QueryFilter>(
          (MapEntry<String, dynamic> entry) =>
              QueryConditionBuilder.eq(entry.key, entry.value),
        )
        .toList(growable: true);
    final List<T> results = await find(filters: filters, limit: 1);
    return results.isEmpty ? null : results.first;
  }

  @override
  Future<T?> updateById(String id, Map<String, dynamic> updates) =>
      updateByPrimaryKey(<String, dynamic>{"id": id}, updates);

  @override
  Future<T?> updateByPrimaryKey(
    PrimaryKeyMap keyMap,
    Map<String, dynamic> updates,
  ) async {
    final Map<String, dynamic> payload = _updatesToDatabasePayload(updates);
    payload.remove(_userIdColumn);
    payload.remove("userId");

    if (payload.isEmpty) {
      return getByPrimaryKey(keyMap);
    }

    final List<QueryFilter> filters = keyMap.entries
        .map<QueryFilter>(
          (MapEntry<String, dynamic> entry) =>
              QueryConditionBuilder.eq(entry.key, entry.value),
        )
        .toList(growable: true);
    final _SqlWhere where = _buildWhere(filters);

    final List<String> columns = payload.keys.toList(growable: false);
    final String setSql = columns
        .map<String>((String column) => "${_quoteColumn(column)} = ?")
        .join(", ");
    final List<Variable> variables = <Variable>[
      ...columns.map<Variable>(
        (String column) => Variable<Object>(payload[column]),
      ),
      ...where.variables,
    ];

    await _database.customUpdate(
      "UPDATE ${_quoteIdentifier(_config.tableName)} SET $setSql ${where.sql}",
      variables: variables,
      updateKind: UpdateKind.update,
    );

    return getByPrimaryKey(keyMap);
  }

  @override
  Future<void> deleteById(String id) =>
      deleteByPrimaryKey(<String, dynamic>{"id": id});

  @override
  Future<void> deleteByPrimaryKey(PrimaryKeyMap keyMap) async {
    final List<QueryFilter> filters = keyMap.entries
        .map<QueryFilter>(
          (MapEntry<String, dynamic> entry) =>
              QueryConditionBuilder.eq(entry.key, entry.value),
        )
        .toList(growable: true);
    final _SqlWhere where = _buildWhere(filters);
    await _database.customUpdate(
      "DELETE FROM ${_quoteIdentifier(_config.tableName)} ${where.sql}",
      variables: where.variables,
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Future<void> bulkDelete(List<String> keys) async {
    if (keys.isEmpty) {
      return;
    }

    await _database.transaction(() async {
      for (final String key in keys) {
        await deleteById(key);
      }
    });
  }

  @override
  Future<List<T>> find({
    List<QueryFilter>? filters,
    List<OrderByCondition>? orderBy,
    int limit = 100,
    int offset = 0,
  }) async {
    if (limit <= 0) {
      throw ArgumentError("limit must be greater than zero.");
    }
    if (offset < 0) {
      throw ArgumentError("offset must be zero or greater.");
    }

    final _SqlWhere where = _buildWhere(filters);
    final String orderSql = _buildOrderBy(orderBy);
    final List<QueryRow> rows = await _database
        .customSelect(
          "SELECT * FROM ${_quoteIdentifier(_config.tableName)} "
          "${where.sql} $orderSql LIMIT ? OFFSET ?",
          variables: <Variable>[
            ...where.variables,
            Variable<int>(limit),
            Variable<int>(offset),
          ],
        )
        .get();

    return rows
        .map<Map<String, dynamic>>((QueryRow row) => _rowToModelJson(row.data))
        .map<T>(_fromJson)
        .toList(growable: false);
  }

  @override
  Future<int> count({List<QueryFilter>? filters}) async {
    final _SqlWhere where = _buildWhere(filters);
    final QueryRow row = await _database
        .customSelect(
          "SELECT COUNT(*) AS count FROM ${_quoteIdentifier(_config.tableName)} ${where.sql}",
          variables: where.variables,
        )
        .getSingle();
    return row.read<int>("count");
  }

  Map<String, dynamic> _entityToDatabasePayload(T entity) =>
      _modelJsonToDatabasePayload(entity.toJson(), forInsert: true);

  Map<String, dynamic> _updatesToDatabasePayload(
    Map<String, dynamic> updates,
  ) => _modelJsonToDatabasePayload(updates, forInsert: false);

  Map<String, dynamic> _modelJsonToDatabasePayload(
    Map<String, dynamic> json, {
    required bool forInsert,
  }) {
    final Map<String, dynamic> payload = <String, dynamic>{};

    for (final MapEntry<String, dynamic> entry in json.entries) {
      final String? column = _config.columnForJsonKey(entry.key);
      if (column == null || !_config.hasColumn(column)) {
        continue;
      }
      if (forInsert &&
          entry.value == null &&
          _config.omitNullInsertColumns.contains(column)) {
        continue;
      }
      payload[column] = _toDatabaseValue(column, entry.value);
    }

    return payload;
  }

  dynamic _toDatabaseValue(String column, dynamic value) {
    if (value == null) {
      return null;
    }
    if (_config.jsonColumns.contains(column)) {
      return value is String ? value : jsonEncode(value);
    }
    if (_config.dateColumns.contains(column)) {
      if (value is DateTime) {
        return value.toIso8601String();
      }
      return value.toString();
    }
    return value;
  }

  Map<String, dynamic> _rowToModelJson(Map<String, dynamic> row) {
    final Map<String, dynamic> json = <String, dynamic>{};

    for (final MapEntry<String, dynamic> entry in row.entries) {
      final String column = entry.key;
      final String jsonKey = _config.jsonKeyForColumn(column);
      json[jsonKey] = _fromDatabaseValue(column, entry.value);
    }

    return json;
  }

  dynamic _fromDatabaseValue(String column, dynamic value) {
    if (value == null) {
      return null;
    }
    if (_config.boolColumns.contains(column)) {
      if (value is bool) {
        return value;
      }
      if (value is num) {
        return value != 0;
      }
      return value.toString() == "1" ||
          value.toString().toLowerCase() == "true";
    }
    if (_config.dateColumns.contains(column)) {
      if (value is DateTime) {
        return value.toIso8601String();
      }
      if (value is num) {
        final int raw = value.toInt();
        final int milliseconds = raw > 1000000000000 ? raw : raw * 1000;
        return DateTime.fromMillisecondsSinceEpoch(
          milliseconds,
        ).toIso8601String();
      }
      return value.toString();
    }
    if (_config.jsonColumns.contains(column)) {
      if (value is String) {
        final Object? decoded = jsonDecode(value);
        if (decoded is Map<String, dynamic>) {
          return decoded;
        }
        if (decoded is Map) {
          return decoded.map<String, dynamic>(
            (Object? key, Object? val) =>
                MapEntry<String, dynamic>(key.toString(), val),
          );
        }
      }
      return value;
    }
    return value;
  }

  _SqlWhere _buildWhere(List<QueryFilter>? filters) {
    final List<QueryFilter> filtersWithUser = _addUserIdFilter(filters);
    if (filtersWithUser.isEmpty) {
      return const _SqlWhere("", <Variable>[]);
    }

    final _SqlExpression expression = _buildConditionGroup(
      filtersWithUser,
      LogicalOperator.and,
    );
    return _SqlWhere("WHERE ${expression.sql}", expression.variables);
  }

  List<QueryFilter> _addUserIdFilter(List<QueryFilter>? filters) {
    final List<QueryFilter> result = filters?.toList() ?? <QueryFilter>[];
    if (!_enableMultiTenant) {
      return result;
    }
    if (!_containsColumn(result, _userIdColumn)) {
      result.add(
        QueryConditionBuilder.eq(_userIdColumn, _requireCurrentUserId()),
      );
    }
    return result;
  }

  bool _containsColumn(List<QueryFilter> filters, String column) {
    for (final QueryFilter filter in filters) {
      if (filter is FilterCondition && filter.column == column) {
        return true;
      }
      if (filter is LogicalCondition &&
          _containsColumn(filter.conditions, column)) {
        return true;
      }
    }
    return false;
  }

  _SqlExpression _buildConditionGroup(
    List<QueryFilter> conditions,
    LogicalOperator operator,
  ) {
    final List<_SqlExpression> expressions = conditions
        .map<_SqlExpression>(_buildCondition)
        .toList(growable: false);
    final String joiner = operator == LogicalOperator.or ? " OR " : " AND ";
    return _SqlExpression(
      expressions
          .map<String>((_SqlExpression expression) => "(${expression.sql})")
          .join(joiner),
      expressions
          .expand<Variable>((_SqlExpression expression) => expression.variables)
          .toList(growable: false),
    );
  }

  _SqlExpression _buildCondition(QueryFilter filter) {
    if (filter is FilterCondition) {
      return _buildFilterCondition(filter);
    }
    if (filter is LogicalCondition) {
      return _buildConditionGroup(filter.conditions, filter.operator);
    }
    throw UnsupportedError("Unsupported query filter: ${filter.runtimeType}");
  }

  _SqlExpression _buildFilterCondition(FilterCondition condition) {
    final String column = _normalizeColumn(condition.column);
    final String quoted = _quoteColumn(column);
    final dynamic value = _toDatabaseValue(column, condition.value);

    switch (condition.operator) {
      case FilterOperator.eq:
        return _SqlExpression("$quoted = ?", <Variable>[
          Variable<Object>(value),
        ]);
      case FilterOperator.neq:
        return _SqlExpression("$quoted != ?", <Variable>[
          Variable<Object>(value),
        ]);
      case FilterOperator.gt:
        return _SqlExpression("$quoted > ?", <Variable>[
          Variable<Object>(value),
        ]);
      case FilterOperator.gte:
        return _SqlExpression("$quoted >= ?", <Variable>[
          Variable<Object>(value),
        ]);
      case FilterOperator.lt:
        return _SqlExpression("$quoted < ?", <Variable>[
          Variable<Object>(value),
        ]);
      case FilterOperator.lte:
        return _SqlExpression("$quoted <= ?", <Variable>[
          Variable<Object>(value),
        ]);
      case FilterOperator.like:
        return _SqlExpression("$quoted LIKE ?", <Variable>[
          Variable<Object>(value),
        ]);
      case FilterOperator.ilike:
        return _SqlExpression("LOWER($quoted) LIKE LOWER(?)", <Variable>[
          Variable<Object>(value),
        ]);
      case FilterOperator.isNull:
        return _SqlExpression("$quoted IS NULL", const <Variable>[]);
      case FilterOperator.isNotNull:
        return _SqlExpression("$quoted IS NOT NULL", const <Variable>[]);
      case FilterOperator.inList:
        return _buildListCondition(quoted, value, isNegated: false);
      case FilterOperator.notInList:
        return _buildListCondition(quoted, value, isNegated: true);
      case FilterOperator.contains:
      case FilterOperator.containedBy:
      case FilterOperator.rangeGt:
      case FilterOperator.rangeGte:
      case FilterOperator.rangeLt:
      case FilterOperator.rangeLte:
      case FilterOperator.overlaps:
        throw UnsupportedError(
          "Unsupported Drift filter operator: ${condition.operator.name}",
        );
    }
  }

  _SqlExpression _buildListCondition(
    String quotedColumn,
    dynamic value, {
    required bool isNegated,
  }) {
    if (value is! List || value.isEmpty) {
      throw ArgumentError("List filter requires a non-empty List value.");
    }

    final String placeholders = List<String>.filled(
      value.length,
      "?",
    ).join(", ");
    final String operator = isNegated ? "NOT IN" : "IN";
    return _SqlExpression(
      "$quotedColumn $operator ($placeholders)",
      value.map<Variable>((dynamic item) => Variable<Object>(item)).toList(),
    );
  }

  String _buildOrderBy(List<OrderByCondition>? orderBy) {
    if (orderBy == null || orderBy.isEmpty) {
      return "";
    }

    final String clauses = orderBy
        .map<String>((OrderByCondition condition) {
          final String column = _quoteColumn(
            _normalizeColumn(condition.column),
          );
          final String direction = condition.ascending ? "ASC" : "DESC";
          return "$column $direction";
        })
        .join(", ");
    return "ORDER BY $clauses";
  }

  String _normalizeColumn(String columnOrJsonKey) {
    final String? column = _config.columnForJsonKey(columnOrJsonKey);
    if (column == null || !_config.hasColumn(column)) {
      throw ArgumentError(
        "Unknown column '$columnOrJsonKey' for table '${_config.tableName}'.",
      );
    }
    return column;
  }

  String _quoteColumn(String column) =>
      _quoteIdentifier(_normalizeColumn(column));

  String _quoteIdentifier(String identifier) {
    if (!RegExp(r"^[a-zA-Z_][a-zA-Z0-9_]*$").hasMatch(identifier)) {
      throw ArgumentError("Unsafe SQL identifier: $identifier");
    }
    return '"$identifier"';
  }

  String _requireCurrentUserId() {
    final String? userId = _currentUserId();
    if (userId == null || userId.isEmpty) {
      throw StateError("Demo Drift repository requires an authenticated user.");
    }
    return userId;
  }
}

class DriftTableConfig {
  const DriftTableConfig({
    required this.tableName,
    required this.columns,
    this.jsonKeyToColumn = const <String, String>{},
    this.dateColumns = const <String>{},
    this.boolColumns = const <String>{},
    this.jsonColumns = const <String>{},
    this.omitNullInsertColumns = const <String>{"id"},
  });

  final String tableName;
  final Set<String> columns;
  final Map<String, String> jsonKeyToColumn;
  final Set<String> dateColumns;
  final Set<String> boolColumns;
  final Set<String> jsonColumns;
  final Set<String> omitNullInsertColumns;

  String? columnForJsonKey(String key) {
    if (columns.contains(key)) {
      return key;
    }
    return jsonKeyToColumn[key];
  }

  String jsonKeyForColumn(String column) {
    for (final MapEntry<String, String> entry in jsonKeyToColumn.entries) {
      if (entry.value == column) {
        return entry.key;
      }
    }
    return column;
  }

  bool hasColumn(String column) => columns.contains(column);

  static DriftTableConfig forTable(String tableName) {
    final DriftTableConfig? config = _configs[tableName];
    if (config == null) {
      throw ArgumentError("Unsupported Drift demo table: $tableName");
    }
    return config;
  }

  static final Map<String, DriftTableConfig> _configs =
      <String, DriftTableConfig>{
        "material_categories": DriftTableConfig(
          tableName: "material_categories",
          columns: <String>{
            "id",
            "user_id",
            "name",
            "display_order",
            "code",
            ..._timestamps,
          },
          dateColumns: _timestamps,
        ),
        "materials": DriftTableConfig(
          tableName: "materials",
          columns: <String>{
            "id",
            "user_id",
            "name",
            "category_id",
            "unit_type",
            "current_stock",
            "alert_threshold",
            "critical_threshold",
            "notes",
            ..._timestamps,
          },
          dateColumns: _timestamps,
        ),
        "recipes": DriftTableConfig(
          tableName: "recipes",
          columns: <String>{
            "id",
            "user_id",
            "menu_item_id",
            "material_id",
            "required_amount",
            "is_optional",
            "notes",
            ..._timestamps,
          },
          dateColumns: _timestamps,
          boolColumns: <String>{"is_optional"},
        ),
        "suppliers": DriftTableConfig(
          tableName: "suppliers",
          columns: <String>{
            "id",
            "user_id",
            "name",
            "contact_info",
            "notes",
            "is_active",
            ..._timestamps,
          },
          jsonKeyToColumn: <String, String>{
            "userId": "user_id",
            "contactInfo": "contact_info",
            "isActive": "is_active",
            "createdAt": "created_at",
            "updatedAt": "updated_at",
          },
          dateColumns: _timestamps,
          boolColumns: <String>{"is_active"},
        ),
        "stock_transactions": DriftTableConfig(
          tableName: "stock_transactions",
          columns: <String>{
            "id",
            "user_id",
            "material_id",
            "transaction_type",
            "change_amount",
            "reference_type",
            "reference_id",
            "notes",
            ..._timestamps,
          },
          dateColumns: _timestamps,
        ),
        "purchases": DriftTableConfig(
          tableName: "purchases",
          columns: <String>{
            "id",
            "user_id",
            "purchase_date",
            "notes",
            ..._timestamps,
          },
          dateColumns: <String>{"purchase_date", ..._timestamps},
        ),
        "purchase_items": DriftTableConfig(
          tableName: "purchase_items",
          columns: <String>{
            "id",
            "user_id",
            "purchase_id",
            "material_id",
            "quantity",
            "created_at",
          },
          dateColumns: <String>{"created_at"},
        ),
        "stock_adjustments": DriftTableConfig(
          tableName: "stock_adjustments",
          columns: <String>{
            "id",
            "user_id",
            "material_id",
            "adjustment_amount",
            "adjusted_at",
            "notes",
            ..._timestamps,
          },
          dateColumns: <String>{"adjusted_at", ..._timestamps},
        ),
        "menu_categories": DriftTableConfig(
          tableName: "menu_categories",
          columns: <String>{
            "id",
            "user_id",
            "name",
            "display_order",
            "code",
            ..._timestamps,
          },
          dateColumns: _timestamps,
        ),
        "menu_items": DriftTableConfig(
          tableName: "menu_items",
          columns: <String>{
            "id",
            "user_id",
            "name",
            "category_id",
            "price",
            "description",
            "is_available",
            "display_order",
            "image_url",
            ..._timestamps,
          },
          dateColumns: _timestamps,
          boolColumns: <String>{"is_available"},
        ),
        "orders": DriftTableConfig(
          tableName: "orders",
          columns: <String>{
            "id",
            "user_id",
            "total_amount",
            "order_number",
            "is_cart",
            "status",
            "payment_method",
            "discount_amount",
            "customer_name",
            "notes",
            "ordered_at",
            "started_preparing_at",
            "ready_at",
            "completed_at",
            ..._timestamps,
          },
          dateColumns: <String>{
            "ordered_at",
            "started_preparing_at",
            "ready_at",
            "completed_at",
            ..._timestamps,
          },
          boolColumns: <String>{"is_cart"},
        ),
        "order_items": DriftTableConfig(
          tableName: "order_items",
          columns: <String>{
            "id",
            "user_id",
            "order_id",
            "menu_item_id",
            "quantity",
            "unit_price",
            "subtotal",
            "selected_options",
            "special_request",
            "created_at",
          },
          dateColumns: <String>{"created_at"},
          jsonColumns: <String>{"selected_options"},
        ),
        "daily_summaries": DriftTableConfig(
          tableName: "daily_summaries",
          columns: <String>{
            "id",
            "user_id",
            "summary_date",
            "total_orders",
            "completed_orders",
            "pending_orders",
            "total_revenue",
            "average_prep_time_minutes",
            "most_popular_item_id",
            "most_popular_item_count",
            ..._timestamps,
          },
          jsonKeyToColumn: <String, String>{
            "userId": "user_id",
            "summaryDate": "summary_date",
            "totalOrders": "total_orders",
            "completedOrders": "completed_orders",
            "pendingOrders": "pending_orders",
            "totalRevenue": "total_revenue",
            "averagePrepTimeMinutes": "average_prep_time_minutes",
            "mostPopularItemId": "most_popular_item_id",
            "mostPopularItemCount": "most_popular_item_count",
            "createdAt": "created_at",
            "updatedAt": "updated_at",
          },
          dateColumns: <String>{"summary_date", ..._timestamps},
        ),
      };
}

const Set<String> _timestamps = <String>{"created_at", "updated_at"};

int _localIdSequence = 0;

String _createLocalId() {
  final int timestamp = DateTime.now().microsecondsSinceEpoch;
  return "local-$timestamp-$_localIdSequence++";
}

class _SqlWhere {
  const _SqlWhere(this.sql, this.variables);

  final String sql;
  final List<Variable> variables;
}

class _SqlExpression {
  const _SqlExpression(this.sql, this.variables);

  final String sql;
  final List<Variable> variables;
}
