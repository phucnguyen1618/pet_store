import 'package:json_annotation/json_annotation.dart';

part 'specialize.g.dart';

@JsonSerializable()
class Specialize {
  String specialize;
  DateTime startAt;
  DateTime endAt;

  Specialize(
    this.specialize,
    this.startAt,
    this.endAt,
  );

  factory Specialize.fromJson(Map<String, dynamic> json) =>
      _$SpecializeFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializeToJson(this);
}
