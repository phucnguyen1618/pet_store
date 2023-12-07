// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      json['percent'] as String?,
      json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'percent': instance.percent,
      'amount': instance.amount,
    };
