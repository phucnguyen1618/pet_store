// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specialize _$SpecializeFromJson(Map<String, dynamic> json) => Specialize(
      json['specialize'] as String,
      DateTime.parse(json['startAt'] as String),
      DateTime.parse(json['endAt'] as String),
    );

Map<String, dynamic> _$SpecializeToJson(Specialize instance) =>
    <String, dynamic>{
      'specialize': instance.specialize,
      'startAt': instance.startAt.toIso8601String(),
      'endAt': instance.endAt.toIso8601String(),
    };
