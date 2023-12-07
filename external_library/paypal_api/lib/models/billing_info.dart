import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/address.dart';

import 'name.dart';

part 'billing_info.g.dart';

@JsonSerializable()
class BillingInfo {
  Name? name;
  Address? address;
  @JsonKey(name: 'email_address')
  String? email;

  BillingInfo(this.name, this.address, this.email);

  factory BillingInfo.fromJson(Map<String, dynamic> json) =>
      _$BillingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BillingInfoToJson(this);
}
