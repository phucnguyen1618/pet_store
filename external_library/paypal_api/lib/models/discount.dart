import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/amount.dart';

part 'discount.g.dart';

@JsonSerializable()
class Discount {
  String? percent;
  Amount? amount;

  Discount(this.percent, this.amount);

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}
