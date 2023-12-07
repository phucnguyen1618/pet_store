import 'package:json_annotation/json_annotation.dart';

part 'invoice_amount.g.dart';

@JsonSerializable()
class InvoiceAmount {
  @JsonKey(name: 'currency_code')
  String currencyCcode;
  String value;

  InvoiceAmount(this.currencyCcode, this.value);

  factory InvoiceAmount.fromJson(Map<String, dynamic> json) =>
      _$InvoiceAmountFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceAmountToJson(this);
}
