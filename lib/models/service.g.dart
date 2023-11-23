// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      json['id'] as String,
      json['name'] as String,
      json['image'] as String,
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.idService,
      'name': instance.name,
      'image': instance.imageService,
      'price': instance.price,
    };
