// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Amount _$AmountFromJson(Map<String, dynamic> json) => Amount(
      json['currency_code'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$AmountToJson(Amount instance) => <String, dynamic>{
      'currency_code': instance.currencyCode,
      'value': instance.value,
    };
