// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      json['idProduct'] as String,
      json['quantity'] as int,
      (json['totalPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'idProduct': instance.idProduct,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
    };
