import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/discount.dart';
import 'package:paypal_api/models/unit_amount.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String name;
  @JsonKey(name: 'description')
  String desc;
  String quantity;
  @JsonKey(name: 'unit_amount')
  UnitAmount unitAmount;
  Discount? discount;

  Item(
    this.name,
    this.desc,
    this.quantity,
    this.unitAmount,
    this.discount,
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
