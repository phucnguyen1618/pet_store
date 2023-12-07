import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(name: 'country_code')
  String countryCode;
  @JsonKey(name: 'address_line_1')
  String address;
  @JsonKey(name: 'postal_code')
  String postalCode;

  Address(
    this.countryCode,
    this.address,
    this.postalCode,
  );

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
