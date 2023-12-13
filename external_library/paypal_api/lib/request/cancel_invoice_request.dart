import 'package:json_annotation/json_annotation.dart';

part 'cancel_invoice_request.g.dart';

@JsonSerializable()
class CancelInvoiceRequest {
  String? subject;
  String? note;
  @JsonKey(name: 'send_to_invoicer')
  bool? sendInvoicer;
  @JsonKey(name: 'send_to_recipient')
  bool? sendRecipient;
  @JsonKey(name: 'additional_recipients')
  List<String>? additionalRecipients;

  CancelInvoiceRequest(
    this.subject,
    this.note,
    this.sendInvoicer,
    this.sendRecipient,
    this.additionalRecipients,
  );

  factory CancelInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CancelInvoiceRequestToJson(this);
}
