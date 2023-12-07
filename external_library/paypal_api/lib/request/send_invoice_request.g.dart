// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendInvoiceRequest _$SendInvoiceRequestFromJson(Map<String, dynamic> json) =>
    SendInvoiceRequest(
      json['note'] as String?,
      json['send_to_invoicer'] as bool?,
      json['send_to_recipient'] as bool?,
    )..subject = json['subject'] as String?;

Map<String, dynamic> _$SendInvoiceRequestToJson(SendInvoiceRequest instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'note': instance.note,
      'send_to_invoicer': instance.sendInvoicer,
      'send_to_recipient': instance.sendRecipient,
    };
