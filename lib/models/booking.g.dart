// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      json['booking_id'] as String,
      json['user_id'] as String,
      json['doctor_id'] as String,
      (json['booking_details'] as List<dynamic>)
          .map((e) => BookingDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      DateTime.parse(json['orderDateTime'] as String),
      json['address'] as String?,
      (json['totalAmount'] as num).toDouble(),
      json['status'] as int,
      json['reasonCancel'] as String?,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'booking_id': instance.idBooking,
      'user_id': instance.idUser,
      'doctor_id': instance.idDoctor,
      'booking_details': instance.bookingDetails,
      'orderDateTime': instance.orderDateTime.toIso8601String(),
      'address': instance.address,
      'totalAmount': instance.totalAmount,
      'status': instance.status,
      'reasonCancel': instance.reasonCancel,
    };
