import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/billing_info.dart';
import 'package:paypal_api/models/shipping_info.dart';

part 'recipient.g.dart';

@JsonSerializable()
class Recipient {
  @JsonKey(name: 'billing_info')
  BillingInfo? billingInfo;
  @JsonKey(name: 'shipping_info')
  ShippingInfo? shippingInfo;

  Recipient(this.billingInfo, this.shippingInfo);

  factory Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipientToJson(this);
}
