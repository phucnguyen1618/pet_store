import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/detail.dart';
import 'package:paypal_api/models/invoice_amount.dart';
import 'package:paypal_api/models/invoicer.dart';
import 'package:paypal_api/models/recipient.dart';

import '../models/item.dart';

part 'invoice_request.g.dart';

@JsonSerializable()
class InvoiceRequest {
  Detail detail;
  Invoicer? invoicer;
  @JsonKey(name: 'primary_recipients')
  List<Recipient>? recipients;
  List<Item> items;
  InvoiceAmount? amount;

  InvoiceRequest(
    {required this.detail,
    this.invoicer,
    this.recipients,
    required this.items,
    this.amount,}
  );

  factory InvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$InvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceRequestToJson(this);
}
