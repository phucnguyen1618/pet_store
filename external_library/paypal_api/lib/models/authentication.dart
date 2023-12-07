import 'package:json_annotation/json_annotation.dart';

part 'authentication.g.dart';

@JsonSerializable()
class Authentication {
  String scope;
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'token_type')
  String tokenType;
  @JsonKey(name: 'app_id')
  String appId;
  @JsonKey(name: 'expires_in')
  double expiresIn;
  String nonce;

  Authentication(
    this.scope,
    this.accessToken,
    this.tokenType,
    this.appId,
    this.expiresIn,
    this.nonce,
  );

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);
}
