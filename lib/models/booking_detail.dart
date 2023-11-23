import 'package:json_annotation/json_annotation.dart';

part 'booking_detail.g.dart';

@JsonSerializable()
class BookingDetail {
  @JsonKey(name: 'service_id')
  String id;
  double price;

  BookingDetail(this.id, this.price);

  factory BookingDetail.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDetailToJson(this);
}
