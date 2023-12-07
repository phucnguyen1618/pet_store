// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendInvoiceResponse _$SendInvoiceResponseFromJson(Map<String, dynamic> json) =>
    SendInvoiceResponse(
      Link.fromJson(json['link'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendInvoiceResponseToJson(
        SendInvoiceResponse instance) =>
    <String, dynamic>{
      'link': instance.link,
    };
