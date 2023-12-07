import 'package:json_annotation/json_annotation.dart';

part 'generate_invoice_number_response.g.dart';

@JsonSerializable()
class GenerateInvoiceNumberResponse {
  @JsonKey(name: 'invoice_number')
  String invoiceNumber;

  GenerateInvoiceNumberResponse(this.invoiceNumber);

  factory GenerateInvoiceNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateInvoiceNumberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateInvoiceNumberResponseToJson(this);
}
