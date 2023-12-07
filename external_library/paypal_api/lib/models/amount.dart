import 'package:json_annotation/json_annotation.dart';

part 'amount.g.dart';

@JsonSerializable()
class Amount {
  @JsonKey(name: 'currency_code')
  String currencyCode;
  String value;

  Amount(this.currencyCode, this.value);

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Map<String, dynamic> toJson() => _$AmountToJson(this);
}
