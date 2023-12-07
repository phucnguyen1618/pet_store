import 'package:json_annotation/json_annotation.dart';

part 'invoice_response.g.dart';

@JsonSerializable()
class InvoiceResponse {
  String rel;
  String href;
  String method;

  InvoiceResponse(
    this.rel,
    this.href,
    this.method,
  );

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
}
