import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  String id;
  String name;
  String? phone;
  String email;
  DateTime? birthDay;
  // 0: male, 1: Female
  int? sex;
  String? avatar;

  Account(
    this.id,
    this.name,
    this.phone,
    this.email,
    this.birthDay,
    this.sex,
  );

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  
}
