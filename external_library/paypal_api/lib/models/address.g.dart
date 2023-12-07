// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['country_code'] as String,
      json['address_line_1'] as String,
      json['postal_code'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country_code': instance.countryCode,
      'address_line_1': instance.address,
      'postal_code': instance.postalCode,
    };
