// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoicer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoicer _$InvoicerFromJson(Map<String, dynamic> json) => Invoicer(
      json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      json['email_address'] as String?,
    );

Map<String, dynamic> _$InvoicerToJson(Invoicer instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'email_address': instance.email,
    };
