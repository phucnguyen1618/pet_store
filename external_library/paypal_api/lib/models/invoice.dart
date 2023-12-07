import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/models.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  String id;
  String status;
  Detail? detail;
  Invoicer? invoicer;
  @JsonKey(name: 'primary_recipients')
  List<Recipient>? recipients;
  Amount? amount;
  List<Link>? links;

  Invoice(
    this.id,
    this.status,
    this.detail,
    this.invoicer,
    this.recipients,
    this.amount,
    this.links,
  );

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
