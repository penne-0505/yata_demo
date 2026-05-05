// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransaction _$StockTransactionFromJson(Map<String, dynamic> json) =>
    StockTransaction(
      materialId: json['material_id'] as String,
      transactionType: $enumDecode(
        _$TransactionTypeEnumMap,
        json['transaction_type'],
      ),
      changeAmount: (json['change_amount'] as num).toDouble(),
      referenceType: $enumDecodeNullable(
        _$ReferenceTypeEnumMap,
        json['reference_type'],
      ),
      referenceId: json['reference_id'] as String?,
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

Map<String, dynamic> _$StockTransactionToJson(StockTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'material_id': instance.materialId,
      'transaction_type': _$TransactionTypeEnumMap[instance.transactionType]!,
      'change_amount': instance.changeAmount,
      'reference_type': _$ReferenceTypeEnumMap[instance.referenceType],
      'reference_id': instance.referenceId,
      'notes': instance.notes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$TransactionTypeEnumMap = {
  TransactionType.purchase: 'purchase',
  TransactionType.sale: 'sale',
  TransactionType.adjustment: 'adjustment',
  TransactionType.waste: 'waste',
};

const _$ReferenceTypeEnumMap = {
  ReferenceType.order: 'order',
  ReferenceType.purchase: 'purchase',
  ReferenceType.adjustment: 'adjustment',
};

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
  purchaseDate: DateTime.parse(json['purchase_date'] as String),
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

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'purchase_date': instance.purchaseDate.toIso8601String(),
  'notes': instance.notes,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

PurchaseItem _$PurchaseItemFromJson(Map<String, dynamic> json) => PurchaseItem(
  purchaseId: json['purchase_id'] as String,
  materialId: json['material_id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$PurchaseItemToJson(PurchaseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'purchase_id': instance.purchaseId,
      'material_id': instance.materialId,
      'quantity': instance.quantity,
      'created_at': instance.createdAt?.toIso8601String(),
    };

StockAdjustment _$StockAdjustmentFromJson(Map<String, dynamic> json) =>
    StockAdjustment(
      materialId: json['material_id'] as String,
      adjustmentAmount: (json['adjustment_amount'] as num).toDouble(),
      adjustedAt: DateTime.parse(json['adjusted_at'] as String),
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

Map<String, dynamic> _$StockAdjustmentToJson(StockAdjustment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'material_id': instance.materialId,
      'adjustment_amount': instance.adjustmentAmount,
      'notes': instance.notes,
      'adjusted_at': instance.adjustedAt.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
