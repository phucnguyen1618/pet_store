// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitAmount _$UnitAmountFromJson(Map<String, dynamic> json) => UnitAmount(
      json['currency_code'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$UnitAmountToJson(UnitAmount instance) =>
    <String, dynamic>{
      'currency_code': instance.currencyCode,
      'value': instance.value,
    };
