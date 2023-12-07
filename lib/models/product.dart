import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Product extends HiveObject {
  @HiveField(0)
  String idProduct;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;
  @HiveField(3)
  double cost;
  @HiveField(4)
  double? discount;
  @HiveField(5)
  String? desc;
  @HiveField(6)
  List<String> categories;

  Product(
    this.idProduct,
    this.name,
    this.image,
    this.cost,
    this.discount,
    this.desc,
    this.categories,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  double getPrice() {
    return discount != null
        ? discount != 0
            ? cost - cost * (discount! / 100)
            : cost
        : cost;
  }
}
