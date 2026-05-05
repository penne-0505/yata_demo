// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) => MenuCategory(
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

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'display_order': instance.displayOrder,
      if (instance.code case final value?) 'code': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
  name: json['name'] as String,
  categoryId: json['category_id'] as String,
  price: (json['price'] as num).toInt(),
  isAvailable: json['is_available'] as bool,
  displayOrder: (json['display_order'] as num).toInt(),
  description: json['description'] as String?,
  imageUrl: json['image_url'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'name': instance.name,
  'category_id': instance.categoryId,
  'price': instance.price,
  'description': instance.description,
  'is_available': instance.isAvailable,
  'display_order': instance.displayOrder,
  'image_url': instance.imageUrl,
  if (instance.createdAt?.toIso8601String() case final value?)
    'created_at': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updated_at': value,
};

MenuItemOption _$MenuItemOptionFromJson(Map<String, dynamic> json) =>
    MenuItemOption(
      menuItemId: json['menu_item_id'] as String,
      optionName: json['option_name'] as String,
      optionValues: (json['option_values'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isRequired: json['is_required'] as bool,
      additionalPrice: (json['additional_price'] as num).toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$MenuItemOptionToJson(MenuItemOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'menu_item_id': instance.menuItemId,
      'option_name': instance.optionName,
      'option_values': instance.optionValues,
      'is_required': instance.isRequired,
      'additional_price': instance.additionalPrice,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };
