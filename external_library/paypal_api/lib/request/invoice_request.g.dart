// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceRequest _$InvoiceRequestFromJson(Map<String, dynamic> json) =>
    InvoiceRequest(
      detail: Detail.fromJson(json['detail'] as Map<String, dynamic>),
      invoicer: json['invoicer'] == null
          ? null
          : Invoicer.fromJson(json['invoicer'] as Map<String, dynamic>),
      recipients: (json['primary_recipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      amount: json['amount'] == null
          ? null
          : InvoiceAmount.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvoiceRequestToJson(InvoiceRequest instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'invoicer': instance.invoicer,
      'primary_recipients': instance.recipients,
      'items': instance.items,
      'amount': instance.amount,
    };
