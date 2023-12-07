import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/models.dart';

part 'send_invoice_response.g.dart';

@JsonSerializable()
class SendInvoiceResponse {
  Link link;

  SendInvoiceResponse(this.link);

  factory SendInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$SendInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendInvoiceResponseToJson(this);
}
