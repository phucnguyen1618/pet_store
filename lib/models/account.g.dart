// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['id'] as String,
      json['name'] as String,
      json['phone'] as String?,
      json['email'] as String,
      json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      json['sex'] as int?,
    )..avatar = json['avatar'] as String?;

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'birthDay': instance.birthDay?.toIso8601String(),
      'sex': instance.sex,
      'avatar': instance.avatar,
    };
