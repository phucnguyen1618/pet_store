import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/models.dart';

part 'list_invoice_response.g.dart';

@JsonSerializable()
class ListInvoiceResponse {
  @JsonKey(name: 'total_items')
  int totalItems;
  @JsonKey(name: 'total_pages')
  int totalPages;
  List<Invoice> items;
  List<Link> links;

  ListInvoiceResponse(
    this.totalItems,
    this.totalPages,
    this.items,
    this.links,
  );

  factory ListInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListInvoiceResponseToJson(this);
}
