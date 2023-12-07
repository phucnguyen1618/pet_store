import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class Detail {
  @JsonKey(name: 'currency_code')
  String currencyCode;
  @JsonKey(name: 'invoice_number')
  String invoiceNumber;
  String? reference;
  @JsonKey(name: 'invoice_date')
  String? invoiceDate;
  String? note;

  Detail(this.currencyCode, this.invoiceNumber);

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
