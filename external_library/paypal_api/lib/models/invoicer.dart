import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_api/models/address.dart';
import 'package:paypal_api/models/name.dart';

part 'invoicer.g.dart';

@JsonSerializable()
class Invoicer {
  Name? name;
  Address? address;
  @JsonKey(name: 'email_address')
  String? email;

  Invoicer(this.name, this.address, this.email);

  factory Invoicer.fromJson(Map<String, dynamic> json) =>
      _$InvoicerFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicerToJson(this);
}
