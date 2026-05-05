// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  totalAmount: (json['total_amount'] as num).toInt(),
  status: OrderStatusMapper.fromJson(json['status']),
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['payment_method']),
  discountAmount: (json['discount_amount'] as num).toInt(),
  orderedAt: DateTime.parse(json['ordered_at'] as String),
  isCart: json['is_cart'] as bool? ?? false,
  orderNumber: json['order_number'] as String?,
  customerName: json['customer_name'] as String?,
  notes: json['notes'] as String?,
  startedPreparingAt: json['started_preparing_at'] == null
      ? null
      : DateTime.parse(json['started_preparing_at'] as String),
  readyAt: json['ready_at'] == null
      ? null
      : DateTime.parse(json['ready_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'total_amount': instance.totalAmount,
  'order_number': instance.orderNumber,
  'is_cart': instance.isCart,
  'status': OrderStatusMapper.toJson(instance.status),
  'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'discount_amount': instance.discountAmount,
  'customer_name': instance.customerName,
  'notes': instance.notes,
  'ordered_at': instance.orderedAt.toIso8601String(),
  'started_preparing_at': instance.startedPreparingAt?.toIso8601String(),
  'ready_at': instance.readyAt?.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.paypay: 'paypay',
  PaymentMethod.other: 'other',
};

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
  orderId: json['order_id'] as String,
  menuItemId: json['menu_item_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unit_price'] as num).toInt(),
  subtotal: (json['subtotal'] as num).toInt(),
  selectedOptions: (json['selected_options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  specialRequest: json['special_request'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'order_id': instance.orderId,
  'menu_item_id': instance.menuItemId,
  'quantity': instance.quantity,
  'unit_price': instance.unitPrice,
  'subtotal': instance.subtotal,
  'selected_options': instance.selectedOptions,
  'special_request': instance.specialRequest,
  'created_at': instance.createdAt?.toIso8601String(),
};
