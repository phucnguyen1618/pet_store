// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      json['id'] as String,
      json['status'] as String,
      json['detail'] == null
          ? null
          : Detail.fromJson(json['detail'] as Map<String, dynamic>),
      json['invoicer'] == null
          ? null
          : Invoicer.fromJson(json['invoicer'] as Map<String, dynamic>),
      (json['primary_recipients'] as List<dynamic>?)
          ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'detail': instance.detail,
      'invoicer': instance.invoicer,
      'primary_recipients': instance.recipients,
      'amount': instance.amount,
      'links': instance.links,
    };
