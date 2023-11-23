import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'cart.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Cart extends HiveObject {
  @JsonKey(name: 'id')
  @HiveField(0)
  String idItem;
  @HiveField(1)
  Product product;
  @HiveField(2)
  int quantity;

  Cart(this.idItem, this.product, this.quantity);

  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);

  Map<String, dynamic> convertToJson() {
    return {
      "id": idItem,
      "product": product.toJson(),
      "quantity": quantity,
    };
  }
}
