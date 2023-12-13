import 'package:json_annotation/json_annotation.dart';

import 'amount.dart';
import 'detail.dart';
import 'invoicer.dart';
import 'link.dart';
import 'recipient.dart';

part 'invoice_detail.g.dart';

@JsonSerializable()
class InvoiceDetail {
  String id;
  String status;
  Detail? detail;
  Invoicer? invoicer;
  @JsonKey(name: 'primary_recipients')
  List<Recipient>? recipients;
  Amount? amount;
  List<Link>? links;

  InvoiceDetail(
    this.id,
    this.status,
    this.detail,
    this.invoicer,
    this.recipients,
    this.amount,
    this.links,
  );

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDetailToJson(this);
}