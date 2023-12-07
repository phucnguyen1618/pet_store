// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      json['currency_code'] as String,
      json['invoice_number'] as String,
    )
      ..reference = json['reference'] as String?
      ..invoiceDate = json['invoice_date'] as String?
      ..note = json['note'] as String?;

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'currency_code': instance.currencyCode,
      'invoice_number': instance.invoiceNumber,
      'reference': instance.reference,
      'invoice_date': instance.invoiceDate,
      'note': instance.note,
    };
