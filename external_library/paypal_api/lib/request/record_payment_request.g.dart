// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordPaymentRequest _$RecordPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    RecordPaymentRequest(
      json['method'] as String,
      json['note'] as String?,
      json['payment_date'] as String?,
      json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      json['shipping_info'] == null
          ? null
          : ShippingInfo.fromJson(
              json['shipping_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecordPaymentRequestToJson(
        RecordPaymentRequest instance) =>
    <String, dynamic>{
      'method': instance.method,
      'note': instance.note,
      'payment_date': instance.date,
      'amount': instance.amount,
      'shipping_info': instance.shippingInfo,
    };
