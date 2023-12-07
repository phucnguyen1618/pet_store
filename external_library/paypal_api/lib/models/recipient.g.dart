// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipient _$RecipientFromJson(Map<String, dynamic> json) => Recipient(
      json['billing_info'] == null
          ? null
          : BillingInfo.fromJson(json['billing_info'] as Map<String, dynamic>),
      json['shipping_info'] == null
          ? null
          : ShippingInfo.fromJson(
              json['shipping_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipientToJson(Recipient instance) => <String, dynamic>{
      'billing_info': instance.billingInfo,
      'shipping_info': instance.shippingInfo,
    };
