// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelInvoiceRequest _$CancelInvoiceRequestFromJson(
        Map<String, dynamic> json) =>
    CancelInvoiceRequest(
      json['subject'] as String?,
      json['note'] as String?,
      json['send_to_invoicer'] as bool?,
      json['send_to_recipient'] as bool?,
      (json['additional_recipients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CancelInvoiceRequestToJson(
        CancelInvoiceRequest instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'note': instance.note,
      'send_to_invoicer': instance.sendInvoicer,
      'send_to_recipient': instance.sendRecipient,
      'additional_recipients': instance.additionalRecipients,
    };
