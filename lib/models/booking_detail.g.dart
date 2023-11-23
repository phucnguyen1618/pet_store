// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDetail _$BookingDetailFromJson(Map<String, dynamic> json) =>
    BookingDetail(
      json['service_id'] as String,
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$BookingDetailToJson(BookingDetail instance) =>
    <String, dynamic>{
      'service_id': instance.id,
      'price': instance.price,
    };
