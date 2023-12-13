// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListInvoiceResponse _$ListInvoiceResponseFromJson(Map<String, dynamic> json) =>
    ListInvoiceResponse(
      json['total_items'] as int,
      json['total_pages'] as int,
      (json['items'] as List<dynamic>)
          .map((e) => Invoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListInvoiceResponseToJson(
        ListInvoiceResponse instance) =>
    <String, dynamic>{
      'total_items': instance.totalItems,
      'total_pages': instance.totalPages,
      'items': instance.items,
      'links': instance.links,
    };
