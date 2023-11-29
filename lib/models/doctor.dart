import 'package:json_annotation/json_annotation.dart';
import 'package:pet_store/models/specialize.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  String id;
  String name;
  int sex;
  DateTime birthDay;
  String phone;
  String avatar;
  int experience;
  List<Specialize> specializes;
  String degree;
  String workAddress;

  Doctor(
    this.id,
    this.name,
    this.sex,
    this.birthDay,
    this.phone,
    this.avatar,
    this.experience,
    this.specializes,
    this.degree,
    this.workAddress,
  );

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
