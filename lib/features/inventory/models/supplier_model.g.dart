// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Supplier _$SupplierFromJson(Map<String, dynamic> json) => Supplier(
  name: json['name'] as String,
  contactInfo: json['contactInfo'] as String,
  notes: json['notes'] as String?,
  isActive: json['isActive'] as bool? ?? true,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  id: json['id'] as String?,
  userId: json['userId'] as String?,
);

Map<String, dynamic> _$SupplierToJson(Supplier instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'name': instance.name,
  'contactInfo': instance.contactInfo,
  'notes': instance.notes,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

MaterialSupplier _$MaterialSupplierFromJson(Map<String, dynamic> json) =>
    MaterialSupplier(
      materialId: json['materialId'] as String,
      supplierId: json['supplierId'] as String,
      isPreferred: json['isPreferred'] as bool? ?? false,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$MaterialSupplierToJson(MaterialSupplier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'materialId': instance.materialId,
      'supplierId': instance.supplierId,
      'isPreferred': instance.isPreferred,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
