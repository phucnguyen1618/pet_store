import 'package:json_annotation/json_annotation.dart';

part 'unit_amount.g.dart';

@JsonSerializable()
class UnitAmount {
  @JsonKey(name: 'currency_code')
  String currencyCode;
  String value;

  UnitAmount(this.currencyCode, this.value);

  factory UnitAmount.fromJson(Map<String, dynamic> json) =>
      _$UnitAmountFromJson(json);

  Map<String, dynamic> toJson() => _$UnitAmountToJson(this);
}
