import 'package:json_annotation/json_annotation.dart';

part 'send_invoice_request.g.dart';

@JsonSerializable()
class SendInvoiceRequest {
  String? subject;
  String? note;
  @JsonKey(name: 'send_to_invoicer')
  bool? sendInvoicer;
  @JsonKey(name: 'send_to_recipient')
  bool? sendRecipient;

  SendInvoiceRequest(this.note, this.sendInvoicer, this.sendRecipient);

  factory SendInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$SendInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendInvoiceRequestToJson(this);
}
