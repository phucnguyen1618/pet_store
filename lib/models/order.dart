import 'package:json_annotation/json_annotation.dart';
import 'package:pet_store/models/order_detail.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String idOrder;
  @JsonKey(name: 'user_id')
  String idUser;
  @JsonKey(name: 'order_details')
  List<OrderDetail> orderDetails;
  @JsonKey(name: 'order_date')
  DateTime orderDateTime;
  @JsonKey(name: 'total_amount')
  double totalAmount;
  //0 là đã đặt hàng, 1 là đặt hàng thành công, 2 là đã huỷ
  int status;

  Order(
    this.idOrder,
    this.idUser,
    this.orderDetails,
    this.orderDateTime,
    this.totalAmount,
    this.status,
  );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Map<String, dynamic> convertToJson() {
    return {
      "idOrder": idOrder,
      "user_id": idUser,
      "order_details": orderDetails.map((e) => e.toJson()).toList(),
      "order_date": orderDateTime.toIso8601String(),
      "total_amount": totalAmount,
      "status": status,
    };
  }
}
