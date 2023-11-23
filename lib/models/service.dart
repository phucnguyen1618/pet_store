import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  @JsonKey(name: 'id')
  String idService;
  String name;
  @JsonKey(name: 'image')
  String imageService;
  double price;

  Service(
    this.idService,
    this.name,
    this.imageService,
    this.price,
  );

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
