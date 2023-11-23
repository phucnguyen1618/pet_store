// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['idOrder'] as String,
      json['user_id'] as String,
      (json['order_details'] as List<dynamic>)
          .map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      DateTime.parse(json['order_date'] as String),
      (json['total_amount'] as num).toDouble(),
      json['status'] as int,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'idOrder': instance.idOrder,
      'user_id': instance.idUser,
      'order_details': instance.orderDetails,
      'order_date': instance.orderDateTime.toIso8601String(),
      'total_amount': instance.totalAmount,
      'status': instance.status,
    };
