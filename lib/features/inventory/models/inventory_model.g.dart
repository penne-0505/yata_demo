// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Material _$MaterialFromJson(Map<String, dynamic> json) => Material(
  name: json['name'] as String,
  categoryId: json['category_id'] as String,
  unitType: $enumDecode(_$UnitTypeEnumMap, json['unit_type']),
  currentStock: (json['current_stock'] as num).toDouble(),
  alertThreshold: (json['alert_threshold'] as num).toDouble(),
  criticalThreshold: (json['critical_threshold'] as num).toDouble(),
  notes: json['notes'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$MaterialToJson(Material instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'name': instance.name,
  'category_id': instance.categoryId,
  'unit_type': _$UnitTypeEnumMap[instance.unitType]!,
  'current_stock': instance.currentStock,
  'alert_threshold': instance.alertThreshold,
  'critical_threshold': instance.criticalThreshold,
  'notes': instance.notes,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$UnitTypeEnumMap = {
  UnitType.piece: 'piece',
  UnitType.gram: 'gram',
  UnitType.kilogram: 'kilogram',
  UnitType.liter: 'liter',
};

MaterialCategory _$MaterialCategoryFromJson(Map<String, dynamic> json) =>
    MaterialCategory(
      name: json['name'] as String,
      displayOrder: (json['display_order'] as num).toInt(),
      code: json['code'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$MaterialCategoryToJson(MaterialCategory instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.userId case final value?) 'user_id': value,
      'name': instance.name,
      'display_order': instance.displayOrder,
      if (instance.code case final value?) 'code': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  menuItemId: json['menu_item_id'] as String,
  materialId: json['material_id'] as String,
  requiredAmount: (json['required_amount'] as num).toDouble(),
  isOptional: json['is_optional'] as bool,
  notes: json['notes'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'menu_item_id': instance.menuItemId,
  'material_id': instance.materialId,
  'required_amount': instance.requiredAmount,
  'is_optional': instance.isOptional,
  'notes': instance.notes,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
