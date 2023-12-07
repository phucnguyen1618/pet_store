// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['name'] as String,
      json['description'] as String,
      json['quantity'] as String,
      UnitAmount.fromJson(json['unit_amount'] as Map<String, dynamic>),
      json['discount'] == null
          ? null
          : Discount.fromJson(json['discount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.desc,
      'quantity': instance.quantity,
      'unit_amount': instance.unitAmount,
      'discount': instance.discount,
    };
