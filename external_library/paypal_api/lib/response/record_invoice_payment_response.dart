import 'package:json_annotation/json_annotation.dart';

part 'record_invoice_payment_response.g.dart';

@JsonSerializable()
class RecordInvoicePaymentResponse {
  @JsonKey(name: 'payment_id')
  String paymentId;

  RecordInvoicePaymentResponse(this.paymentId);

  factory RecordInvoicePaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$RecordInvoicePaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecordInvoicePaymentResponseToJson(this);
}
