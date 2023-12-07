// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceAmount _$InvoiceAmountFromJson(Map<String, dynamic> json) =>
    InvoiceAmount(
      json['currency_code'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$InvoiceAmountToJson(InvoiceAmount instance) =>
    <String, dynamic>{
      'currency_code': instance.currencyCcode,
      'value': instance.value,
    };
