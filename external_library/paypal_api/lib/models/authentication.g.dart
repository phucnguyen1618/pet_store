// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) =>
    Authentication(
      json['scope'] as String,
      json['access_token'] as String,
      json['token_type'] as String,
      json['app_id'] as String,
      (json['expires_in'] as num).toDouble(),
      json['nonce'] as String,
    );

Map<String, dynamic> _$AuthenticationToJson(Authentication instance) =>
    <String, dynamic>{
      'scope': instance.scope,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'app_id': instance.appId,
      'expires_in': instance.expiresIn,
      'nonce': instance.nonce,
    };
