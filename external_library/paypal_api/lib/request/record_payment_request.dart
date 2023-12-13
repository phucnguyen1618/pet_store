import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/amount.dart';
import 'package:paypal_api/models/shipping_info.dart';

part 'record_payment_request.g.dart';

@JsonSerializable()
class RecordPaymentRequest {
  String method;
  String? note;
  @JsonKey(name: 'payment_date')
  String? date;
  Amount? amount;
  @JsonKey(name: 'shipping_info')
  ShippingInfo? shippingInfo;

  RecordPaymentRequest(
    this.method,
    this.note,
    this.date,
    this.amount,
    this.shippingInfo,
  );

  factory RecordPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$RecordPaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RecordPaymentRequestToJson(this);
}
