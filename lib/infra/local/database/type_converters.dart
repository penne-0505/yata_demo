import "dart:convert";

import "package:drift/drift.dart";

import "../../../core/constants/enums.dart";
import "../../../features/order/shared/order_status_mapper.dart";

class UnitTypeConverter extends TypeConverter<UnitType, String> {
  const UnitTypeConverter();

  @override
  UnitType fromSql(String fromDb) => UnitType.values.firstWhere(
    (UnitType value) => value.value == fromDb,
    orElse: () => UnitType.piece,
  );

  @override
  String toSql(UnitType value) => value.value;
}

class TransactionTypeConverter extends TypeConverter<TransactionType, String> {
  const TransactionTypeConverter();

  @override
  TransactionType fromSql(String fromDb) => TransactionType.values.firstWhere(
    (TransactionType value) => value.value == fromDb,
    orElse: () => TransactionType.adjustment,
  );

  @override
  String toSql(TransactionType value) => value.value;
}

class ReferenceTypeConverter extends TypeConverter<ReferenceType, String> {
  const ReferenceTypeConverter();

  @override
  ReferenceType fromSql(String fromDb) => ReferenceType.values.firstWhere(
    (ReferenceType value) => value.value == fromDb,
    orElse: () => ReferenceType.adjustment,
  );

  @override
  String toSql(ReferenceType value) => value.value;
}

class PaymentMethodConverter extends TypeConverter<PaymentMethod, String> {
  const PaymentMethodConverter();

  @override
  PaymentMethod fromSql(String fromDb) => PaymentMethod.values.firstWhere(
    (PaymentMethod value) => value.value == fromDb,
    orElse: () => PaymentMethod.cash,
  );

  @override
  String toSql(PaymentMethod value) => value.value;
}

class OrderStatusConverter extends TypeConverter<OrderStatus, String> {
  const OrderStatusConverter();

  @override
  OrderStatus fromSql(String fromDb) => OrderStatusMapper.fromJson(fromDb);

  @override
  String toSql(OrderStatus value) => OrderStatusMapper.toJson(value);
}

class StringMapJsonConverter
    extends TypeConverter<Map<String, String>, String> {
  const StringMapJsonConverter();

  @override
  Map<String, String> fromSql(String fromDb) {
    final Object? decoded = jsonDecode(fromDb);
    if (decoded is! Map) {
      return <String, String>{};
    }

    return decoded.map<String, String>(
      (Object? key, Object? value) =>
          MapEntry<String, String>(key.toString(), value.toString()),
    );
  }

  @override
  String toSql(Map<String, String> value) => jsonEncode(value);
}
