import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'name.dart';

part 'shipping_info.g.dart';

@JsonSerializable()
class ShippingInfo {
  Name? name;
  Address? address;

  ShippingInfo(this.name, this.address);

  factory ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingInfoToJson(this);
}
