import 'package:json_annotation/json_annotation.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail {
  String idProduct;
  int quantity;
  double totalPrice;

  OrderDetail(
    this.idProduct,
    this.quantity,
    this.totalPrice,
  );

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
