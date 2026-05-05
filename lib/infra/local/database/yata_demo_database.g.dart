// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yata_demo_database.dart';

// ignore_for_file: type=lint
class $MaterialCategoriesTable extends MaterialCategories
    with TableInfo<$MaterialCategoriesTable, MaterialCategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    name,
    displayOrder,
    code,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'material_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaterialCategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayOrderMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaterialCategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialCategoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_order'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
    );
  }

  @override
  $MaterialCategoriesTable createAlias(String alias) {
    return $MaterialCategoriesTable(attachedDatabase, alias);
  }
}

class MaterialCategoryRow extends DataClass
    implements Insertable<MaterialCategoryRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String name;
  final int displayOrder;
  final String? code;
  const MaterialCategoryRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.displayOrder,
    this.code,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['name'] = Variable<String>(name);
    map['display_order'] = Variable<int>(displayOrder);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    return map;
  }

  MaterialCategoriesCompanion toCompanion(bool nullToAbsent) {
    return MaterialCategoriesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      name: Value(name),
      displayOrder: Value(displayOrder),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
    );
  }

  factory MaterialCategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialCategoryRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      code: serializer.fromJson<String?>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'name': serializer.toJson<String>(name),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'code': serializer.toJson<String?>(code),
    };
  }

  MaterialCategoryRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? name,
    int? displayOrder,
    Value<String?> code = const Value.absent(),
  }) => MaterialCategoryRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    name: name ?? this.name,
    displayOrder: displayOrder ?? this.displayOrder,
    code: code.present ? code.value : this.code,
  );
  MaterialCategoryRow copyWithCompanion(MaterialCategoriesCompanion data) {
    return MaterialCategoryRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      code: data.code.present ? data.code.value : this.code,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialCategoryRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, createdAt, updatedAt, name, displayOrder, code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialCategoryRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.displayOrder == this.displayOrder &&
          other.code == this.code);
}

class MaterialCategoriesCompanion extends UpdateCompanion<MaterialCategoryRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<int> displayOrder;
  final Value<String?> code;
  final Value<int> rowid;
  const MaterialCategoriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.code = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaterialCategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required int displayOrder,
    this.code = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       displayOrder = Value(displayOrder);
  static Insertable<MaterialCategoryRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<int>? displayOrder,
    Expression<String>? code,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (displayOrder != null) 'display_order': displayOrder,
      if (code != null) 'code': code,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MaterialCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<int>? displayOrder,
    Value<String?>? code,
    Value<int>? rowid,
  }) {
    return MaterialCategoriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      displayOrder: displayOrder ?? this.displayOrder,
      code: code ?? this.code,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('code: $code, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MaterialsTable extends Materials
    with TableInfo<$MaterialsTable, MaterialRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaterialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<UnitType, String> unitType =
      GeneratedColumn<String>(
        'unit_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UnitType>($MaterialsTable.$converterunitType);
  static const VerificationMeta _currentStockMeta = const VerificationMeta(
    'currentStock',
  );
  @override
  late final GeneratedColumn<double> currentStock = GeneratedColumn<double>(
    'current_stock',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alertThresholdMeta = const VerificationMeta(
    'alertThreshold',
  );
  @override
  late final GeneratedColumn<double> alertThreshold = GeneratedColumn<double>(
    'alert_threshold',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _criticalThresholdMeta = const VerificationMeta(
    'criticalThreshold',
  );
  @override
  late final GeneratedColumn<double> criticalThreshold =
      GeneratedColumn<double>(
        'critical_threshold',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    name,
    categoryId,
    unitType,
    currentStock,
    alertThreshold,
    criticalThreshold,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'materials';
  @override
  VerificationContext validateIntegrity(
    Insertable<MaterialRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('current_stock')) {
      context.handle(
        _currentStockMeta,
        currentStock.isAcceptableOrUnknown(
          data['current_stock']!,
          _currentStockMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentStockMeta);
    }
    if (data.containsKey('alert_threshold')) {
      context.handle(
        _alertThresholdMeta,
        alertThreshold.isAcceptableOrUnknown(
          data['alert_threshold']!,
          _alertThresholdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_alertThresholdMeta);
    }
    if (data.containsKey('critical_threshold')) {
      context.handle(
        _criticalThresholdMeta,
        criticalThreshold.isAcceptableOrUnknown(
          data['critical_threshold']!,
          _criticalThresholdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_criticalThresholdMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaterialRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaterialRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      unitType: $MaterialsTable.$converterunitType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unit_type'],
        )!,
      ),
      currentStock: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_stock'],
      )!,
      alertThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}alert_threshold'],
      )!,
      criticalThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}critical_threshold'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $MaterialsTable createAlias(String alias) {
    return $MaterialsTable(attachedDatabase, alias);
  }

  static TypeConverter<UnitType, String> $converterunitType =
      const UnitTypeConverter();
}

class MaterialRow extends DataClass implements Insertable<MaterialRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String name;
  final String categoryId;
  final UnitType unitType;
  final double currentStock;
  final double alertThreshold;
  final double criticalThreshold;
  final String? notes;
  const MaterialRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.categoryId,
    required this.unitType,
    required this.currentStock,
    required this.alertThreshold,
    required this.criticalThreshold,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<String>(categoryId);
    {
      map['unit_type'] = Variable<String>(
        $MaterialsTable.$converterunitType.toSql(unitType),
      );
    }
    map['current_stock'] = Variable<double>(currentStock);
    map['alert_threshold'] = Variable<double>(alertThreshold);
    map['critical_threshold'] = Variable<double>(criticalThreshold);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MaterialsCompanion toCompanion(bool nullToAbsent) {
    return MaterialsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      name: Value(name),
      categoryId: Value(categoryId),
      unitType: Value(unitType),
      currentStock: Value(currentStock),
      alertThreshold: Value(alertThreshold),
      criticalThreshold: Value(criticalThreshold),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory MaterialRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaterialRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      unitType: serializer.fromJson<UnitType>(json['unitType']),
      currentStock: serializer.fromJson<double>(json['currentStock']),
      alertThreshold: serializer.fromJson<double>(json['alertThreshold']),
      criticalThreshold: serializer.fromJson<double>(json['criticalThreshold']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<String>(categoryId),
      'unitType': serializer.toJson<UnitType>(unitType),
      'currentStock': serializer.toJson<double>(currentStock),
      'alertThreshold': serializer.toJson<double>(alertThreshold),
      'criticalThreshold': serializer.toJson<double>(criticalThreshold),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  MaterialRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? name,
    String? categoryId,
    UnitType? unitType,
    double? currentStock,
    double? alertThreshold,
    double? criticalThreshold,
    Value<String?> notes = const Value.absent(),
  }) => MaterialRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    name: name ?? this.name,
    categoryId: categoryId ?? this.categoryId,
    unitType: unitType ?? this.unitType,
    currentStock: currentStock ?? this.currentStock,
    alertThreshold: alertThreshold ?? this.alertThreshold,
    criticalThreshold: criticalThreshold ?? this.criticalThreshold,
    notes: notes.present ? notes.value : this.notes,
  );
  MaterialRow copyWithCompanion(MaterialsCompanion data) {
    return MaterialRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      unitType: data.unitType.present ? data.unitType.value : this.unitType,
      currentStock: data.currentStock.present
          ? data.currentStock.value
          : this.currentStock,
      alertThreshold: data.alertThreshold.present
          ? data.alertThreshold.value
          : this.alertThreshold,
      criticalThreshold: data.criticalThreshold.present
          ? data.criticalThreshold.value
          : this.criticalThreshold,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaterialRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('unitType: $unitType, ')
          ..write('currentStock: $currentStock, ')
          ..write('alertThreshold: $alertThreshold, ')
          ..write('criticalThreshold: $criticalThreshold, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    name,
    categoryId,
    unitType,
    currentStock,
    alertThreshold,
    criticalThreshold,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaterialRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.categoryId == this.categoryId &&
          other.unitType == this.unitType &&
          other.currentStock == this.currentStock &&
          other.alertThreshold == this.alertThreshold &&
          other.criticalThreshold == this.criticalThreshold &&
          other.notes == this.notes);
}

class MaterialsCompanion extends UpdateCompanion<MaterialRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<String> categoryId;
  final Value<UnitType> unitType;
  final Value<double> currentStock;
  final Value<double> alertThreshold;
  final Value<double> criticalThreshold;
  final Value<String?> notes;
  final Value<int> rowid;
  const MaterialsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.unitType = const Value.absent(),
    this.currentStock = const Value.absent(),
    this.alertThreshold = const Value.absent(),
    this.criticalThreshold = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaterialsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required String categoryId,
    required UnitType unitType,
    required double currentStock,
    required double alertThreshold,
    required double criticalThreshold,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       categoryId = Value(categoryId),
       unitType = Value(unitType),
       currentStock = Value(currentStock),
       alertThreshold = Value(alertThreshold),
       criticalThreshold = Value(criticalThreshold);
  static Insertable<MaterialRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? categoryId,
    Expression<String>? unitType,
    Expression<double>? currentStock,
    Expression<double>? alertThreshold,
    Expression<double>? criticalThreshold,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
      if (unitType != null) 'unit_type': unitType,
      if (currentStock != null) 'current_stock': currentStock,
      if (alertThreshold != null) 'alert_threshold': alertThreshold,
      if (criticalThreshold != null) 'critical_threshold': criticalThreshold,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MaterialsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<String>? categoryId,
    Value<UnitType>? unitType,
    Value<double>? currentStock,
    Value<double>? alertThreshold,
    Value<double>? criticalThreshold,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return MaterialsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      unitType: unitType ?? this.unitType,
      currentStock: currentStock ?? this.currentStock,
      alertThreshold: alertThreshold ?? this.alertThreshold,
      criticalThreshold: criticalThreshold ?? this.criticalThreshold,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (unitType.present) {
      map['unit_type'] = Variable<String>(
        $MaterialsTable.$converterunitType.toSql(unitType.value),
      );
    }
    if (currentStock.present) {
      map['current_stock'] = Variable<double>(currentStock.value);
    }
    if (alertThreshold.present) {
      map['alert_threshold'] = Variable<double>(alertThreshold.value);
    }
    if (criticalThreshold.present) {
      map['critical_threshold'] = Variable<double>(criticalThreshold.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaterialsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('unitType: $unitType, ')
          ..write('currentStock: $currentStock, ')
          ..write('alertThreshold: $alertThreshold, ')
          ..write('criticalThreshold: $criticalThreshold, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipesTable extends Recipes with TableInfo<$RecipesTable, RecipeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _menuItemIdMeta = const VerificationMeta(
    'menuItemId',
  );
  @override
  late final GeneratedColumn<String> menuItemId = GeneratedColumn<String>(
    'menu_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _materialIdMeta = const VerificationMeta(
    'materialId',
  );
  @override
  late final GeneratedColumn<String> materialId = GeneratedColumn<String>(
    'material_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _requiredAmountMeta = const VerificationMeta(
    'requiredAmount',
  );
  @override
  late final GeneratedColumn<double> requiredAmount = GeneratedColumn<double>(
    'required_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isOptionalMeta = const VerificationMeta(
    'isOptional',
  );
  @override
  late final GeneratedColumn<bool> isOptional = GeneratedColumn<bool>(
    'is_optional',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_optional" IN (0, 1))',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    menuItemId,
    materialId,
    requiredAmount,
    isOptional,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('menu_item_id')) {
      context.handle(
        _menuItemIdMeta,
        menuItemId.isAcceptableOrUnknown(
          data['menu_item_id']!,
          _menuItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_menuItemIdMeta);
    }
    if (data.containsKey('material_id')) {
      context.handle(
        _materialIdMeta,
        materialId.isAcceptableOrUnknown(data['material_id']!, _materialIdMeta),
      );
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    if (data.containsKey('required_amount')) {
      context.handle(
        _requiredAmountMeta,
        requiredAmount.isAcceptableOrUnknown(
          data['required_amount']!,
          _requiredAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requiredAmountMeta);
    }
    if (data.containsKey('is_optional')) {
      context.handle(
        _isOptionalMeta,
        isOptional.isAcceptableOrUnknown(data['is_optional']!, _isOptionalMeta),
      );
    } else if (isInserting) {
      context.missing(_isOptionalMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      menuItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}menu_item_id'],
      )!,
      materialId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_id'],
      )!,
      requiredAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}required_amount'],
      )!,
      isOptional: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_optional'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $RecipesTable createAlias(String alias) {
    return $RecipesTable(attachedDatabase, alias);
  }
}

class RecipeRow extends DataClass implements Insertable<RecipeRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String menuItemId;
  final String materialId;
  final double requiredAmount;
  final bool isOptional;
  final String? notes;
  const RecipeRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.menuItemId,
    required this.materialId,
    required this.requiredAmount,
    required this.isOptional,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['menu_item_id'] = Variable<String>(menuItemId);
    map['material_id'] = Variable<String>(materialId);
    map['required_amount'] = Variable<double>(requiredAmount);
    map['is_optional'] = Variable<bool>(isOptional);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  RecipesCompanion toCompanion(bool nullToAbsent) {
    return RecipesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      menuItemId: Value(menuItemId),
      materialId: Value(materialId),
      requiredAmount: Value(requiredAmount),
      isOptional: Value(isOptional),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory RecipeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      menuItemId: serializer.fromJson<String>(json['menuItemId']),
      materialId: serializer.fromJson<String>(json['materialId']),
      requiredAmount: serializer.fromJson<double>(json['requiredAmount']),
      isOptional: serializer.fromJson<bool>(json['isOptional']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'menuItemId': serializer.toJson<String>(menuItemId),
      'materialId': serializer.toJson<String>(materialId),
      'requiredAmount': serializer.toJson<double>(requiredAmount),
      'isOptional': serializer.toJson<bool>(isOptional),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  RecipeRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? menuItemId,
    String? materialId,
    double? requiredAmount,
    bool? isOptional,
    Value<String?> notes = const Value.absent(),
  }) => RecipeRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    menuItemId: menuItemId ?? this.menuItemId,
    materialId: materialId ?? this.materialId,
    requiredAmount: requiredAmount ?? this.requiredAmount,
    isOptional: isOptional ?? this.isOptional,
    notes: notes.present ? notes.value : this.notes,
  );
  RecipeRow copyWithCompanion(RecipesCompanion data) {
    return RecipeRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      menuItemId: data.menuItemId.present
          ? data.menuItemId.value
          : this.menuItemId,
      materialId: data.materialId.present
          ? data.materialId.value
          : this.materialId,
      requiredAmount: data.requiredAmount.present
          ? data.requiredAmount.value
          : this.requiredAmount,
      isOptional: data.isOptional.present
          ? data.isOptional.value
          : this.isOptional,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('menuItemId: $menuItemId, ')
          ..write('materialId: $materialId, ')
          ..write('requiredAmount: $requiredAmount, ')
          ..write('isOptional: $isOptional, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    menuItemId,
    materialId,
    requiredAmount,
    isOptional,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.menuItemId == this.menuItemId &&
          other.materialId == this.materialId &&
          other.requiredAmount == this.requiredAmount &&
          other.isOptional == this.isOptional &&
          other.notes == this.notes);
}

class RecipesCompanion extends UpdateCompanion<RecipeRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> menuItemId;
  final Value<String> materialId;
  final Value<double> requiredAmount;
  final Value<bool> isOptional;
  final Value<String?> notes;
  final Value<int> rowid;
  const RecipesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.menuItemId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.requiredAmount = const Value.absent(),
    this.isOptional = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String menuItemId,
    required String materialId,
    required double requiredAmount,
    required bool isOptional,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : menuItemId = Value(menuItemId),
       materialId = Value(materialId),
       requiredAmount = Value(requiredAmount),
       isOptional = Value(isOptional);
  static Insertable<RecipeRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? menuItemId,
    Expression<String>? materialId,
    Expression<double>? requiredAmount,
    Expression<bool>? isOptional,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (menuItemId != null) 'menu_item_id': menuItemId,
      if (materialId != null) 'material_id': materialId,
      if (requiredAmount != null) 'required_amount': requiredAmount,
      if (isOptional != null) 'is_optional': isOptional,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? menuItemId,
    Value<String>? materialId,
    Value<double>? requiredAmount,
    Value<bool>? isOptional,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return RecipesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      menuItemId: menuItemId ?? this.menuItemId,
      materialId: materialId ?? this.materialId,
      requiredAmount: requiredAmount ?? this.requiredAmount,
      isOptional: isOptional ?? this.isOptional,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (menuItemId.present) {
      map['menu_item_id'] = Variable<String>(menuItemId.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<String>(materialId.value);
    }
    if (requiredAmount.present) {
      map['required_amount'] = Variable<double>(requiredAmount.value);
    }
    if (isOptional.present) {
      map['is_optional'] = Variable<bool>(isOptional.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('menuItemId: $menuItemId, ')
          ..write('materialId: $materialId, ')
          ..write('requiredAmount: $requiredAmount, ')
          ..write('isOptional: $isOptional, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, SupplierRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactInfoMeta = const VerificationMeta(
    'contactInfo',
  );
  @override
  late final GeneratedColumn<String> contactInfo = GeneratedColumn<String>(
    'contact_info',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    name,
    contactInfo,
    notes,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact_info')) {
      context.handle(
        _contactInfoMeta,
        contactInfo.isAcceptableOrUnknown(
          data['contact_info']!,
          _contactInfoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contactInfoMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      contactInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_info'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class SupplierRow extends DataClass implements Insertable<SupplierRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String name;
  final String contactInfo;
  final String? notes;
  final bool isActive;
  const SupplierRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.contactInfo,
    this.notes,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['name'] = Variable<String>(name);
    map['contact_info'] = Variable<String>(contactInfo);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      name: Value(name),
      contactInfo: Value(contactInfo),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isActive: Value(isActive),
    );
  }

  factory SupplierRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      contactInfo: serializer.fromJson<String>(json['contactInfo']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'name': serializer.toJson<String>(name),
      'contactInfo': serializer.toJson<String>(contactInfo),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  SupplierRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? name,
    String? contactInfo,
    Value<String?> notes = const Value.absent(),
    bool? isActive,
  }) => SupplierRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    name: name ?? this.name,
    contactInfo: contactInfo ?? this.contactInfo,
    notes: notes.present ? notes.value : this.notes,
    isActive: isActive ?? this.isActive,
  );
  SupplierRow copyWithCompanion(SuppliersCompanion data) {
    return SupplierRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      contactInfo: data.contactInfo.present
          ? data.contactInfo.value
          : this.contactInfo,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('contactInfo: $contactInfo, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    name,
    contactInfo,
    notes,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.contactInfo == this.contactInfo &&
          other.notes == this.notes &&
          other.isActive == this.isActive);
}

class SuppliersCompanion extends UpdateCompanion<SupplierRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<String> contactInfo;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<int> rowid;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.contactInfo = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SuppliersCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required String contactInfo,
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       contactInfo = Value(contactInfo);
  static Insertable<SupplierRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? contactInfo,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (contactInfo != null) 'contact_info': contactInfo,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SuppliersCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<String>? contactInfo,
    Value<String?>? notes,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return SuppliersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      contactInfo: contactInfo ?? this.contactInfo,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (contactInfo.present) {
      map['contact_info'] = Variable<String>(contactInfo.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('contactInfo: $contactInfo, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockTransactionsTable extends StockTransactions
    with TableInfo<$StockTransactionsTable, StockTransactionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _materialIdMeta = const VerificationMeta(
    'materialId',
  );
  @override
  late final GeneratedColumn<String> materialId = GeneratedColumn<String>(
    'material_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TransactionType, String>
  transactionType =
      GeneratedColumn<String>(
        'transaction_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TransactionType>(
        $StockTransactionsTable.$convertertransactionType,
      );
  static const VerificationMeta _changeAmountMeta = const VerificationMeta(
    'changeAmount',
  );
  @override
  late final GeneratedColumn<double> changeAmount = GeneratedColumn<double>(
    'change_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ReferenceType?, String>
  referenceType =
      GeneratedColumn<String>(
        'reference_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<ReferenceType?>(
        $StockTransactionsTable.$converterreferenceTypen,
      );
  static const VerificationMeta _referenceIdMeta = const VerificationMeta(
    'referenceId',
  );
  @override
  late final GeneratedColumn<String> referenceId = GeneratedColumn<String>(
    'reference_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    materialId,
    transactionType,
    changeAmount,
    referenceType,
    referenceId,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<StockTransactionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('material_id')) {
      context.handle(
        _materialIdMeta,
        materialId.isAcceptableOrUnknown(data['material_id']!, _materialIdMeta),
      );
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    if (data.containsKey('change_amount')) {
      context.handle(
        _changeAmountMeta,
        changeAmount.isAcceptableOrUnknown(
          data['change_amount']!,
          _changeAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_changeAmountMeta);
    }
    if (data.containsKey('reference_id')) {
      context.handle(
        _referenceIdMeta,
        referenceId.isAcceptableOrUnknown(
          data['reference_id']!,
          _referenceIdMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockTransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockTransactionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      materialId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_id'],
      )!,
      transactionType: $StockTransactionsTable.$convertertransactionType
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}transaction_type'],
            )!,
          ),
      changeAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}change_amount'],
      )!,
      referenceType: $StockTransactionsTable.$converterreferenceTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reference_type'],
        ),
      ),
      referenceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $StockTransactionsTable createAlias(String alias) {
    return $StockTransactionsTable(attachedDatabase, alias);
  }

  static TypeConverter<TransactionType, String> $convertertransactionType =
      const TransactionTypeConverter();
  static TypeConverter<ReferenceType, String> $converterreferenceType =
      const ReferenceTypeConverter();
  static TypeConverter<ReferenceType?, String?> $converterreferenceTypen =
      NullAwareTypeConverter.wrap($converterreferenceType);
}

class StockTransactionRow extends DataClass
    implements Insertable<StockTransactionRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String materialId;
  final TransactionType transactionType;
  final double changeAmount;
  final ReferenceType? referenceType;
  final String? referenceId;
  final String? notes;
  const StockTransactionRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.materialId,
    required this.transactionType,
    required this.changeAmount,
    this.referenceType,
    this.referenceId,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['material_id'] = Variable<String>(materialId);
    {
      map['transaction_type'] = Variable<String>(
        $StockTransactionsTable.$convertertransactionType.toSql(
          transactionType,
        ),
      );
    }
    map['change_amount'] = Variable<double>(changeAmount);
    if (!nullToAbsent || referenceType != null) {
      map['reference_type'] = Variable<String>(
        $StockTransactionsTable.$converterreferenceTypen.toSql(referenceType),
      );
    }
    if (!nullToAbsent || referenceId != null) {
      map['reference_id'] = Variable<String>(referenceId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  StockTransactionsCompanion toCompanion(bool nullToAbsent) {
    return StockTransactionsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      materialId: Value(materialId),
      transactionType: Value(transactionType),
      changeAmount: Value(changeAmount),
      referenceType: referenceType == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceType),
      referenceId: referenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory StockTransactionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockTransactionRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      materialId: serializer.fromJson<String>(json['materialId']),
      transactionType: serializer.fromJson<TransactionType>(
        json['transactionType'],
      ),
      changeAmount: serializer.fromJson<double>(json['changeAmount']),
      referenceType: serializer.fromJson<ReferenceType?>(json['referenceType']),
      referenceId: serializer.fromJson<String?>(json['referenceId']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'materialId': serializer.toJson<String>(materialId),
      'transactionType': serializer.toJson<TransactionType>(transactionType),
      'changeAmount': serializer.toJson<double>(changeAmount),
      'referenceType': serializer.toJson<ReferenceType?>(referenceType),
      'referenceId': serializer.toJson<String?>(referenceId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  StockTransactionRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? materialId,
    TransactionType? transactionType,
    double? changeAmount,
    Value<ReferenceType?> referenceType = const Value.absent(),
    Value<String?> referenceId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => StockTransactionRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    materialId: materialId ?? this.materialId,
    transactionType: transactionType ?? this.transactionType,
    changeAmount: changeAmount ?? this.changeAmount,
    referenceType: referenceType.present
        ? referenceType.value
        : this.referenceType,
    referenceId: referenceId.present ? referenceId.value : this.referenceId,
    notes: notes.present ? notes.value : this.notes,
  );
  StockTransactionRow copyWithCompanion(StockTransactionsCompanion data) {
    return StockTransactionRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      materialId: data.materialId.present
          ? data.materialId.value
          : this.materialId,
      transactionType: data.transactionType.present
          ? data.transactionType.value
          : this.transactionType,
      changeAmount: data.changeAmount.present
          ? data.changeAmount.value
          : this.changeAmount,
      referenceType: data.referenceType.present
          ? data.referenceType.value
          : this.referenceType,
      referenceId: data.referenceId.present
          ? data.referenceId.value
          : this.referenceId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockTransactionRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('materialId: $materialId, ')
          ..write('transactionType: $transactionType, ')
          ..write('changeAmount: $changeAmount, ')
          ..write('referenceType: $referenceType, ')
          ..write('referenceId: $referenceId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    materialId,
    transactionType,
    changeAmount,
    referenceType,
    referenceId,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockTransactionRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.materialId == this.materialId &&
          other.transactionType == this.transactionType &&
          other.changeAmount == this.changeAmount &&
          other.referenceType == this.referenceType &&
          other.referenceId == this.referenceId &&
          other.notes == this.notes);
}

class StockTransactionsCompanion extends UpdateCompanion<StockTransactionRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> materialId;
  final Value<TransactionType> transactionType;
  final Value<double> changeAmount;
  final Value<ReferenceType?> referenceType;
  final Value<String?> referenceId;
  final Value<String?> notes;
  final Value<int> rowid;
  const StockTransactionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.materialId = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.changeAmount = const Value.absent(),
    this.referenceType = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockTransactionsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String materialId,
    required TransactionType transactionType,
    required double changeAmount,
    this.referenceType = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : materialId = Value(materialId),
       transactionType = Value(transactionType),
       changeAmount = Value(changeAmount);
  static Insertable<StockTransactionRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? materialId,
    Expression<String>? transactionType,
    Expression<double>? changeAmount,
    Expression<String>? referenceType,
    Expression<String>? referenceId,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (materialId != null) 'material_id': materialId,
      if (transactionType != null) 'transaction_type': transactionType,
      if (changeAmount != null) 'change_amount': changeAmount,
      if (referenceType != null) 'reference_type': referenceType,
      if (referenceId != null) 'reference_id': referenceId,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockTransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? materialId,
    Value<TransactionType>? transactionType,
    Value<double>? changeAmount,
    Value<ReferenceType?>? referenceType,
    Value<String?>? referenceId,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return StockTransactionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      materialId: materialId ?? this.materialId,
      transactionType: transactionType ?? this.transactionType,
      changeAmount: changeAmount ?? this.changeAmount,
      referenceType: referenceType ?? this.referenceType,
      referenceId: referenceId ?? this.referenceId,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<String>(materialId.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<String>(
        $StockTransactionsTable.$convertertransactionType.toSql(
          transactionType.value,
        ),
      );
    }
    if (changeAmount.present) {
      map['change_amount'] = Variable<double>(changeAmount.value);
    }
    if (referenceType.present) {
      map['reference_type'] = Variable<String>(
        $StockTransactionsTable.$converterreferenceTypen.toSql(
          referenceType.value,
        ),
      );
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<String>(referenceId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockTransactionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('materialId: $materialId, ')
          ..write('transactionType: $transactionType, ')
          ..write('changeAmount: $changeAmount, ')
          ..write('referenceType: $referenceType, ')
          ..write('referenceId: $referenceId, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchasesTable extends Purchases
    with TableInfo<$PurchasesTable, PurchaseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purchaseDateMeta = const VerificationMeta(
    'purchaseDate',
  );
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
    'purchase_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    purchaseDate,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchases';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
        _purchaseDateMeta,
        purchaseDate.isAcceptableOrUnknown(
          data['purchase_date']!,
          _purchaseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      purchaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}purchase_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $PurchasesTable createAlias(String alias) {
    return $PurchasesTable(attachedDatabase, alias);
  }
}

class PurchaseRow extends DataClass implements Insertable<PurchaseRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime purchaseDate;
  final String? notes;
  const PurchaseRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.purchaseDate,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  PurchasesCompanion toCompanion(bool nullToAbsent) {
    return PurchasesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      purchaseDate: Value(purchaseDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory PurchaseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  PurchaseRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    DateTime? purchaseDate,
    Value<String?> notes = const Value.absent(),
  }) => PurchaseRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    purchaseDate: purchaseDate ?? this.purchaseDate,
    notes: notes.present ? notes.value : this.notes,
  );
  PurchaseRow copyWithCompanion(PurchasesCompanion data) {
    return PurchaseRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, createdAt, updatedAt, purchaseDate, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.purchaseDate == this.purchaseDate &&
          other.notes == this.notes);
}

class PurchasesCompanion extends UpdateCompanion<PurchaseRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime> purchaseDate;
  final Value<String?> notes;
  final Value<int> rowid;
  const PurchasesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchasesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required DateTime purchaseDate,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : purchaseDate = Value(purchaseDate);
  static Insertable<PurchaseRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? purchaseDate,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchasesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<DateTime>? purchaseDate,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return PurchasesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchasesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PurchaseItemsTable extends PurchaseItems
    with TableInfo<$PurchaseItemsTable, PurchaseItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _purchaseIdMeta = const VerificationMeta(
    'purchaseId',
  );
  @override
  late final GeneratedColumn<String> purchaseId = GeneratedColumn<String>(
    'purchase_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _materialIdMeta = const VerificationMeta(
    'materialId',
  );
  @override
  late final GeneratedColumn<String> materialId = GeneratedColumn<String>(
    'material_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    purchaseId,
    materialId,
    quantity,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
        _purchaseIdMeta,
        purchaseId.isAcceptableOrUnknown(data['purchase_id']!, _purchaseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_purchaseIdMeta);
    }
    if (data.containsKey('material_id')) {
      context.handle(
        _materialIdMeta,
        materialId.isAcceptableOrUnknown(data['material_id']!, _materialIdMeta),
      );
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      purchaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_id'],
      )!,
      materialId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $PurchaseItemsTable createAlias(String alias) {
    return $PurchaseItemsTable(attachedDatabase, alias);
  }
}

class PurchaseItemRow extends DataClass implements Insertable<PurchaseItemRow> {
  final String id;
  final String userId;
  final String purchaseId;
  final String materialId;
  final double quantity;
  final DateTime? createdAt;
  const PurchaseItemRow({
    required this.id,
    required this.userId,
    required this.purchaseId,
    required this.materialId,
    required this.quantity,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['purchase_id'] = Variable<String>(purchaseId);
    map['material_id'] = Variable<String>(materialId);
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  PurchaseItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseItemsCompanion(
      id: Value(id),
      userId: Value(userId),
      purchaseId: Value(purchaseId),
      materialId: Value(materialId),
      quantity: Value(quantity),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory PurchaseItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseItemRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      purchaseId: serializer.fromJson<String>(json['purchaseId']),
      materialId: serializer.fromJson<String>(json['materialId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'purchaseId': serializer.toJson<String>(purchaseId),
      'materialId': serializer.toJson<String>(materialId),
      'quantity': serializer.toJson<double>(quantity),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  PurchaseItemRow copyWith({
    String? id,
    String? userId,
    String? purchaseId,
    String? materialId,
    double? quantity,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => PurchaseItemRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    purchaseId: purchaseId ?? this.purchaseId,
    materialId: materialId ?? this.materialId,
    quantity: quantity ?? this.quantity,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  PurchaseItemRow copyWithCompanion(PurchaseItemsCompanion data) {
    return PurchaseItemRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      purchaseId: data.purchaseId.present
          ? data.purchaseId.value
          : this.purchaseId,
      materialId: data.materialId.present
          ? data.materialId.value
          : this.materialId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseItemRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('materialId: $materialId, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, purchaseId, materialId, quantity, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseItemRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.purchaseId == this.purchaseId &&
          other.materialId == this.materialId &&
          other.quantity == this.quantity &&
          other.createdAt == this.createdAt);
}

class PurchaseItemsCompanion extends UpdateCompanion<PurchaseItemRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> purchaseId;
  final Value<String> materialId;
  final Value<double> quantity;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const PurchaseItemsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.purchaseId = const Value.absent(),
    this.materialId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PurchaseItemsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String purchaseId,
    required String materialId,
    required double quantity,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : purchaseId = Value(purchaseId),
       materialId = Value(materialId),
       quantity = Value(quantity);
  static Insertable<PurchaseItemRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? purchaseId,
    Expression<String>? materialId,
    Expression<double>? quantity,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (purchaseId != null) 'purchase_id': purchaseId,
      if (materialId != null) 'material_id': materialId,
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PurchaseItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? purchaseId,
    Value<String>? materialId,
    Value<double>? quantity,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return PurchaseItemsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      purchaseId: purchaseId ?? this.purchaseId,
      materialId: materialId ?? this.materialId,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<String>(purchaseId.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<String>(materialId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseItemsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('materialId: $materialId, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StockAdjustmentsTable extends StockAdjustments
    with TableInfo<$StockAdjustmentsTable, StockAdjustmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockAdjustmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _materialIdMeta = const VerificationMeta(
    'materialId',
  );
  @override
  late final GeneratedColumn<String> materialId = GeneratedColumn<String>(
    'material_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _adjustmentAmountMeta = const VerificationMeta(
    'adjustmentAmount',
  );
  @override
  late final GeneratedColumn<double> adjustmentAmount = GeneratedColumn<double>(
    'adjustment_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _adjustedAtMeta = const VerificationMeta(
    'adjustedAt',
  );
  @override
  late final GeneratedColumn<DateTime> adjustedAt = GeneratedColumn<DateTime>(
    'adjusted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    materialId,
    adjustmentAmount,
    adjustedAt,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stock_adjustments';
  @override
  VerificationContext validateIntegrity(
    Insertable<StockAdjustmentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('material_id')) {
      context.handle(
        _materialIdMeta,
        materialId.isAcceptableOrUnknown(data['material_id']!, _materialIdMeta),
      );
    } else if (isInserting) {
      context.missing(_materialIdMeta);
    }
    if (data.containsKey('adjustment_amount')) {
      context.handle(
        _adjustmentAmountMeta,
        adjustmentAmount.isAcceptableOrUnknown(
          data['adjustment_amount']!,
          _adjustmentAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_adjustmentAmountMeta);
    }
    if (data.containsKey('adjusted_at')) {
      context.handle(
        _adjustedAtMeta,
        adjustedAt.isAcceptableOrUnknown(data['adjusted_at']!, _adjustedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_adjustedAtMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockAdjustmentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockAdjustmentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      materialId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_id'],
      )!,
      adjustmentAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}adjustment_amount'],
      )!,
      adjustedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}adjusted_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $StockAdjustmentsTable createAlias(String alias) {
    return $StockAdjustmentsTable(attachedDatabase, alias);
  }
}

class StockAdjustmentRow extends DataClass
    implements Insertable<StockAdjustmentRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String materialId;
  final double adjustmentAmount;
  final DateTime adjustedAt;
  final String? notes;
  const StockAdjustmentRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.materialId,
    required this.adjustmentAmount,
    required this.adjustedAt,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['material_id'] = Variable<String>(materialId);
    map['adjustment_amount'] = Variable<double>(adjustmentAmount);
    map['adjusted_at'] = Variable<DateTime>(adjustedAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  StockAdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return StockAdjustmentsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      materialId: Value(materialId),
      adjustmentAmount: Value(adjustmentAmount),
      adjustedAt: Value(adjustedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory StockAdjustmentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockAdjustmentRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      materialId: serializer.fromJson<String>(json['materialId']),
      adjustmentAmount: serializer.fromJson<double>(json['adjustmentAmount']),
      adjustedAt: serializer.fromJson<DateTime>(json['adjustedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'materialId': serializer.toJson<String>(materialId),
      'adjustmentAmount': serializer.toJson<double>(adjustmentAmount),
      'adjustedAt': serializer.toJson<DateTime>(adjustedAt),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  StockAdjustmentRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? materialId,
    double? adjustmentAmount,
    DateTime? adjustedAt,
    Value<String?> notes = const Value.absent(),
  }) => StockAdjustmentRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    materialId: materialId ?? this.materialId,
    adjustmentAmount: adjustmentAmount ?? this.adjustmentAmount,
    adjustedAt: adjustedAt ?? this.adjustedAt,
    notes: notes.present ? notes.value : this.notes,
  );
  StockAdjustmentRow copyWithCompanion(StockAdjustmentsCompanion data) {
    return StockAdjustmentRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      materialId: data.materialId.present
          ? data.materialId.value
          : this.materialId,
      adjustmentAmount: data.adjustmentAmount.present
          ? data.adjustmentAmount.value
          : this.adjustmentAmount,
      adjustedAt: data.adjustedAt.present
          ? data.adjustedAt.value
          : this.adjustedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StockAdjustmentRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('materialId: $materialId, ')
          ..write('adjustmentAmount: $adjustmentAmount, ')
          ..write('adjustedAt: $adjustedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    materialId,
    adjustmentAmount,
    adjustedAt,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockAdjustmentRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.materialId == this.materialId &&
          other.adjustmentAmount == this.adjustmentAmount &&
          other.adjustedAt == this.adjustedAt &&
          other.notes == this.notes);
}

class StockAdjustmentsCompanion extends UpdateCompanion<StockAdjustmentRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> materialId;
  final Value<double> adjustmentAmount;
  final Value<DateTime> adjustedAt;
  final Value<String?> notes;
  final Value<int> rowid;
  const StockAdjustmentsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.materialId = const Value.absent(),
    this.adjustmentAmount = const Value.absent(),
    this.adjustedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StockAdjustmentsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String materialId,
    required double adjustmentAmount,
    required DateTime adjustedAt,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : materialId = Value(materialId),
       adjustmentAmount = Value(adjustmentAmount),
       adjustedAt = Value(adjustedAt);
  static Insertable<StockAdjustmentRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? materialId,
    Expression<double>? adjustmentAmount,
    Expression<DateTime>? adjustedAt,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (materialId != null) 'material_id': materialId,
      if (adjustmentAmount != null) 'adjustment_amount': adjustmentAmount,
      if (adjustedAt != null) 'adjusted_at': adjustedAt,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StockAdjustmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? materialId,
    Value<double>? adjustmentAmount,
    Value<DateTime>? adjustedAt,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return StockAdjustmentsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      materialId: materialId ?? this.materialId,
      adjustmentAmount: adjustmentAmount ?? this.adjustmentAmount,
      adjustedAt: adjustedAt ?? this.adjustedAt,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (materialId.present) {
      map['material_id'] = Variable<String>(materialId.value);
    }
    if (adjustmentAmount.present) {
      map['adjustment_amount'] = Variable<double>(adjustmentAmount.value);
    }
    if (adjustedAt.present) {
      map['adjusted_at'] = Variable<DateTime>(adjustedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockAdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('materialId: $materialId, ')
          ..write('adjustmentAmount: $adjustmentAmount, ')
          ..write('adjustedAt: $adjustedAt, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MenuCategoriesTable extends MenuCategories
    with TableInfo<$MenuCategoriesTable, MenuCategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    name,
    displayOrder,
    code,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<MenuCategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayOrderMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MenuCategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuCategoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_order'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
    );
  }

  @override
  $MenuCategoriesTable createAlias(String alias) {
    return $MenuCategoriesTable(attachedDatabase, alias);
  }
}

class MenuCategoryRow extends DataClass implements Insertable<MenuCategoryRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String name;
  final int displayOrder;
  final String? code;
  const MenuCategoryRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.displayOrder,
    this.code,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['name'] = Variable<String>(name);
    map['display_order'] = Variable<int>(displayOrder);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    return map;
  }

  MenuCategoriesCompanion toCompanion(bool nullToAbsent) {
    return MenuCategoriesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      name: Value(name),
      displayOrder: Value(displayOrder),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
    );
  }

  factory MenuCategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuCategoryRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      code: serializer.fromJson<String?>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'name': serializer.toJson<String>(name),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'code': serializer.toJson<String?>(code),
    };
  }

  MenuCategoryRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? name,
    int? displayOrder,
    Value<String?> code = const Value.absent(),
  }) => MenuCategoryRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    name: name ?? this.name,
    displayOrder: displayOrder ?? this.displayOrder,
    code: code.present ? code.value : this.code,
  );
  MenuCategoryRow copyWithCompanion(MenuCategoriesCompanion data) {
    return MenuCategoryRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      code: data.code.present ? data.code.value : this.code,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuCategoryRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, createdAt, updatedAt, name, displayOrder, code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuCategoryRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.displayOrder == this.displayOrder &&
          other.code == this.code);
}

class MenuCategoriesCompanion extends UpdateCompanion<MenuCategoryRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<int> displayOrder;
  final Value<String?> code;
  final Value<int> rowid;
  const MenuCategoriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.code = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MenuCategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required int displayOrder,
    this.code = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       displayOrder = Value(displayOrder);
  static Insertable<MenuCategoryRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<int>? displayOrder,
    Expression<String>? code,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (displayOrder != null) 'display_order': displayOrder,
      if (code != null) 'code': code,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MenuCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<int>? displayOrder,
    Value<String?>? code,
    Value<int>? rowid,
  }) {
    return MenuCategoriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      displayOrder: displayOrder ?? this.displayOrder,
      code: code ?? this.code,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('code: $code, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MenuItemsTable extends MenuItems
    with TableInfo<$MenuItemsTable, MenuItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isAvailableMeta = const VerificationMeta(
    'isAvailable',
  );
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
    'is_available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_available" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _displayOrderMeta = const VerificationMeta(
    'displayOrder',
  );
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
    'display_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    name,
    categoryId,
    price,
    description,
    isAvailable,
    displayOrder,
    imageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<MenuItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_available')) {
      context.handle(
        _isAvailableMeta,
        isAvailable.isAcceptableOrUnknown(
          data['is_available']!,
          _isAvailableMeta,
        ),
      );
    }
    if (data.containsKey('display_order')) {
      context.handle(
        _displayOrderMeta,
        displayOrder.isAcceptableOrUnknown(
          data['display_order']!,
          _displayOrderMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayOrderMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MenuItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isAvailable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_available'],
      )!,
      displayOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}display_order'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
    );
  }

  @override
  $MenuItemsTable createAlias(String alias) {
    return $MenuItemsTable(attachedDatabase, alias);
  }
}

class MenuItemRow extends DataClass implements Insertable<MenuItemRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String name;
  final String categoryId;
  final int price;
  final String? description;
  final bool isAvailable;
  final int displayOrder;
  final String? imageUrl;
  const MenuItemRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.categoryId,
    required this.price,
    this.description,
    required this.isAvailable,
    required this.displayOrder,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<String>(categoryId);
    map['price'] = Variable<int>(price);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_available'] = Variable<bool>(isAvailable);
    map['display_order'] = Variable<int>(displayOrder);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  MenuItemsCompanion toCompanion(bool nullToAbsent) {
    return MenuItemsCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      name: Value(name),
      categoryId: Value(categoryId),
      price: Value(price),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isAvailable: Value(isAvailable),
      displayOrder: Value(displayOrder),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory MenuItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuItemRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      price: serializer.fromJson<int>(json['price']),
      description: serializer.fromJson<String?>(json['description']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<String>(categoryId),
      'price': serializer.toJson<int>(price),
      'description': serializer.toJson<String?>(description),
      'isAvailable': serializer.toJson<bool>(isAvailable),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  MenuItemRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    String? name,
    String? categoryId,
    int? price,
    Value<String?> description = const Value.absent(),
    bool? isAvailable,
    int? displayOrder,
    Value<String?> imageUrl = const Value.absent(),
  }) => MenuItemRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    name: name ?? this.name,
    categoryId: categoryId ?? this.categoryId,
    price: price ?? this.price,
    description: description.present ? description.value : this.description,
    isAvailable: isAvailable ?? this.isAvailable,
    displayOrder: displayOrder ?? this.displayOrder,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  MenuItemRow copyWithCompanion(MenuItemsCompanion data) {
    return MenuItemRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      price: data.price.present ? data.price.value : this.price,
      description: data.description.present
          ? data.description.value
          : this.description,
      isAvailable: data.isAvailable.present
          ? data.isAvailable.value
          : this.isAvailable,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuItemRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    name,
    categoryId,
    price,
    description,
    isAvailable,
    displayOrder,
    imageUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuItemRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.categoryId == this.categoryId &&
          other.price == this.price &&
          other.description == this.description &&
          other.isAvailable == this.isAvailable &&
          other.displayOrder == this.displayOrder &&
          other.imageUrl == this.imageUrl);
}

class MenuItemsCompanion extends UpdateCompanion<MenuItemRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String> name;
  final Value<String> categoryId;
  final Value<int> price;
  final Value<String?> description;
  final Value<bool> isAvailable;
  final Value<int> displayOrder;
  final Value<String?> imageUrl;
  final Value<int> rowid;
  const MenuItemsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.price = const Value.absent(),
    this.description = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MenuItemsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    required String categoryId,
    required int price,
    this.description = const Value.absent(),
    this.isAvailable = const Value.absent(),
    required int displayOrder,
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       categoryId = Value(categoryId),
       price = Value(price),
       displayOrder = Value(displayOrder);
  static Insertable<MenuItemRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? categoryId,
    Expression<int>? price,
    Expression<String>? description,
    Expression<bool>? isAvailable,
    Expression<int>? displayOrder,
    Expression<String>? imageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (isAvailable != null) 'is_available': isAvailable,
      if (displayOrder != null) 'display_order': displayOrder,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MenuItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<String>? name,
    Value<String>? categoryId,
    Value<int>? price,
    Value<String?>? description,
    Value<bool>? isAvailable,
    Value<int>? displayOrder,
    Value<String?>? imageUrl,
    Value<int>? rowid,
  }) {
    return MenuItemsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      price: price ?? this.price,
      description: description ?? this.description,
      isAvailable: isAvailable ?? this.isAvailable,
      displayOrder: displayOrder ?? this.displayOrder,
      imageUrl: imageUrl ?? this.imageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuItemsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, OrderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<int> totalAmount = GeneratedColumn<int>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderNumberMeta = const VerificationMeta(
    'orderNumber',
  );
  @override
  late final GeneratedColumn<String> orderNumber = GeneratedColumn<String>(
    'order_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCartMeta = const VerificationMeta('isCart');
  @override
  late final GeneratedColumn<bool> isCart = GeneratedColumn<bool>(
    'is_cart',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_cart" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<OrderStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant<String>(OrderStatus.inProgress.value),
      ).withConverter<OrderStatus>($OrdersTable.$converterstatus);
  @override
  late final GeneratedColumnWithTypeConverter<PaymentMethod, String>
  paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<PaymentMethod>($OrdersTable.$converterpaymentMethod);
  static const VerificationMeta _discountAmountMeta = const VerificationMeta(
    'discountAmount',
  );
  @override
  late final GeneratedColumn<int> discountAmount = GeneratedColumn<int>(
    'discount_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _customerNameMeta = const VerificationMeta(
    'customerName',
  );
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
    'customer_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderedAtMeta = const VerificationMeta(
    'orderedAt',
  );
  @override
  late final GeneratedColumn<DateTime> orderedAt = GeneratedColumn<DateTime>(
    'ordered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedPreparingAtMeta =
      const VerificationMeta('startedPreparingAt');
  @override
  late final GeneratedColumn<DateTime> startedPreparingAt =
      GeneratedColumn<DateTime>(
        'started_preparing_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _readyAtMeta = const VerificationMeta(
    'readyAt',
  );
  @override
  late final GeneratedColumn<DateTime> readyAt = GeneratedColumn<DateTime>(
    'ready_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    totalAmount,
    orderNumber,
    isCart,
    status,
    paymentMethod,
    discountAmount,
    customerName,
    notes,
    orderedAt,
    startedPreparingAt,
    readyAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('order_number')) {
      context.handle(
        _orderNumberMeta,
        orderNumber.isAcceptableOrUnknown(
          data['order_number']!,
          _orderNumberMeta,
        ),
      );
    }
    if (data.containsKey('is_cart')) {
      context.handle(
        _isCartMeta,
        isCart.isAcceptableOrUnknown(data['is_cart']!, _isCartMeta),
      );
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
        _discountAmountMeta,
        discountAmount.isAcceptableOrUnknown(
          data['discount_amount']!,
          _discountAmountMeta,
        ),
      );
    }
    if (data.containsKey('customer_name')) {
      context.handle(
        _customerNameMeta,
        customerName.isAcceptableOrUnknown(
          data['customer_name']!,
          _customerNameMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('ordered_at')) {
      context.handle(
        _orderedAtMeta,
        orderedAt.isAcceptableOrUnknown(data['ordered_at']!, _orderedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_orderedAtMeta);
    }
    if (data.containsKey('started_preparing_at')) {
      context.handle(
        _startedPreparingAtMeta,
        startedPreparingAt.isAcceptableOrUnknown(
          data['started_preparing_at']!,
          _startedPreparingAtMeta,
        ),
      );
    }
    if (data.containsKey('ready_at')) {
      context.handle(
        _readyAtMeta,
        readyAt.isAcceptableOrUnknown(data['ready_at']!, _readyAtMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_amount'],
      )!,
      orderNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_number'],
      ),
      isCart: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_cart'],
      )!,
      status: $OrdersTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      paymentMethod: $OrdersTable.$converterpaymentMethod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}payment_method'],
        )!,
      ),
      discountAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_amount'],
      )!,
      customerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_name'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      orderedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ordered_at'],
      )!,
      startedPreparingAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_preparing_at'],
      ),
      readyAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ready_at'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }

  static TypeConverter<OrderStatus, String> $converterstatus =
      const OrderStatusConverter();
  static TypeConverter<PaymentMethod, String> $converterpaymentMethod =
      const PaymentMethodConverter();
}

class OrderRow extends DataClass implements Insertable<OrderRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int totalAmount;
  final String? orderNumber;
  final bool isCart;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
  final int discountAmount;
  final String? customerName;
  final String? notes;
  final DateTime orderedAt;
  final DateTime? startedPreparingAt;
  final DateTime? readyAt;
  final DateTime? completedAt;
  const OrderRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.totalAmount,
    this.orderNumber,
    required this.isCart,
    required this.status,
    required this.paymentMethod,
    required this.discountAmount,
    this.customerName,
    this.notes,
    required this.orderedAt,
    this.startedPreparingAt,
    this.readyAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['total_amount'] = Variable<int>(totalAmount);
    if (!nullToAbsent || orderNumber != null) {
      map['order_number'] = Variable<String>(orderNumber);
    }
    map['is_cart'] = Variable<bool>(isCart);
    {
      map['status'] = Variable<String>(
        $OrdersTable.$converterstatus.toSql(status),
      );
    }
    {
      map['payment_method'] = Variable<String>(
        $OrdersTable.$converterpaymentMethod.toSql(paymentMethod),
      );
    }
    map['discount_amount'] = Variable<int>(discountAmount);
    if (!nullToAbsent || customerName != null) {
      map['customer_name'] = Variable<String>(customerName);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['ordered_at'] = Variable<DateTime>(orderedAt);
    if (!nullToAbsent || startedPreparingAt != null) {
      map['started_preparing_at'] = Variable<DateTime>(startedPreparingAt);
    }
    if (!nullToAbsent || readyAt != null) {
      map['ready_at'] = Variable<DateTime>(readyAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      totalAmount: Value(totalAmount),
      orderNumber: orderNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(orderNumber),
      isCart: Value(isCart),
      status: Value(status),
      paymentMethod: Value(paymentMethod),
      discountAmount: Value(discountAmount),
      customerName: customerName == null && nullToAbsent
          ? const Value.absent()
          : Value(customerName),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      orderedAt: Value(orderedAt),
      startedPreparingAt: startedPreparingAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedPreparingAt),
      readyAt: readyAt == null && nullToAbsent
          ? const Value.absent()
          : Value(readyAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory OrderRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      totalAmount: serializer.fromJson<int>(json['totalAmount']),
      orderNumber: serializer.fromJson<String?>(json['orderNumber']),
      isCart: serializer.fromJson<bool>(json['isCart']),
      status: serializer.fromJson<OrderStatus>(json['status']),
      paymentMethod: serializer.fromJson<PaymentMethod>(json['paymentMethod']),
      discountAmount: serializer.fromJson<int>(json['discountAmount']),
      customerName: serializer.fromJson<String?>(json['customerName']),
      notes: serializer.fromJson<String?>(json['notes']),
      orderedAt: serializer.fromJson<DateTime>(json['orderedAt']),
      startedPreparingAt: serializer.fromJson<DateTime?>(
        json['startedPreparingAt'],
      ),
      readyAt: serializer.fromJson<DateTime?>(json['readyAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'totalAmount': serializer.toJson<int>(totalAmount),
      'orderNumber': serializer.toJson<String?>(orderNumber),
      'isCart': serializer.toJson<bool>(isCart),
      'status': serializer.toJson<OrderStatus>(status),
      'paymentMethod': serializer.toJson<PaymentMethod>(paymentMethod),
      'discountAmount': serializer.toJson<int>(discountAmount),
      'customerName': serializer.toJson<String?>(customerName),
      'notes': serializer.toJson<String?>(notes),
      'orderedAt': serializer.toJson<DateTime>(orderedAt),
      'startedPreparingAt': serializer.toJson<DateTime?>(startedPreparingAt),
      'readyAt': serializer.toJson<DateTime?>(readyAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  OrderRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    int? totalAmount,
    Value<String?> orderNumber = const Value.absent(),
    bool? isCart,
    OrderStatus? status,
    PaymentMethod? paymentMethod,
    int? discountAmount,
    Value<String?> customerName = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? orderedAt,
    Value<DateTime?> startedPreparingAt = const Value.absent(),
    Value<DateTime?> readyAt = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
  }) => OrderRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    totalAmount: totalAmount ?? this.totalAmount,
    orderNumber: orderNumber.present ? orderNumber.value : this.orderNumber,
    isCart: isCart ?? this.isCart,
    status: status ?? this.status,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    discountAmount: discountAmount ?? this.discountAmount,
    customerName: customerName.present ? customerName.value : this.customerName,
    notes: notes.present ? notes.value : this.notes,
    orderedAt: orderedAt ?? this.orderedAt,
    startedPreparingAt: startedPreparingAt.present
        ? startedPreparingAt.value
        : this.startedPreparingAt,
    readyAt: readyAt.present ? readyAt.value : this.readyAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  OrderRow copyWithCompanion(OrdersCompanion data) {
    return OrderRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      orderNumber: data.orderNumber.present
          ? data.orderNumber.value
          : this.orderNumber,
      isCart: data.isCart.present ? data.isCart.value : this.isCart,
      status: data.status.present ? data.status.value : this.status,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      discountAmount: data.discountAmount.present
          ? data.discountAmount.value
          : this.discountAmount,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      notes: data.notes.present ? data.notes.value : this.notes,
      orderedAt: data.orderedAt.present ? data.orderedAt.value : this.orderedAt,
      startedPreparingAt: data.startedPreparingAt.present
          ? data.startedPreparingAt.value
          : this.startedPreparingAt,
      readyAt: data.readyAt.present ? data.readyAt.value : this.readyAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('isCart: $isCart, ')
          ..write('status: $status, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('customerName: $customerName, ')
          ..write('notes: $notes, ')
          ..write('orderedAt: $orderedAt, ')
          ..write('startedPreparingAt: $startedPreparingAt, ')
          ..write('readyAt: $readyAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    totalAmount,
    orderNumber,
    isCart,
    status,
    paymentMethod,
    discountAmount,
    customerName,
    notes,
    orderedAt,
    startedPreparingAt,
    readyAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.totalAmount == this.totalAmount &&
          other.orderNumber == this.orderNumber &&
          other.isCart == this.isCart &&
          other.status == this.status &&
          other.paymentMethod == this.paymentMethod &&
          other.discountAmount == this.discountAmount &&
          other.customerName == this.customerName &&
          other.notes == this.notes &&
          other.orderedAt == this.orderedAt &&
          other.startedPreparingAt == this.startedPreparingAt &&
          other.readyAt == this.readyAt &&
          other.completedAt == this.completedAt);
}

class OrdersCompanion extends UpdateCompanion<OrderRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> totalAmount;
  final Value<String?> orderNumber;
  final Value<bool> isCart;
  final Value<OrderStatus> status;
  final Value<PaymentMethod> paymentMethod;
  final Value<int> discountAmount;
  final Value<String?> customerName;
  final Value<String?> notes;
  final Value<DateTime> orderedAt;
  final Value<DateTime?> startedPreparingAt;
  final Value<DateTime?> readyAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.isCart = const Value.absent(),
    this.status = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.customerName = const Value.absent(),
    this.notes = const Value.absent(),
    this.orderedAt = const Value.absent(),
    this.startedPreparingAt = const Value.absent(),
    this.readyAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required int totalAmount,
    this.orderNumber = const Value.absent(),
    this.isCart = const Value.absent(),
    this.status = const Value.absent(),
    required PaymentMethod paymentMethod,
    this.discountAmount = const Value.absent(),
    this.customerName = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime orderedAt,
    this.startedPreparingAt = const Value.absent(),
    this.readyAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : totalAmount = Value(totalAmount),
       paymentMethod = Value(paymentMethod),
       orderedAt = Value(orderedAt);
  static Insertable<OrderRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? totalAmount,
    Expression<String>? orderNumber,
    Expression<bool>? isCart,
    Expression<String>? status,
    Expression<String>? paymentMethod,
    Expression<int>? discountAmount,
    Expression<String>? customerName,
    Expression<String>? notes,
    Expression<DateTime>? orderedAt,
    Expression<DateTime>? startedPreparingAt,
    Expression<DateTime>? readyAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (orderNumber != null) 'order_number': orderNumber,
      if (isCart != null) 'is_cart': isCart,
      if (status != null) 'status': status,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (customerName != null) 'customer_name': customerName,
      if (notes != null) 'notes': notes,
      if (orderedAt != null) 'ordered_at': orderedAt,
      if (startedPreparingAt != null)
        'started_preparing_at': startedPreparingAt,
      if (readyAt != null) 'ready_at': readyAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrdersCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? totalAmount,
    Value<String?>? orderNumber,
    Value<bool>? isCart,
    Value<OrderStatus>? status,
    Value<PaymentMethod>? paymentMethod,
    Value<int>? discountAmount,
    Value<String?>? customerName,
    Value<String?>? notes,
    Value<DateTime>? orderedAt,
    Value<DateTime?>? startedPreparingAt,
    Value<DateTime?>? readyAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return OrdersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      totalAmount: totalAmount ?? this.totalAmount,
      orderNumber: orderNumber ?? this.orderNumber,
      isCart: isCart ?? this.isCart,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      discountAmount: discountAmount ?? this.discountAmount,
      customerName: customerName ?? this.customerName,
      notes: notes ?? this.notes,
      orderedAt: orderedAt ?? this.orderedAt,
      startedPreparingAt: startedPreparingAt ?? this.startedPreparingAt,
      readyAt: readyAt ?? this.readyAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<int>(totalAmount.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (isCart.present) {
      map['is_cart'] = Variable<bool>(isCart.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $OrdersTable.$converterstatus.toSql(status.value),
      );
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(
        $OrdersTable.$converterpaymentMethod.toSql(paymentMethod.value),
      );
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<int>(discountAmount.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (orderedAt.present) {
      map['ordered_at'] = Variable<DateTime>(orderedAt.value);
    }
    if (startedPreparingAt.present) {
      map['started_preparing_at'] = Variable<DateTime>(
        startedPreparingAt.value,
      );
    }
    if (readyAt.present) {
      map['ready_at'] = Variable<DateTime>(readyAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('isCart: $isCart, ')
          ..write('status: $status, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('customerName: $customerName, ')
          ..write('notes: $notes, ')
          ..write('orderedAt: $orderedAt, ')
          ..write('startedPreparingAt: $startedPreparingAt, ')
          ..write('readyAt: $readyAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrderItemsTable extends OrderItems
    with TableInfo<$OrderItemsTable, OrderItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<String> orderId = GeneratedColumn<String>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _menuItemIdMeta = const VerificationMeta(
    'menuItemId',
  );
  @override
  late final GeneratedColumn<String> menuItemId = GeneratedColumn<String>(
    'menu_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<int> subtotal = GeneratedColumn<int>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>?, String>
  selectedOptions =
      GeneratedColumn<String>(
        'selected_options',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, String>?>(
        $OrderItemsTable.$converterselectedOptionsn,
      );
  static const VerificationMeta _specialRequestMeta = const VerificationMeta(
    'specialRequest',
  );
  @override
  late final GeneratedColumn<String> specialRequest = GeneratedColumn<String>(
    'special_request',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    orderId,
    menuItemId,
    quantity,
    unitPrice,
    subtotal,
    selectedOptions,
    specialRequest,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('menu_item_id')) {
      context.handle(
        _menuItemIdMeta,
        menuItemId.isAcceptableOrUnknown(
          data['menu_item_id']!,
          _menuItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_menuItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('special_request')) {
      context.handle(
        _specialRequestMeta,
        specialRequest.isAcceptableOrUnknown(
          data['special_request']!,
          _specialRequestMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_id'],
      )!,
      menuItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}menu_item_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal'],
      )!,
      selectedOptions: $OrderItemsTable.$converterselectedOptionsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}selected_options'],
        ),
      ),
      specialRequest: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}special_request'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $OrderItemsTable createAlias(String alias) {
    return $OrderItemsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $converterselectedOptions =
      const StringMapJsonConverter();
  static TypeConverter<Map<String, String>?, String?>
  $converterselectedOptionsn = NullAwareTypeConverter.wrap(
    $converterselectedOptions,
  );
}

class OrderItemRow extends DataClass implements Insertable<OrderItemRow> {
  final String id;
  final String userId;
  final String orderId;
  final String menuItemId;
  final int quantity;
  final int unitPrice;
  final int subtotal;
  final Map<String, String>? selectedOptions;
  final String? specialRequest;
  final DateTime? createdAt;
  const OrderItemRow({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.menuItemId,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
    this.selectedOptions,
    this.specialRequest,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['order_id'] = Variable<String>(orderId);
    map['menu_item_id'] = Variable<String>(menuItemId);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<int>(unitPrice);
    map['subtotal'] = Variable<int>(subtotal);
    if (!nullToAbsent || selectedOptions != null) {
      map['selected_options'] = Variable<String>(
        $OrderItemsTable.$converterselectedOptionsn.toSql(selectedOptions),
      );
    }
    if (!nullToAbsent || specialRequest != null) {
      map['special_request'] = Variable<String>(specialRequest);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  OrderItemsCompanion toCompanion(bool nullToAbsent) {
    return OrderItemsCompanion(
      id: Value(id),
      userId: Value(userId),
      orderId: Value(orderId),
      menuItemId: Value(menuItemId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      subtotal: Value(subtotal),
      selectedOptions: selectedOptions == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedOptions),
      specialRequest: specialRequest == null && nullToAbsent
          ? const Value.absent()
          : Value(specialRequest),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory OrderItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      orderId: serializer.fromJson<String>(json['orderId']),
      menuItemId: serializer.fromJson<String>(json['menuItemId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      subtotal: serializer.fromJson<int>(json['subtotal']),
      selectedOptions: serializer.fromJson<Map<String, String>?>(
        json['selectedOptions'],
      ),
      specialRequest: serializer.fromJson<String?>(json['specialRequest']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'orderId': serializer.toJson<String>(orderId),
      'menuItemId': serializer.toJson<String>(menuItemId),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'subtotal': serializer.toJson<int>(subtotal),
      'selectedOptions': serializer.toJson<Map<String, String>?>(
        selectedOptions,
      ),
      'specialRequest': serializer.toJson<String?>(specialRequest),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  OrderItemRow copyWith({
    String? id,
    String? userId,
    String? orderId,
    String? menuItemId,
    int? quantity,
    int? unitPrice,
    int? subtotal,
    Value<Map<String, String>?> selectedOptions = const Value.absent(),
    Value<String?> specialRequest = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
  }) => OrderItemRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    orderId: orderId ?? this.orderId,
    menuItemId: menuItemId ?? this.menuItemId,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    subtotal: subtotal ?? this.subtotal,
    selectedOptions: selectedOptions.present
        ? selectedOptions.value
        : this.selectedOptions,
    specialRequest: specialRequest.present
        ? specialRequest.value
        : this.specialRequest,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  OrderItemRow copyWithCompanion(OrderItemsCompanion data) {
    return OrderItemRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      menuItemId: data.menuItemId.present
          ? data.menuItemId.value
          : this.menuItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      selectedOptions: data.selectedOptions.present
          ? data.selectedOptions.value
          : this.selectedOptions,
      specialRequest: data.specialRequest.present
          ? data.specialRequest.value
          : this.specialRequest,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('orderId: $orderId, ')
          ..write('menuItemId: $menuItemId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('subtotal: $subtotal, ')
          ..write('selectedOptions: $selectedOptions, ')
          ..write('specialRequest: $specialRequest, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    orderId,
    menuItemId,
    quantity,
    unitPrice,
    subtotal,
    selectedOptions,
    specialRequest,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.orderId == this.orderId &&
          other.menuItemId == this.menuItemId &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.subtotal == this.subtotal &&
          other.selectedOptions == this.selectedOptions &&
          other.specialRequest == this.specialRequest &&
          other.createdAt == this.createdAt);
}

class OrderItemsCompanion extends UpdateCompanion<OrderItemRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> orderId;
  final Value<String> menuItemId;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<int> subtotal;
  final Value<Map<String, String>?> selectedOptions;
  final Value<String?> specialRequest;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const OrderItemsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.menuItemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.selectedOptions = const Value.absent(),
    this.specialRequest = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrderItemsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String orderId,
    required String menuItemId,
    required int quantity,
    required int unitPrice,
    required int subtotal,
    this.selectedOptions = const Value.absent(),
    this.specialRequest = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : orderId = Value(orderId),
       menuItemId = Value(menuItemId),
       quantity = Value(quantity),
       unitPrice = Value(unitPrice),
       subtotal = Value(subtotal);
  static Insertable<OrderItemRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? orderId,
    Expression<String>? menuItemId,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<int>? subtotal,
    Expression<String>? selectedOptions,
    Expression<String>? specialRequest,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (orderId != null) 'order_id': orderId,
      if (menuItemId != null) 'menu_item_id': menuItemId,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (subtotal != null) 'subtotal': subtotal,
      if (selectedOptions != null) 'selected_options': selectedOptions,
      if (specialRequest != null) 'special_request': specialRequest,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrderItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? orderId,
    Value<String>? menuItemId,
    Value<int>? quantity,
    Value<int>? unitPrice,
    Value<int>? subtotal,
    Value<Map<String, String>?>? selectedOptions,
    Value<String?>? specialRequest,
    Value<DateTime?>? createdAt,
    Value<int>? rowid,
  }) {
    return OrderItemsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderId: orderId ?? this.orderId,
      menuItemId: menuItemId ?? this.menuItemId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      subtotal: subtotal ?? this.subtotal,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      specialRequest: specialRequest ?? this.specialRequest,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (menuItemId.present) {
      map['menu_item_id'] = Variable<String>(menuItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<int>(subtotal.value);
    }
    if (selectedOptions.present) {
      map['selected_options'] = Variable<String>(
        $OrderItemsTable.$converterselectedOptionsn.toSql(
          selectedOptions.value,
        ),
      );
    }
    if (specialRequest.present) {
      map['special_request'] = Variable<String>(specialRequest.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('orderId: $orderId, ')
          ..write('menuItemId: $menuItemId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('subtotal: $subtotal, ')
          ..write('selectedOptions: $selectedOptions, ')
          ..write('specialRequest: $specialRequest, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailySummariesTable extends DailySummaries
    with TableInfo<$DailySummariesTable, DailySummaryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailySummariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: _createLocalId,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(demoUserId),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _summaryDateMeta = const VerificationMeta(
    'summaryDate',
  );
  @override
  late final GeneratedColumn<DateTime> summaryDate = GeneratedColumn<DateTime>(
    'summary_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalOrdersMeta = const VerificationMeta(
    'totalOrders',
  );
  @override
  late final GeneratedColumn<int> totalOrders = GeneratedColumn<int>(
    'total_orders',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedOrdersMeta = const VerificationMeta(
    'completedOrders',
  );
  @override
  late final GeneratedColumn<int> completedOrders = GeneratedColumn<int>(
    'completed_orders',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pendingOrdersMeta = const VerificationMeta(
    'pendingOrders',
  );
  @override
  late final GeneratedColumn<int> pendingOrders = GeneratedColumn<int>(
    'pending_orders',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalRevenueMeta = const VerificationMeta(
    'totalRevenue',
  );
  @override
  late final GeneratedColumn<int> totalRevenue = GeneratedColumn<int>(
    'total_revenue',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _averagePrepTimeMinutesMeta =
      const VerificationMeta('averagePrepTimeMinutes');
  @override
  late final GeneratedColumn<int> averagePrepTimeMinutes = GeneratedColumn<int>(
    'average_prep_time_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mostPopularItemIdMeta = const VerificationMeta(
    'mostPopularItemId',
  );
  @override
  late final GeneratedColumn<String> mostPopularItemId =
      GeneratedColumn<String>(
        'most_popular_item_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _mostPopularItemCountMeta =
      const VerificationMeta('mostPopularItemCount');
  @override
  late final GeneratedColumn<int> mostPopularItemCount = GeneratedColumn<int>(
    'most_popular_item_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    summaryDate,
    totalOrders,
    completedOrders,
    pendingOrders,
    totalRevenue,
    averagePrepTimeMinutes,
    mostPopularItemId,
    mostPopularItemCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_summaries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailySummaryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('summary_date')) {
      context.handle(
        _summaryDateMeta,
        summaryDate.isAcceptableOrUnknown(
          data['summary_date']!,
          _summaryDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_summaryDateMeta);
    }
    if (data.containsKey('total_orders')) {
      context.handle(
        _totalOrdersMeta,
        totalOrders.isAcceptableOrUnknown(
          data['total_orders']!,
          _totalOrdersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalOrdersMeta);
    }
    if (data.containsKey('completed_orders')) {
      context.handle(
        _completedOrdersMeta,
        completedOrders.isAcceptableOrUnknown(
          data['completed_orders']!,
          _completedOrdersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedOrdersMeta);
    }
    if (data.containsKey('pending_orders')) {
      context.handle(
        _pendingOrdersMeta,
        pendingOrders.isAcceptableOrUnknown(
          data['pending_orders']!,
          _pendingOrdersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pendingOrdersMeta);
    }
    if (data.containsKey('total_revenue')) {
      context.handle(
        _totalRevenueMeta,
        totalRevenue.isAcceptableOrUnknown(
          data['total_revenue']!,
          _totalRevenueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalRevenueMeta);
    }
    if (data.containsKey('average_prep_time_minutes')) {
      context.handle(
        _averagePrepTimeMinutesMeta,
        averagePrepTimeMinutes.isAcceptableOrUnknown(
          data['average_prep_time_minutes']!,
          _averagePrepTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('most_popular_item_id')) {
      context.handle(
        _mostPopularItemIdMeta,
        mostPopularItemId.isAcceptableOrUnknown(
          data['most_popular_item_id']!,
          _mostPopularItemIdMeta,
        ),
      );
    }
    if (data.containsKey('most_popular_item_count')) {
      context.handle(
        _mostPopularItemCountMeta,
        mostPopularItemCount.isAcceptableOrUnknown(
          data['most_popular_item_count']!,
          _mostPopularItemCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mostPopularItemCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailySummaryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailySummaryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      summaryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}summary_date'],
      )!,
      totalOrders: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_orders'],
      )!,
      completedOrders: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_orders'],
      )!,
      pendingOrders: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pending_orders'],
      )!,
      totalRevenue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_revenue'],
      )!,
      averagePrepTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}average_prep_time_minutes'],
      ),
      mostPopularItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}most_popular_item_id'],
      ),
      mostPopularItemCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}most_popular_item_count'],
      )!,
    );
  }

  @override
  $DailySummariesTable createAlias(String alias) {
    return $DailySummariesTable(attachedDatabase, alias);
  }
}

class DailySummaryRow extends DataClass implements Insertable<DailySummaryRow> {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime summaryDate;
  final int totalOrders;
  final int completedOrders;
  final int pendingOrders;
  final int totalRevenue;
  final int? averagePrepTimeMinutes;
  final String? mostPopularItemId;
  final int mostPopularItemCount;
  const DailySummaryRow({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    required this.summaryDate,
    required this.totalOrders,
    required this.completedOrders,
    required this.pendingOrders,
    required this.totalRevenue,
    this.averagePrepTimeMinutes,
    this.mostPopularItemId,
    required this.mostPopularItemCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['summary_date'] = Variable<DateTime>(summaryDate);
    map['total_orders'] = Variable<int>(totalOrders);
    map['completed_orders'] = Variable<int>(completedOrders);
    map['pending_orders'] = Variable<int>(pendingOrders);
    map['total_revenue'] = Variable<int>(totalRevenue);
    if (!nullToAbsent || averagePrepTimeMinutes != null) {
      map['average_prep_time_minutes'] = Variable<int>(averagePrepTimeMinutes);
    }
    if (!nullToAbsent || mostPopularItemId != null) {
      map['most_popular_item_id'] = Variable<String>(mostPopularItemId);
    }
    map['most_popular_item_count'] = Variable<int>(mostPopularItemCount);
    return map;
  }

  DailySummariesCompanion toCompanion(bool nullToAbsent) {
    return DailySummariesCompanion(
      id: Value(id),
      userId: Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      summaryDate: Value(summaryDate),
      totalOrders: Value(totalOrders),
      completedOrders: Value(completedOrders),
      pendingOrders: Value(pendingOrders),
      totalRevenue: Value(totalRevenue),
      averagePrepTimeMinutes: averagePrepTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(averagePrepTimeMinutes),
      mostPopularItemId: mostPopularItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(mostPopularItemId),
      mostPopularItemCount: Value(mostPopularItemCount),
    );
  }

  factory DailySummaryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailySummaryRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      summaryDate: serializer.fromJson<DateTime>(json['summaryDate']),
      totalOrders: serializer.fromJson<int>(json['totalOrders']),
      completedOrders: serializer.fromJson<int>(json['completedOrders']),
      pendingOrders: serializer.fromJson<int>(json['pendingOrders']),
      totalRevenue: serializer.fromJson<int>(json['totalRevenue']),
      averagePrepTimeMinutes: serializer.fromJson<int?>(
        json['averagePrepTimeMinutes'],
      ),
      mostPopularItemId: serializer.fromJson<String?>(
        json['mostPopularItemId'],
      ),
      mostPopularItemCount: serializer.fromJson<int>(
        json['mostPopularItemCount'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'summaryDate': serializer.toJson<DateTime>(summaryDate),
      'totalOrders': serializer.toJson<int>(totalOrders),
      'completedOrders': serializer.toJson<int>(completedOrders),
      'pendingOrders': serializer.toJson<int>(pendingOrders),
      'totalRevenue': serializer.toJson<int>(totalRevenue),
      'averagePrepTimeMinutes': serializer.toJson<int?>(averagePrepTimeMinutes),
      'mostPopularItemId': serializer.toJson<String?>(mostPopularItemId),
      'mostPopularItemCount': serializer.toJson<int>(mostPopularItemCount),
    };
  }

  DailySummaryRow copyWith({
    String? id,
    String? userId,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    DateTime? summaryDate,
    int? totalOrders,
    int? completedOrders,
    int? pendingOrders,
    int? totalRevenue,
    Value<int?> averagePrepTimeMinutes = const Value.absent(),
    Value<String?> mostPopularItemId = const Value.absent(),
    int? mostPopularItemCount,
  }) => DailySummaryRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    summaryDate: summaryDate ?? this.summaryDate,
    totalOrders: totalOrders ?? this.totalOrders,
    completedOrders: completedOrders ?? this.completedOrders,
    pendingOrders: pendingOrders ?? this.pendingOrders,
    totalRevenue: totalRevenue ?? this.totalRevenue,
    averagePrepTimeMinutes: averagePrepTimeMinutes.present
        ? averagePrepTimeMinutes.value
        : this.averagePrepTimeMinutes,
    mostPopularItemId: mostPopularItemId.present
        ? mostPopularItemId.value
        : this.mostPopularItemId,
    mostPopularItemCount: mostPopularItemCount ?? this.mostPopularItemCount,
  );
  DailySummaryRow copyWithCompanion(DailySummariesCompanion data) {
    return DailySummaryRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      summaryDate: data.summaryDate.present
          ? data.summaryDate.value
          : this.summaryDate,
      totalOrders: data.totalOrders.present
          ? data.totalOrders.value
          : this.totalOrders,
      completedOrders: data.completedOrders.present
          ? data.completedOrders.value
          : this.completedOrders,
      pendingOrders: data.pendingOrders.present
          ? data.pendingOrders.value
          : this.pendingOrders,
      totalRevenue: data.totalRevenue.present
          ? data.totalRevenue.value
          : this.totalRevenue,
      averagePrepTimeMinutes: data.averagePrepTimeMinutes.present
          ? data.averagePrepTimeMinutes.value
          : this.averagePrepTimeMinutes,
      mostPopularItemId: data.mostPopularItemId.present
          ? data.mostPopularItemId.value
          : this.mostPopularItemId,
      mostPopularItemCount: data.mostPopularItemCount.present
          ? data.mostPopularItemCount.value
          : this.mostPopularItemCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailySummaryRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('summaryDate: $summaryDate, ')
          ..write('totalOrders: $totalOrders, ')
          ..write('completedOrders: $completedOrders, ')
          ..write('pendingOrders: $pendingOrders, ')
          ..write('totalRevenue: $totalRevenue, ')
          ..write('averagePrepTimeMinutes: $averagePrepTimeMinutes, ')
          ..write('mostPopularItemId: $mostPopularItemId, ')
          ..write('mostPopularItemCount: $mostPopularItemCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    summaryDate,
    totalOrders,
    completedOrders,
    pendingOrders,
    totalRevenue,
    averagePrepTimeMinutes,
    mostPopularItemId,
    mostPopularItemCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailySummaryRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.summaryDate == this.summaryDate &&
          other.totalOrders == this.totalOrders &&
          other.completedOrders == this.completedOrders &&
          other.pendingOrders == this.pendingOrders &&
          other.totalRevenue == this.totalRevenue &&
          other.averagePrepTimeMinutes == this.averagePrepTimeMinutes &&
          other.mostPopularItemId == this.mostPopularItemId &&
          other.mostPopularItemCount == this.mostPopularItemCount);
}

class DailySummariesCompanion extends UpdateCompanion<DailySummaryRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime> summaryDate;
  final Value<int> totalOrders;
  final Value<int> completedOrders;
  final Value<int> pendingOrders;
  final Value<int> totalRevenue;
  final Value<int?> averagePrepTimeMinutes;
  final Value<String?> mostPopularItemId;
  final Value<int> mostPopularItemCount;
  final Value<int> rowid;
  const DailySummariesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.summaryDate = const Value.absent(),
    this.totalOrders = const Value.absent(),
    this.completedOrders = const Value.absent(),
    this.pendingOrders = const Value.absent(),
    this.totalRevenue = const Value.absent(),
    this.averagePrepTimeMinutes = const Value.absent(),
    this.mostPopularItemId = const Value.absent(),
    this.mostPopularItemCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailySummariesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required DateTime summaryDate,
    required int totalOrders,
    required int completedOrders,
    required int pendingOrders,
    required int totalRevenue,
    this.averagePrepTimeMinutes = const Value.absent(),
    this.mostPopularItemId = const Value.absent(),
    required int mostPopularItemCount,
    this.rowid = const Value.absent(),
  }) : summaryDate = Value(summaryDate),
       totalOrders = Value(totalOrders),
       completedOrders = Value(completedOrders),
       pendingOrders = Value(pendingOrders),
       totalRevenue = Value(totalRevenue),
       mostPopularItemCount = Value(mostPopularItemCount);
  static Insertable<DailySummaryRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? summaryDate,
    Expression<int>? totalOrders,
    Expression<int>? completedOrders,
    Expression<int>? pendingOrders,
    Expression<int>? totalRevenue,
    Expression<int>? averagePrepTimeMinutes,
    Expression<String>? mostPopularItemId,
    Expression<int>? mostPopularItemCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (summaryDate != null) 'summary_date': summaryDate,
      if (totalOrders != null) 'total_orders': totalOrders,
      if (completedOrders != null) 'completed_orders': completedOrders,
      if (pendingOrders != null) 'pending_orders': pendingOrders,
      if (totalRevenue != null) 'total_revenue': totalRevenue,
      if (averagePrepTimeMinutes != null)
        'average_prep_time_minutes': averagePrepTimeMinutes,
      if (mostPopularItemId != null) 'most_popular_item_id': mostPopularItemId,
      if (mostPopularItemCount != null)
        'most_popular_item_count': mostPopularItemCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailySummariesCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<DateTime>? summaryDate,
    Value<int>? totalOrders,
    Value<int>? completedOrders,
    Value<int>? pendingOrders,
    Value<int>? totalRevenue,
    Value<int?>? averagePrepTimeMinutes,
    Value<String?>? mostPopularItemId,
    Value<int>? mostPopularItemCount,
    Value<int>? rowid,
  }) {
    return DailySummariesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      summaryDate: summaryDate ?? this.summaryDate,
      totalOrders: totalOrders ?? this.totalOrders,
      completedOrders: completedOrders ?? this.completedOrders,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      averagePrepTimeMinutes:
          averagePrepTimeMinutes ?? this.averagePrepTimeMinutes,
      mostPopularItemId: mostPopularItemId ?? this.mostPopularItemId,
      mostPopularItemCount: mostPopularItemCount ?? this.mostPopularItemCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (summaryDate.present) {
      map['summary_date'] = Variable<DateTime>(summaryDate.value);
    }
    if (totalOrders.present) {
      map['total_orders'] = Variable<int>(totalOrders.value);
    }
    if (completedOrders.present) {
      map['completed_orders'] = Variable<int>(completedOrders.value);
    }
    if (pendingOrders.present) {
      map['pending_orders'] = Variable<int>(pendingOrders.value);
    }
    if (totalRevenue.present) {
      map['total_revenue'] = Variable<int>(totalRevenue.value);
    }
    if (averagePrepTimeMinutes.present) {
      map['average_prep_time_minutes'] = Variable<int>(
        averagePrepTimeMinutes.value,
      );
    }
    if (mostPopularItemId.present) {
      map['most_popular_item_id'] = Variable<String>(mostPopularItemId.value);
    }
    if (mostPopularItemCount.present) {
      map['most_popular_item_count'] = Variable<int>(
        mostPopularItemCount.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailySummariesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('summaryDate: $summaryDate, ')
          ..write('totalOrders: $totalOrders, ')
          ..write('completedOrders: $completedOrders, ')
          ..write('pendingOrders: $pendingOrders, ')
          ..write('totalRevenue: $totalRevenue, ')
          ..write('averagePrepTimeMinutes: $averagePrepTimeMinutes, ')
          ..write('mostPopularItemId: $mostPopularItemId, ')
          ..write('mostPopularItemCount: $mostPopularItemCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DemoSeedMarkersTable extends DemoSeedMarkers
    with TableInfo<$DemoSeedMarkersTable, DemoSeedMarkerRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DemoSeedMarkersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _seedKeyMeta = const VerificationMeta(
    'seedKey',
  );
  @override
  late final GeneratedColumn<String> seedKey = GeneratedColumn<String>(
    'seed_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seedVersionMeta = const VerificationMeta(
    'seedVersion',
  );
  @override
  late final GeneratedColumn<int> seedVersion = GeneratedColumn<int>(
    'seed_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _appliedAtMeta = const VerificationMeta(
    'appliedAt',
  );
  @override
  late final GeneratedColumn<DateTime> appliedAt = GeneratedColumn<DateTime>(
    'applied_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [seedKey, seedVersion, appliedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'demo_seed_markers';
  @override
  VerificationContext validateIntegrity(
    Insertable<DemoSeedMarkerRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('seed_key')) {
      context.handle(
        _seedKeyMeta,
        seedKey.isAcceptableOrUnknown(data['seed_key']!, _seedKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_seedKeyMeta);
    }
    if (data.containsKey('seed_version')) {
      context.handle(
        _seedVersionMeta,
        seedVersion.isAcceptableOrUnknown(
          data['seed_version']!,
          _seedVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_seedVersionMeta);
    }
    if (data.containsKey('applied_at')) {
      context.handle(
        _appliedAtMeta,
        appliedAt.isAcceptableOrUnknown(data['applied_at']!, _appliedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_appliedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {seedKey};
  @override
  DemoSeedMarkerRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DemoSeedMarkerRow(
      seedKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}seed_key'],
      )!,
      seedVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seed_version'],
      )!,
      appliedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}applied_at'],
      )!,
    );
  }

  @override
  $DemoSeedMarkersTable createAlias(String alias) {
    return $DemoSeedMarkersTable(attachedDatabase, alias);
  }
}

class DemoSeedMarkerRow extends DataClass
    implements Insertable<DemoSeedMarkerRow> {
  final String seedKey;
  final int seedVersion;
  final DateTime appliedAt;
  const DemoSeedMarkerRow({
    required this.seedKey,
    required this.seedVersion,
    required this.appliedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['seed_key'] = Variable<String>(seedKey);
    map['seed_version'] = Variable<int>(seedVersion);
    map['applied_at'] = Variable<DateTime>(appliedAt);
    return map;
  }

  DemoSeedMarkersCompanion toCompanion(bool nullToAbsent) {
    return DemoSeedMarkersCompanion(
      seedKey: Value(seedKey),
      seedVersion: Value(seedVersion),
      appliedAt: Value(appliedAt),
    );
  }

  factory DemoSeedMarkerRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DemoSeedMarkerRow(
      seedKey: serializer.fromJson<String>(json['seedKey']),
      seedVersion: serializer.fromJson<int>(json['seedVersion']),
      appliedAt: serializer.fromJson<DateTime>(json['appliedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'seedKey': serializer.toJson<String>(seedKey),
      'seedVersion': serializer.toJson<int>(seedVersion),
      'appliedAt': serializer.toJson<DateTime>(appliedAt),
    };
  }

  DemoSeedMarkerRow copyWith({
    String? seedKey,
    int? seedVersion,
    DateTime? appliedAt,
  }) => DemoSeedMarkerRow(
    seedKey: seedKey ?? this.seedKey,
    seedVersion: seedVersion ?? this.seedVersion,
    appliedAt: appliedAt ?? this.appliedAt,
  );
  DemoSeedMarkerRow copyWithCompanion(DemoSeedMarkersCompanion data) {
    return DemoSeedMarkerRow(
      seedKey: data.seedKey.present ? data.seedKey.value : this.seedKey,
      seedVersion: data.seedVersion.present
          ? data.seedVersion.value
          : this.seedVersion,
      appliedAt: data.appliedAt.present ? data.appliedAt.value : this.appliedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DemoSeedMarkerRow(')
          ..write('seedKey: $seedKey, ')
          ..write('seedVersion: $seedVersion, ')
          ..write('appliedAt: $appliedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(seedKey, seedVersion, appliedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DemoSeedMarkerRow &&
          other.seedKey == this.seedKey &&
          other.seedVersion == this.seedVersion &&
          other.appliedAt == this.appliedAt);
}

class DemoSeedMarkersCompanion extends UpdateCompanion<DemoSeedMarkerRow> {
  final Value<String> seedKey;
  final Value<int> seedVersion;
  final Value<DateTime> appliedAt;
  final Value<int> rowid;
  const DemoSeedMarkersCompanion({
    this.seedKey = const Value.absent(),
    this.seedVersion = const Value.absent(),
    this.appliedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DemoSeedMarkersCompanion.insert({
    required String seedKey,
    required int seedVersion,
    required DateTime appliedAt,
    this.rowid = const Value.absent(),
  }) : seedKey = Value(seedKey),
       seedVersion = Value(seedVersion),
       appliedAt = Value(appliedAt);
  static Insertable<DemoSeedMarkerRow> custom({
    Expression<String>? seedKey,
    Expression<int>? seedVersion,
    Expression<DateTime>? appliedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (seedKey != null) 'seed_key': seedKey,
      if (seedVersion != null) 'seed_version': seedVersion,
      if (appliedAt != null) 'applied_at': appliedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DemoSeedMarkersCompanion copyWith({
    Value<String>? seedKey,
    Value<int>? seedVersion,
    Value<DateTime>? appliedAt,
    Value<int>? rowid,
  }) {
    return DemoSeedMarkersCompanion(
      seedKey: seedKey ?? this.seedKey,
      seedVersion: seedVersion ?? this.seedVersion,
      appliedAt: appliedAt ?? this.appliedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (seedKey.present) {
      map['seed_key'] = Variable<String>(seedKey.value);
    }
    if (seedVersion.present) {
      map['seed_version'] = Variable<int>(seedVersion.value);
    }
    if (appliedAt.present) {
      map['applied_at'] = Variable<DateTime>(appliedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DemoSeedMarkersCompanion(')
          ..write('seedKey: $seedKey, ')
          ..write('seedVersion: $seedVersion, ')
          ..write('appliedAt: $appliedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$YataDemoDatabase extends GeneratedDatabase {
  _$YataDemoDatabase(QueryExecutor e) : super(e);
  $YataDemoDatabaseManager get managers => $YataDemoDatabaseManager(this);
  late final $MaterialCategoriesTable materialCategories =
      $MaterialCategoriesTable(this);
  late final $MaterialsTable materials = $MaterialsTable(this);
  late final $RecipesTable recipes = $RecipesTable(this);
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $StockTransactionsTable stockTransactions =
      $StockTransactionsTable(this);
  late final $PurchasesTable purchases = $PurchasesTable(this);
  late final $PurchaseItemsTable purchaseItems = $PurchaseItemsTable(this);
  late final $StockAdjustmentsTable stockAdjustments = $StockAdjustmentsTable(
    this,
  );
  late final $MenuCategoriesTable menuCategories = $MenuCategoriesTable(this);
  late final $MenuItemsTable menuItems = $MenuItemsTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $OrderItemsTable orderItems = $OrderItemsTable(this);
  late final $DailySummariesTable dailySummaries = $DailySummariesTable(this);
  late final $DemoSeedMarkersTable demoSeedMarkers = $DemoSeedMarkersTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    materialCategories,
    materials,
    recipes,
    suppliers,
    stockTransactions,
    purchases,
    purchaseItems,
    stockAdjustments,
    menuCategories,
    menuItems,
    orders,
    orderItems,
    dailySummaries,
    demoSeedMarkers,
  ];
}

typedef $$MaterialCategoriesTableCreateCompanionBuilder =
    MaterialCategoriesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String name,
      required int displayOrder,
      Value<String?> code,
      Value<int> rowid,
    });
typedef $$MaterialCategoriesTableUpdateCompanionBuilder =
    MaterialCategoriesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<int> displayOrder,
      Value<String?> code,
      Value<int> rowid,
    });

class $$MaterialCategoriesTableFilterComposer
    extends Composer<_$YataDemoDatabase, $MaterialCategoriesTable> {
  $$MaterialCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MaterialCategoriesTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $MaterialCategoriesTable> {
  $$MaterialCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MaterialCategoriesTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $MaterialCategoriesTable> {
  $$MaterialCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);
}

class $$MaterialCategoriesTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $MaterialCategoriesTable,
          MaterialCategoryRow,
          $$MaterialCategoriesTableFilterComposer,
          $$MaterialCategoriesTableOrderingComposer,
          $$MaterialCategoriesTableAnnotationComposer,
          $$MaterialCategoriesTableCreateCompanionBuilder,
          $$MaterialCategoriesTableUpdateCompanionBuilder,
          (
            MaterialCategoryRow,
            BaseReferences<
              _$YataDemoDatabase,
              $MaterialCategoriesTable,
              MaterialCategoryRow
            >,
          ),
          MaterialCategoryRow,
          PrefetchHooks Function()
        > {
  $$MaterialCategoriesTableTableManager(
    _$YataDemoDatabase db,
    $MaterialCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaterialCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaterialCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaterialCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MaterialCategoriesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                displayOrder: displayOrder,
                code: code,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                required int displayOrder,
                Value<String?> code = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MaterialCategoriesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                displayOrder: displayOrder,
                code: code,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MaterialCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $MaterialCategoriesTable,
      MaterialCategoryRow,
      $$MaterialCategoriesTableFilterComposer,
      $$MaterialCategoriesTableOrderingComposer,
      $$MaterialCategoriesTableAnnotationComposer,
      $$MaterialCategoriesTableCreateCompanionBuilder,
      $$MaterialCategoriesTableUpdateCompanionBuilder,
      (
        MaterialCategoryRow,
        BaseReferences<
          _$YataDemoDatabase,
          $MaterialCategoriesTable,
          MaterialCategoryRow
        >,
      ),
      MaterialCategoryRow,
      PrefetchHooks Function()
    >;
typedef $$MaterialsTableCreateCompanionBuilder =
    MaterialsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String name,
      required String categoryId,
      required UnitType unitType,
      required double currentStock,
      required double alertThreshold,
      required double criticalThreshold,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$MaterialsTableUpdateCompanionBuilder =
    MaterialsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<String> categoryId,
      Value<UnitType> unitType,
      Value<double> currentStock,
      Value<double> alertThreshold,
      Value<double> criticalThreshold,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$MaterialsTableFilterComposer
    extends Composer<_$YataDemoDatabase, $MaterialsTable> {
  $$MaterialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UnitType, UnitType, String> get unitType =>
      $composableBuilder(
        column: $table.unitType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get alertThreshold => $composableBuilder(
    column: $table.alertThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get criticalThreshold => $composableBuilder(
    column: $table.criticalThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MaterialsTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $MaterialsTable> {
  $$MaterialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitType => $composableBuilder(
    column: $table.unitType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get alertThreshold => $composableBuilder(
    column: $table.alertThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get criticalThreshold => $composableBuilder(
    column: $table.criticalThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MaterialsTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $MaterialsTable> {
  $$MaterialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<UnitType, String> get unitType =>
      $composableBuilder(column: $table.unitType, builder: (column) => column);

  GeneratedColumn<double> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => column,
  );

  GeneratedColumn<double> get alertThreshold => $composableBuilder(
    column: $table.alertThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<double> get criticalThreshold => $composableBuilder(
    column: $table.criticalThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$MaterialsTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $MaterialsTable,
          MaterialRow,
          $$MaterialsTableFilterComposer,
          $$MaterialsTableOrderingComposer,
          $$MaterialsTableAnnotationComposer,
          $$MaterialsTableCreateCompanionBuilder,
          $$MaterialsTableUpdateCompanionBuilder,
          (
            MaterialRow,
            BaseReferences<_$YataDemoDatabase, $MaterialsTable, MaterialRow>,
          ),
          MaterialRow,
          PrefetchHooks Function()
        > {
  $$MaterialsTableTableManager(_$YataDemoDatabase db, $MaterialsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaterialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaterialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaterialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<UnitType> unitType = const Value.absent(),
                Value<double> currentStock = const Value.absent(),
                Value<double> alertThreshold = const Value.absent(),
                Value<double> criticalThreshold = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MaterialsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                categoryId: categoryId,
                unitType: unitType,
                currentStock: currentStock,
                alertThreshold: alertThreshold,
                criticalThreshold: criticalThreshold,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                required String categoryId,
                required UnitType unitType,
                required double currentStock,
                required double alertThreshold,
                required double criticalThreshold,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MaterialsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                categoryId: categoryId,
                unitType: unitType,
                currentStock: currentStock,
                alertThreshold: alertThreshold,
                criticalThreshold: criticalThreshold,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MaterialsTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $MaterialsTable,
      MaterialRow,
      $$MaterialsTableFilterComposer,
      $$MaterialsTableOrderingComposer,
      $$MaterialsTableAnnotationComposer,
      $$MaterialsTableCreateCompanionBuilder,
      $$MaterialsTableUpdateCompanionBuilder,
      (
        MaterialRow,
        BaseReferences<_$YataDemoDatabase, $MaterialsTable, MaterialRow>,
      ),
      MaterialRow,
      PrefetchHooks Function()
    >;
typedef $$RecipesTableCreateCompanionBuilder =
    RecipesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String menuItemId,
      required String materialId,
      required double requiredAmount,
      required bool isOptional,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$RecipesTableUpdateCompanionBuilder =
    RecipesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> menuItemId,
      Value<String> materialId,
      Value<double> requiredAmount,
      Value<bool> isOptional,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$RecipesTableFilterComposer
    extends Composer<_$YataDemoDatabase, $RecipesTable> {
  $$RecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get menuItemId => $composableBuilder(
    column: $table.menuItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get requiredAmount => $composableBuilder(
    column: $table.requiredAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecipesTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $RecipesTable> {
  $$RecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get menuItemId => $composableBuilder(
    column: $table.menuItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get requiredAmount => $composableBuilder(
    column: $table.requiredAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipesTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $RecipesTable> {
  $$RecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get menuItemId => $composableBuilder(
    column: $table.menuItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get requiredAmount => $composableBuilder(
    column: $table.requiredAmount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOptional => $composableBuilder(
    column: $table.isOptional,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$RecipesTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $RecipesTable,
          RecipeRow,
          $$RecipesTableFilterComposer,
          $$RecipesTableOrderingComposer,
          $$RecipesTableAnnotationComposer,
          $$RecipesTableCreateCompanionBuilder,
          $$RecipesTableUpdateCompanionBuilder,
          (
            RecipeRow,
            BaseReferences<_$YataDemoDatabase, $RecipesTable, RecipeRow>,
          ),
          RecipeRow,
          PrefetchHooks Function()
        > {
  $$RecipesTableTableManager(_$YataDemoDatabase db, $RecipesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> menuItemId = const Value.absent(),
                Value<String> materialId = const Value.absent(),
                Value<double> requiredAmount = const Value.absent(),
                Value<bool> isOptional = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                menuItemId: menuItemId,
                materialId: materialId,
                requiredAmount: requiredAmount,
                isOptional: isOptional,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String menuItemId,
                required String materialId,
                required double requiredAmount,
                required bool isOptional,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                menuItemId: menuItemId,
                materialId: materialId,
                requiredAmount: requiredAmount,
                isOptional: isOptional,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecipesTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $RecipesTable,
      RecipeRow,
      $$RecipesTableFilterComposer,
      $$RecipesTableOrderingComposer,
      $$RecipesTableAnnotationComposer,
      $$RecipesTableCreateCompanionBuilder,
      $$RecipesTableUpdateCompanionBuilder,
      (RecipeRow, BaseReferences<_$YataDemoDatabase, $RecipesTable, RecipeRow>),
      RecipeRow,
      PrefetchHooks Function()
    >;
typedef $$SuppliersTableCreateCompanionBuilder =
    SuppliersCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String name,
      required String contactInfo,
      Value<String?> notes,
      Value<bool> isActive,
      Value<int> rowid,
    });
typedef $$SuppliersTableUpdateCompanionBuilder =
    SuppliersCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<String> contactInfo,
      Value<String?> notes,
      Value<bool> isActive,
      Value<int> rowid,
    });

class $$SuppliersTableFilterComposer
    extends Composer<_$YataDemoDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$SuppliersTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $SuppliersTable,
          SupplierRow,
          $$SuppliersTableFilterComposer,
          $$SuppliersTableOrderingComposer,
          $$SuppliersTableAnnotationComposer,
          $$SuppliersTableCreateCompanionBuilder,
          $$SuppliersTableUpdateCompanionBuilder,
          (
            SupplierRow,
            BaseReferences<_$YataDemoDatabase, $SuppliersTable, SupplierRow>,
          ),
          SupplierRow,
          PrefetchHooks Function()
        > {
  $$SuppliersTableTableManager(_$YataDemoDatabase db, $SuppliersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> contactInfo = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SuppliersCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                contactInfo: contactInfo,
                notes: notes,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                required String contactInfo,
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SuppliersCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                contactInfo: contactInfo,
                notes: notes,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SuppliersTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $SuppliersTable,
      SupplierRow,
      $$SuppliersTableFilterComposer,
      $$SuppliersTableOrderingComposer,
      $$SuppliersTableAnnotationComposer,
      $$SuppliersTableCreateCompanionBuilder,
      $$SuppliersTableUpdateCompanionBuilder,
      (
        SupplierRow,
        BaseReferences<_$YataDemoDatabase, $SuppliersTable, SupplierRow>,
      ),
      SupplierRow,
      PrefetchHooks Function()
    >;
typedef $$StockTransactionsTableCreateCompanionBuilder =
    StockTransactionsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String materialId,
      required TransactionType transactionType,
      required double changeAmount,
      Value<ReferenceType?> referenceType,
      Value<String?> referenceId,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$StockTransactionsTableUpdateCompanionBuilder =
    StockTransactionsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> materialId,
      Value<TransactionType> transactionType,
      Value<double> changeAmount,
      Value<ReferenceType?> referenceType,
      Value<String?> referenceId,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$StockTransactionsTableFilterComposer
    extends Composer<_$YataDemoDatabase, $StockTransactionsTable> {
  $$StockTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TransactionType, TransactionType, String>
  get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get changeAmount => $composableBuilder(
    column: $table.changeAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ReferenceType?, ReferenceType, String>
  get referenceType => $composableBuilder(
    column: $table.referenceType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StockTransactionsTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $StockTransactionsTable> {
  $$StockTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get changeAmount => $composableBuilder(
    column: $table.changeAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceType => $composableBuilder(
    column: $table.referenceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StockTransactionsTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $StockTransactionsTable> {
  $$StockTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TransactionType, String>
  get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get changeAmount => $composableBuilder(
    column: $table.changeAmount,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ReferenceType?, String> get referenceType =>
      $composableBuilder(
        column: $table.referenceType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$StockTransactionsTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $StockTransactionsTable,
          StockTransactionRow,
          $$StockTransactionsTableFilterComposer,
          $$StockTransactionsTableOrderingComposer,
          $$StockTransactionsTableAnnotationComposer,
          $$StockTransactionsTableCreateCompanionBuilder,
          $$StockTransactionsTableUpdateCompanionBuilder,
          (
            StockTransactionRow,
            BaseReferences<
              _$YataDemoDatabase,
              $StockTransactionsTable,
              StockTransactionRow
            >,
          ),
          StockTransactionRow,
          PrefetchHooks Function()
        > {
  $$StockTransactionsTableTableManager(
    _$YataDemoDatabase db,
    $StockTransactionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockTransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockTransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockTransactionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> materialId = const Value.absent(),
                Value<TransactionType> transactionType = const Value.absent(),
                Value<double> changeAmount = const Value.absent(),
                Value<ReferenceType?> referenceType = const Value.absent(),
                Value<String?> referenceId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StockTransactionsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                materialId: materialId,
                transactionType: transactionType,
                changeAmount: changeAmount,
                referenceType: referenceType,
                referenceId: referenceId,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String materialId,
                required TransactionType transactionType,
                required double changeAmount,
                Value<ReferenceType?> referenceType = const Value.absent(),
                Value<String?> referenceId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StockTransactionsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                materialId: materialId,
                transactionType: transactionType,
                changeAmount: changeAmount,
                referenceType: referenceType,
                referenceId: referenceId,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StockTransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $StockTransactionsTable,
      StockTransactionRow,
      $$StockTransactionsTableFilterComposer,
      $$StockTransactionsTableOrderingComposer,
      $$StockTransactionsTableAnnotationComposer,
      $$StockTransactionsTableCreateCompanionBuilder,
      $$StockTransactionsTableUpdateCompanionBuilder,
      (
        StockTransactionRow,
        BaseReferences<
          _$YataDemoDatabase,
          $StockTransactionsTable,
          StockTransactionRow
        >,
      ),
      StockTransactionRow,
      PrefetchHooks Function()
    >;
typedef $$PurchasesTableCreateCompanionBuilder =
    PurchasesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required DateTime purchaseDate,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$PurchasesTableUpdateCompanionBuilder =
    PurchasesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<DateTime> purchaseDate,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$PurchasesTableFilterComposer
    extends Composer<_$YataDemoDatabase, $PurchasesTable> {
  $$PurchasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PurchasesTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $PurchasesTable> {
  $$PurchasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PurchasesTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $PurchasesTable> {
  $$PurchasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PurchasesTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $PurchasesTable,
          PurchaseRow,
          $$PurchasesTableFilterComposer,
          $$PurchasesTableOrderingComposer,
          $$PurchasesTableAnnotationComposer,
          $$PurchasesTableCreateCompanionBuilder,
          $$PurchasesTableUpdateCompanionBuilder,
          (
            PurchaseRow,
            BaseReferences<_$YataDemoDatabase, $PurchasesTable, PurchaseRow>,
          ),
          PurchaseRow,
          PrefetchHooks Function()
        > {
  $$PurchasesTableTableManager(_$YataDemoDatabase db, $PurchasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime> purchaseDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchasesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                purchaseDate: purchaseDate,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required DateTime purchaseDate,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchasesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                purchaseDate: purchaseDate,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PurchasesTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $PurchasesTable,
      PurchaseRow,
      $$PurchasesTableFilterComposer,
      $$PurchasesTableOrderingComposer,
      $$PurchasesTableAnnotationComposer,
      $$PurchasesTableCreateCompanionBuilder,
      $$PurchasesTableUpdateCompanionBuilder,
      (
        PurchaseRow,
        BaseReferences<_$YataDemoDatabase, $PurchasesTable, PurchaseRow>,
      ),
      PurchaseRow,
      PrefetchHooks Function()
    >;
typedef $$PurchaseItemsTableCreateCompanionBuilder =
    PurchaseItemsCompanion Function({
      Value<String> id,
      Value<String> userId,
      required String purchaseId,
      required String materialId,
      required double quantity,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$PurchaseItemsTableUpdateCompanionBuilder =
    PurchaseItemsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> purchaseId,
      Value<String> materialId,
      Value<double> quantity,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

class $$PurchaseItemsTableFilterComposer
    extends Composer<_$YataDemoDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PurchaseItemsTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PurchaseItemsTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $PurchaseItemsTable> {
  $$PurchaseItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get purchaseId => $composableBuilder(
    column: $table.purchaseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PurchaseItemsTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $PurchaseItemsTable,
          PurchaseItemRow,
          $$PurchaseItemsTableFilterComposer,
          $$PurchaseItemsTableOrderingComposer,
          $$PurchaseItemsTableAnnotationComposer,
          $$PurchaseItemsTableCreateCompanionBuilder,
          $$PurchaseItemsTableUpdateCompanionBuilder,
          (
            PurchaseItemRow,
            BaseReferences<
              _$YataDemoDatabase,
              $PurchaseItemsTable,
              PurchaseItemRow
            >,
          ),
          PurchaseItemRow,
          PrefetchHooks Function()
        > {
  $$PurchaseItemsTableTableManager(
    _$YataDemoDatabase db,
    $PurchaseItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> purchaseId = const Value.absent(),
                Value<String> materialId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseItemsCompanion(
                id: id,
                userId: userId,
                purchaseId: purchaseId,
                materialId: materialId,
                quantity: quantity,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                required String purchaseId,
                required String materialId,
                required double quantity,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PurchaseItemsCompanion.insert(
                id: id,
                userId: userId,
                purchaseId: purchaseId,
                materialId: materialId,
                quantity: quantity,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PurchaseItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $PurchaseItemsTable,
      PurchaseItemRow,
      $$PurchaseItemsTableFilterComposer,
      $$PurchaseItemsTableOrderingComposer,
      $$PurchaseItemsTableAnnotationComposer,
      $$PurchaseItemsTableCreateCompanionBuilder,
      $$PurchaseItemsTableUpdateCompanionBuilder,
      (
        PurchaseItemRow,
        BaseReferences<
          _$YataDemoDatabase,
          $PurchaseItemsTable,
          PurchaseItemRow
        >,
      ),
      PurchaseItemRow,
      PrefetchHooks Function()
    >;
typedef $$StockAdjustmentsTableCreateCompanionBuilder =
    StockAdjustmentsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String materialId,
      required double adjustmentAmount,
      required DateTime adjustedAt,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$StockAdjustmentsTableUpdateCompanionBuilder =
    StockAdjustmentsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> materialId,
      Value<double> adjustmentAmount,
      Value<DateTime> adjustedAt,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$StockAdjustmentsTableFilterComposer
    extends Composer<_$YataDemoDatabase, $StockAdjustmentsTable> {
  $$StockAdjustmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get adjustmentAmount => $composableBuilder(
    column: $table.adjustmentAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get adjustedAt => $composableBuilder(
    column: $table.adjustedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StockAdjustmentsTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $StockAdjustmentsTable> {
  $$StockAdjustmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get adjustmentAmount => $composableBuilder(
    column: $table.adjustmentAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get adjustedAt => $composableBuilder(
    column: $table.adjustedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StockAdjustmentsTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $StockAdjustmentsTable> {
  $$StockAdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get materialId => $composableBuilder(
    column: $table.materialId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get adjustmentAmount => $composableBuilder(
    column: $table.adjustmentAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get adjustedAt => $composableBuilder(
    column: $table.adjustedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$StockAdjustmentsTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $StockAdjustmentsTable,
          StockAdjustmentRow,
          $$StockAdjustmentsTableFilterComposer,
          $$StockAdjustmentsTableOrderingComposer,
          $$StockAdjustmentsTableAnnotationComposer,
          $$StockAdjustmentsTableCreateCompanionBuilder,
          $$StockAdjustmentsTableUpdateCompanionBuilder,
          (
            StockAdjustmentRow,
            BaseReferences<
              _$YataDemoDatabase,
              $StockAdjustmentsTable,
              StockAdjustmentRow
            >,
          ),
          StockAdjustmentRow,
          PrefetchHooks Function()
        > {
  $$StockAdjustmentsTableTableManager(
    _$YataDemoDatabase db,
    $StockAdjustmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StockAdjustmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StockAdjustmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StockAdjustmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> materialId = const Value.absent(),
                Value<double> adjustmentAmount = const Value.absent(),
                Value<DateTime> adjustedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StockAdjustmentsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                materialId: materialId,
                adjustmentAmount: adjustmentAmount,
                adjustedAt: adjustedAt,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String materialId,
                required double adjustmentAmount,
                required DateTime adjustedAt,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StockAdjustmentsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                materialId: materialId,
                adjustmentAmount: adjustmentAmount,
                adjustedAt: adjustedAt,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StockAdjustmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $StockAdjustmentsTable,
      StockAdjustmentRow,
      $$StockAdjustmentsTableFilterComposer,
      $$StockAdjustmentsTableOrderingComposer,
      $$StockAdjustmentsTableAnnotationComposer,
      $$StockAdjustmentsTableCreateCompanionBuilder,
      $$StockAdjustmentsTableUpdateCompanionBuilder,
      (
        StockAdjustmentRow,
        BaseReferences<
          _$YataDemoDatabase,
          $StockAdjustmentsTable,
          StockAdjustmentRow
        >,
      ),
      StockAdjustmentRow,
      PrefetchHooks Function()
    >;
typedef $$MenuCategoriesTableCreateCompanionBuilder =
    MenuCategoriesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String name,
      required int displayOrder,
      Value<String?> code,
      Value<int> rowid,
    });
typedef $$MenuCategoriesTableUpdateCompanionBuilder =
    MenuCategoriesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<int> displayOrder,
      Value<String?> code,
      Value<int> rowid,
    });

class $$MenuCategoriesTableFilterComposer
    extends Composer<_$YataDemoDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MenuCategoriesTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MenuCategoriesTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $MenuCategoriesTable> {
  $$MenuCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);
}

class $$MenuCategoriesTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $MenuCategoriesTable,
          MenuCategoryRow,
          $$MenuCategoriesTableFilterComposer,
          $$MenuCategoriesTableOrderingComposer,
          $$MenuCategoriesTableAnnotationComposer,
          $$MenuCategoriesTableCreateCompanionBuilder,
          $$MenuCategoriesTableUpdateCompanionBuilder,
          (
            MenuCategoryRow,
            BaseReferences<
              _$YataDemoDatabase,
              $MenuCategoriesTable,
              MenuCategoryRow
            >,
          ),
          MenuCategoryRow,
          PrefetchHooks Function()
        > {
  $$MenuCategoriesTableTableManager(
    _$YataDemoDatabase db,
    $MenuCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MenuCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MenuCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MenuCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MenuCategoriesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                displayOrder: displayOrder,
                code: code,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                required int displayOrder,
                Value<String?> code = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MenuCategoriesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                displayOrder: displayOrder,
                code: code,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MenuCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $MenuCategoriesTable,
      MenuCategoryRow,
      $$MenuCategoriesTableFilterComposer,
      $$MenuCategoriesTableOrderingComposer,
      $$MenuCategoriesTableAnnotationComposer,
      $$MenuCategoriesTableCreateCompanionBuilder,
      $$MenuCategoriesTableUpdateCompanionBuilder,
      (
        MenuCategoryRow,
        BaseReferences<
          _$YataDemoDatabase,
          $MenuCategoriesTable,
          MenuCategoryRow
        >,
      ),
      MenuCategoryRow,
      PrefetchHooks Function()
    >;
typedef $$MenuItemsTableCreateCompanionBuilder =
    MenuItemsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required String name,
      required String categoryId,
      required int price,
      Value<String?> description,
      Value<bool> isAvailable,
      required int displayOrder,
      Value<String?> imageUrl,
      Value<int> rowid,
    });
typedef $$MenuItemsTableUpdateCompanionBuilder =
    MenuItemsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<String> name,
      Value<String> categoryId,
      Value<int> price,
      Value<String?> description,
      Value<bool> isAvailable,
      Value<int> displayOrder,
      Value<String?> imageUrl,
      Value<int> rowid,
    });

class $$MenuItemsTableFilterComposer
    extends Composer<_$YataDemoDatabase, $MenuItemsTable> {
  $$MenuItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MenuItemsTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $MenuItemsTable> {
  $$MenuItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MenuItemsTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $MenuItemsTable> {
  $$MenuItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => column,
  );

  GeneratedColumn<int> get displayOrder => $composableBuilder(
    column: $table.displayOrder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$MenuItemsTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $MenuItemsTable,
          MenuItemRow,
          $$MenuItemsTableFilterComposer,
          $$MenuItemsTableOrderingComposer,
          $$MenuItemsTableAnnotationComposer,
          $$MenuItemsTableCreateCompanionBuilder,
          $$MenuItemsTableUpdateCompanionBuilder,
          (
            MenuItemRow,
            BaseReferences<_$YataDemoDatabase, $MenuItemsTable, MenuItemRow>,
          ),
          MenuItemRow,
          PrefetchHooks Function()
        > {
  $$MenuItemsTableTableManager(_$YataDemoDatabase db, $MenuItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MenuItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MenuItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MenuItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
                Value<int> displayOrder = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MenuItemsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                categoryId: categoryId,
                price: price,
                description: description,
                isAvailable: isAvailable,
                displayOrder: displayOrder,
                imageUrl: imageUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required String name,
                required String categoryId,
                required int price,
                Value<String?> description = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
                required int displayOrder,
                Value<String?> imageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MenuItemsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                name: name,
                categoryId: categoryId,
                price: price,
                description: description,
                isAvailable: isAvailable,
                displayOrder: displayOrder,
                imageUrl: imageUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MenuItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $MenuItemsTable,
      MenuItemRow,
      $$MenuItemsTableFilterComposer,
      $$MenuItemsTableOrderingComposer,
      $$MenuItemsTableAnnotationComposer,
      $$MenuItemsTableCreateCompanionBuilder,
      $$MenuItemsTableUpdateCompanionBuilder,
      (
        MenuItemRow,
        BaseReferences<_$YataDemoDatabase, $MenuItemsTable, MenuItemRow>,
      ),
      MenuItemRow,
      PrefetchHooks Function()
    >;
typedef $$OrdersTableCreateCompanionBuilder =
    OrdersCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required int totalAmount,
      Value<String?> orderNumber,
      Value<bool> isCart,
      Value<OrderStatus> status,
      required PaymentMethod paymentMethod,
      Value<int> discountAmount,
      Value<String?> customerName,
      Value<String?> notes,
      required DateTime orderedAt,
      Value<DateTime?> startedPreparingAt,
      Value<DateTime?> readyAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$OrdersTableUpdateCompanionBuilder =
    OrdersCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> totalAmount,
      Value<String?> orderNumber,
      Value<bool> isCart,
      Value<OrderStatus> status,
      Value<PaymentMethod> paymentMethod,
      Value<int> discountAmount,
      Value<String?> customerName,
      Value<String?> notes,
      Value<DateTime> orderedAt,
      Value<DateTime?> startedPreparingAt,
      Value<DateTime?> readyAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

class $$OrdersTableFilterComposer
    extends Composer<_$YataDemoDatabase, $OrdersTable> {
  $$OrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderNumber => $composableBuilder(
    column: $table.orderNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCart => $composableBuilder(
    column: $table.isCart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<OrderStatus, OrderStatus, String> get status =>
      $composableBuilder(
        column: $table.status,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<PaymentMethod, PaymentMethod, String>
  get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderedAt => $composableBuilder(
    column: $table.orderedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedPreparingAt => $composableBuilder(
    column: $table.startedPreparingAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get readyAt => $composableBuilder(
    column: $table.readyAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrdersTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $OrdersTable> {
  $$OrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderNumber => $composableBuilder(
    column: $table.orderNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCart => $composableBuilder(
    column: $table.isCart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderedAt => $composableBuilder(
    column: $table.orderedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedPreparingAt => $composableBuilder(
    column: $table.startedPreparingAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get readyAt => $composableBuilder(
    column: $table.readyAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrdersTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $OrdersTable> {
  $$OrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderNumber => $composableBuilder(
    column: $table.orderNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCart =>
      $composableBuilder(column: $table.isCart, builder: (column) => column);

  GeneratedColumnWithTypeConverter<OrderStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PaymentMethod, String> get paymentMethod =>
      $composableBuilder(
        column: $table.paymentMethod,
        builder: (column) => column,
      );

  GeneratedColumn<int> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get orderedAt =>
      $composableBuilder(column: $table.orderedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startedPreparingAt => $composableBuilder(
    column: $table.startedPreparingAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get readyAt =>
      $composableBuilder(column: $table.readyAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$OrdersTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $OrdersTable,
          OrderRow,
          $$OrdersTableFilterComposer,
          $$OrdersTableOrderingComposer,
          $$OrdersTableAnnotationComposer,
          $$OrdersTableCreateCompanionBuilder,
          $$OrdersTableUpdateCompanionBuilder,
          (
            OrderRow,
            BaseReferences<_$YataDemoDatabase, $OrdersTable, OrderRow>,
          ),
          OrderRow,
          PrefetchHooks Function()
        > {
  $$OrdersTableTableManager(_$YataDemoDatabase db, $OrdersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> totalAmount = const Value.absent(),
                Value<String?> orderNumber = const Value.absent(),
                Value<bool> isCart = const Value.absent(),
                Value<OrderStatus> status = const Value.absent(),
                Value<PaymentMethod> paymentMethod = const Value.absent(),
                Value<int> discountAmount = const Value.absent(),
                Value<String?> customerName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> orderedAt = const Value.absent(),
                Value<DateTime?> startedPreparingAt = const Value.absent(),
                Value<DateTime?> readyAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrdersCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                totalAmount: totalAmount,
                orderNumber: orderNumber,
                isCart: isCart,
                status: status,
                paymentMethod: paymentMethod,
                discountAmount: discountAmount,
                customerName: customerName,
                notes: notes,
                orderedAt: orderedAt,
                startedPreparingAt: startedPreparingAt,
                readyAt: readyAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required int totalAmount,
                Value<String?> orderNumber = const Value.absent(),
                Value<bool> isCart = const Value.absent(),
                Value<OrderStatus> status = const Value.absent(),
                required PaymentMethod paymentMethod,
                Value<int> discountAmount = const Value.absent(),
                Value<String?> customerName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime orderedAt,
                Value<DateTime?> startedPreparingAt = const Value.absent(),
                Value<DateTime?> readyAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrdersCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                totalAmount: totalAmount,
                orderNumber: orderNumber,
                isCart: isCart,
                status: status,
                paymentMethod: paymentMethod,
                discountAmount: discountAmount,
                customerName: customerName,
                notes: notes,
                orderedAt: orderedAt,
                startedPreparingAt: startedPreparingAt,
                readyAt: readyAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrdersTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $OrdersTable,
      OrderRow,
      $$OrdersTableFilterComposer,
      $$OrdersTableOrderingComposer,
      $$OrdersTableAnnotationComposer,
      $$OrdersTableCreateCompanionBuilder,
      $$OrdersTableUpdateCompanionBuilder,
      (OrderRow, BaseReferences<_$YataDemoDatabase, $OrdersTable, OrderRow>),
      OrderRow,
      PrefetchHooks Function()
    >;
typedef $$OrderItemsTableCreateCompanionBuilder =
    OrderItemsCompanion Function({
      Value<String> id,
      Value<String> userId,
      required String orderId,
      required String menuItemId,
      required int quantity,
      required int unitPrice,
      required int subtotal,
      Value<Map<String, String>?> selectedOptions,
      Value<String?> specialRequest,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });
typedef $$OrderItemsTableUpdateCompanionBuilder =
    OrderItemsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> orderId,
      Value<String> menuItemId,
      Value<int> quantity,
      Value<int> unitPrice,
      Value<int> subtotal,
      Value<Map<String, String>?> selectedOptions,
      Value<String?> specialRequest,
      Value<DateTime?> createdAt,
      Value<int> rowid,
    });

class $$OrderItemsTableFilterComposer
    extends Composer<_$YataDemoDatabase, $OrderItemsTable> {
  $$OrderItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderId => $composableBuilder(
    column: $table.orderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get menuItemId => $composableBuilder(
    column: $table.menuItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>?,
    Map<String, String>,
    String
  >
  get selectedOptions => $composableBuilder(
    column: $table.selectedOptions,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get specialRequest => $composableBuilder(
    column: $table.specialRequest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderItemsTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $OrderItemsTable> {
  $$OrderItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderId => $composableBuilder(
    column: $table.orderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get menuItemId => $composableBuilder(
    column: $table.menuItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedOptions => $composableBuilder(
    column: $table.selectedOptions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialRequest => $composableBuilder(
    column: $table.specialRequest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderItemsTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $OrderItemsTable> {
  $$OrderItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<String> get menuItemId => $composableBuilder(
    column: $table.menuItemId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<int> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>?, String>
  get selectedOptions => $composableBuilder(
    column: $table.selectedOptions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specialRequest => $composableBuilder(
    column: $table.specialRequest,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OrderItemsTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $OrderItemsTable,
          OrderItemRow,
          $$OrderItemsTableFilterComposer,
          $$OrderItemsTableOrderingComposer,
          $$OrderItemsTableAnnotationComposer,
          $$OrderItemsTableCreateCompanionBuilder,
          $$OrderItemsTableUpdateCompanionBuilder,
          (
            OrderItemRow,
            BaseReferences<_$YataDemoDatabase, $OrderItemsTable, OrderItemRow>,
          ),
          OrderItemRow,
          PrefetchHooks Function()
        > {
  $$OrderItemsTableTableManager(_$YataDemoDatabase db, $OrderItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> orderId = const Value.absent(),
                Value<String> menuItemId = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<int> subtotal = const Value.absent(),
                Value<Map<String, String>?> selectedOptions =
                    const Value.absent(),
                Value<String?> specialRequest = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrderItemsCompanion(
                id: id,
                userId: userId,
                orderId: orderId,
                menuItemId: menuItemId,
                quantity: quantity,
                unitPrice: unitPrice,
                subtotal: subtotal,
                selectedOptions: selectedOptions,
                specialRequest: specialRequest,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                required String orderId,
                required String menuItemId,
                required int quantity,
                required int unitPrice,
                required int subtotal,
                Value<Map<String, String>?> selectedOptions =
                    const Value.absent(),
                Value<String?> specialRequest = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrderItemsCompanion.insert(
                id: id,
                userId: userId,
                orderId: orderId,
                menuItemId: menuItemId,
                quantity: quantity,
                unitPrice: unitPrice,
                subtotal: subtotal,
                selectedOptions: selectedOptions,
                specialRequest: specialRequest,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $OrderItemsTable,
      OrderItemRow,
      $$OrderItemsTableFilterComposer,
      $$OrderItemsTableOrderingComposer,
      $$OrderItemsTableAnnotationComposer,
      $$OrderItemsTableCreateCompanionBuilder,
      $$OrderItemsTableUpdateCompanionBuilder,
      (
        OrderItemRow,
        BaseReferences<_$YataDemoDatabase, $OrderItemsTable, OrderItemRow>,
      ),
      OrderItemRow,
      PrefetchHooks Function()
    >;
typedef $$DailySummariesTableCreateCompanionBuilder =
    DailySummariesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      required DateTime summaryDate,
      required int totalOrders,
      required int completedOrders,
      required int pendingOrders,
      required int totalRevenue,
      Value<int?> averagePrepTimeMinutes,
      Value<String?> mostPopularItemId,
      required int mostPopularItemCount,
      Value<int> rowid,
    });
typedef $$DailySummariesTableUpdateCompanionBuilder =
    DailySummariesCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<DateTime> summaryDate,
      Value<int> totalOrders,
      Value<int> completedOrders,
      Value<int> pendingOrders,
      Value<int> totalRevenue,
      Value<int?> averagePrepTimeMinutes,
      Value<String?> mostPopularItemId,
      Value<int> mostPopularItemCount,
      Value<int> rowid,
    });

class $$DailySummariesTableFilterComposer
    extends Composer<_$YataDemoDatabase, $DailySummariesTable> {
  $$DailySummariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get summaryDate => $composableBuilder(
    column: $table.summaryDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalOrders => $composableBuilder(
    column: $table.totalOrders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedOrders => $composableBuilder(
    column: $table.completedOrders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pendingOrders => $composableBuilder(
    column: $table.pendingOrders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalRevenue => $composableBuilder(
    column: $table.totalRevenue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get averagePrepTimeMinutes => $composableBuilder(
    column: $table.averagePrepTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mostPopularItemId => $composableBuilder(
    column: $table.mostPopularItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mostPopularItemCount => $composableBuilder(
    column: $table.mostPopularItemCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailySummariesTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $DailySummariesTable> {
  $$DailySummariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get summaryDate => $composableBuilder(
    column: $table.summaryDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalOrders => $composableBuilder(
    column: $table.totalOrders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedOrders => $composableBuilder(
    column: $table.completedOrders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pendingOrders => $composableBuilder(
    column: $table.pendingOrders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalRevenue => $composableBuilder(
    column: $table.totalRevenue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get averagePrepTimeMinutes => $composableBuilder(
    column: $table.averagePrepTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mostPopularItemId => $composableBuilder(
    column: $table.mostPopularItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mostPopularItemCount => $composableBuilder(
    column: $table.mostPopularItemCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailySummariesTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $DailySummariesTable> {
  $$DailySummariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get summaryDate => $composableBuilder(
    column: $table.summaryDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalOrders => $composableBuilder(
    column: $table.totalOrders,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedOrders => $composableBuilder(
    column: $table.completedOrders,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pendingOrders => $composableBuilder(
    column: $table.pendingOrders,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalRevenue => $composableBuilder(
    column: $table.totalRevenue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get averagePrepTimeMinutes => $composableBuilder(
    column: $table.averagePrepTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mostPopularItemId => $composableBuilder(
    column: $table.mostPopularItemId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mostPopularItemCount => $composableBuilder(
    column: $table.mostPopularItemCount,
    builder: (column) => column,
  );
}

class $$DailySummariesTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $DailySummariesTable,
          DailySummaryRow,
          $$DailySummariesTableFilterComposer,
          $$DailySummariesTableOrderingComposer,
          $$DailySummariesTableAnnotationComposer,
          $$DailySummariesTableCreateCompanionBuilder,
          $$DailySummariesTableUpdateCompanionBuilder,
          (
            DailySummaryRow,
            BaseReferences<
              _$YataDemoDatabase,
              $DailySummariesTable,
              DailySummaryRow
            >,
          ),
          DailySummaryRow,
          PrefetchHooks Function()
        > {
  $$DailySummariesTableTableManager(
    _$YataDemoDatabase db,
    $DailySummariesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailySummariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailySummariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailySummariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime> summaryDate = const Value.absent(),
                Value<int> totalOrders = const Value.absent(),
                Value<int> completedOrders = const Value.absent(),
                Value<int> pendingOrders = const Value.absent(),
                Value<int> totalRevenue = const Value.absent(),
                Value<int?> averagePrepTimeMinutes = const Value.absent(),
                Value<String?> mostPopularItemId = const Value.absent(),
                Value<int> mostPopularItemCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailySummariesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                summaryDate: summaryDate,
                totalOrders: totalOrders,
                completedOrders: completedOrders,
                pendingOrders: pendingOrders,
                totalRevenue: totalRevenue,
                averagePrepTimeMinutes: averagePrepTimeMinutes,
                mostPopularItemId: mostPopularItemId,
                mostPopularItemCount: mostPopularItemCount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                required DateTime summaryDate,
                required int totalOrders,
                required int completedOrders,
                required int pendingOrders,
                required int totalRevenue,
                Value<int?> averagePrepTimeMinutes = const Value.absent(),
                Value<String?> mostPopularItemId = const Value.absent(),
                required int mostPopularItemCount,
                Value<int> rowid = const Value.absent(),
              }) => DailySummariesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                summaryDate: summaryDate,
                totalOrders: totalOrders,
                completedOrders: completedOrders,
                pendingOrders: pendingOrders,
                totalRevenue: totalRevenue,
                averagePrepTimeMinutes: averagePrepTimeMinutes,
                mostPopularItemId: mostPopularItemId,
                mostPopularItemCount: mostPopularItemCount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailySummariesTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $DailySummariesTable,
      DailySummaryRow,
      $$DailySummariesTableFilterComposer,
      $$DailySummariesTableOrderingComposer,
      $$DailySummariesTableAnnotationComposer,
      $$DailySummariesTableCreateCompanionBuilder,
      $$DailySummariesTableUpdateCompanionBuilder,
      (
        DailySummaryRow,
        BaseReferences<
          _$YataDemoDatabase,
          $DailySummariesTable,
          DailySummaryRow
        >,
      ),
      DailySummaryRow,
      PrefetchHooks Function()
    >;
typedef $$DemoSeedMarkersTableCreateCompanionBuilder =
    DemoSeedMarkersCompanion Function({
      required String seedKey,
      required int seedVersion,
      required DateTime appliedAt,
      Value<int> rowid,
    });
typedef $$DemoSeedMarkersTableUpdateCompanionBuilder =
    DemoSeedMarkersCompanion Function({
      Value<String> seedKey,
      Value<int> seedVersion,
      Value<DateTime> appliedAt,
      Value<int> rowid,
    });

class $$DemoSeedMarkersTableFilterComposer
    extends Composer<_$YataDemoDatabase, $DemoSeedMarkersTable> {
  $$DemoSeedMarkersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get seedKey => $composableBuilder(
    column: $table.seedKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get appliedAt => $composableBuilder(
    column: $table.appliedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DemoSeedMarkersTableOrderingComposer
    extends Composer<_$YataDemoDatabase, $DemoSeedMarkersTable> {
  $$DemoSeedMarkersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get seedKey => $composableBuilder(
    column: $table.seedKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get appliedAt => $composableBuilder(
    column: $table.appliedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DemoSeedMarkersTableAnnotationComposer
    extends Composer<_$YataDemoDatabase, $DemoSeedMarkersTable> {
  $$DemoSeedMarkersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get seedKey =>
      $composableBuilder(column: $table.seedKey, builder: (column) => column);

  GeneratedColumn<int> get seedVersion => $composableBuilder(
    column: $table.seedVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get appliedAt =>
      $composableBuilder(column: $table.appliedAt, builder: (column) => column);
}

class $$DemoSeedMarkersTableTableManager
    extends
        RootTableManager<
          _$YataDemoDatabase,
          $DemoSeedMarkersTable,
          DemoSeedMarkerRow,
          $$DemoSeedMarkersTableFilterComposer,
          $$DemoSeedMarkersTableOrderingComposer,
          $$DemoSeedMarkersTableAnnotationComposer,
          $$DemoSeedMarkersTableCreateCompanionBuilder,
          $$DemoSeedMarkersTableUpdateCompanionBuilder,
          (
            DemoSeedMarkerRow,
            BaseReferences<
              _$YataDemoDatabase,
              $DemoSeedMarkersTable,
              DemoSeedMarkerRow
            >,
          ),
          DemoSeedMarkerRow,
          PrefetchHooks Function()
        > {
  $$DemoSeedMarkersTableTableManager(
    _$YataDemoDatabase db,
    $DemoSeedMarkersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DemoSeedMarkersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DemoSeedMarkersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DemoSeedMarkersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> seedKey = const Value.absent(),
                Value<int> seedVersion = const Value.absent(),
                Value<DateTime> appliedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DemoSeedMarkersCompanion(
                seedKey: seedKey,
                seedVersion: seedVersion,
                appliedAt: appliedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String seedKey,
                required int seedVersion,
                required DateTime appliedAt,
                Value<int> rowid = const Value.absent(),
              }) => DemoSeedMarkersCompanion.insert(
                seedKey: seedKey,
                seedVersion: seedVersion,
                appliedAt: appliedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DemoSeedMarkersTableProcessedTableManager =
    ProcessedTableManager<
      _$YataDemoDatabase,
      $DemoSeedMarkersTable,
      DemoSeedMarkerRow,
      $$DemoSeedMarkersTableFilterComposer,
      $$DemoSeedMarkersTableOrderingComposer,
      $$DemoSeedMarkersTableAnnotationComposer,
      $$DemoSeedMarkersTableCreateCompanionBuilder,
      $$DemoSeedMarkersTableUpdateCompanionBuilder,
      (
        DemoSeedMarkerRow,
        BaseReferences<
          _$YataDemoDatabase,
          $DemoSeedMarkersTable,
          DemoSeedMarkerRow
        >,
      ),
      DemoSeedMarkerRow,
      PrefetchHooks Function()
    >;

class $YataDemoDatabaseManager {
  final _$YataDemoDatabase _db;
  $YataDemoDatabaseManager(this._db);
  $$MaterialCategoriesTableTableManager get materialCategories =>
      $$MaterialCategoriesTableTableManager(_db, _db.materialCategories);
  $$MaterialsTableTableManager get materials =>
      $$MaterialsTableTableManager(_db, _db.materials);
  $$RecipesTableTableManager get recipes =>
      $$RecipesTableTableManager(_db, _db.recipes);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$StockTransactionsTableTableManager get stockTransactions =>
      $$StockTransactionsTableTableManager(_db, _db.stockTransactions);
  $$PurchasesTableTableManager get purchases =>
      $$PurchasesTableTableManager(_db, _db.purchases);
  $$PurchaseItemsTableTableManager get purchaseItems =>
      $$PurchaseItemsTableTableManager(_db, _db.purchaseItems);
  $$StockAdjustmentsTableTableManager get stockAdjustments =>
      $$StockAdjustmentsTableTableManager(_db, _db.stockAdjustments);
  $$MenuCategoriesTableTableManager get menuCategories =>
      $$MenuCategoriesTableTableManager(_db, _db.menuCategories);
  $$MenuItemsTableTableManager get menuItems =>
      $$MenuItemsTableTableManager(_db, _db.menuItems);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
  $$OrderItemsTableTableManager get orderItems =>
      $$OrderItemsTableTableManager(_db, _db.orderItems);
  $$DailySummariesTableTableManager get dailySummaries =>
      $$DailySummariesTableTableManager(_db, _db.dailySummaries);
  $$DemoSeedMarkersTableTableManager get demoSeedMarkers =>
      $$DemoSeedMarkersTableTableManager(_db, _db.demoSeedMarkers);
}
