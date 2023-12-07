// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingInfo _$BillingInfoFromJson(Map<String, dynamic> json) => BillingInfo(
      json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      json['email_address'] as String?,
    );

Map<String, dynamic> _$BillingInfoToJson(BillingInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'email_address': instance.email,
    };
