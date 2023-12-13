// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      json['id'] as String,
      json['name'] as String,
      json['sex'] as int,
      DateTime.parse(json['birthDay'] as String),
      json['phone'] as String,
      json['avatar'] as String,
      json['experience'] as int?,
      (json['specializes'] as List<dynamic>?)
          ?.map((e) => Specialize.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['workAddress'] as String,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sex': instance.sex,
      'birthDay': instance.birthDay.toIso8601String(),
      'phone': instance.phone,
      'avatar': instance.avatar,
      'experience': instance.experience,
      'specializes': instance.specializes,
      'workAddress': instance.workAddress,
    };
