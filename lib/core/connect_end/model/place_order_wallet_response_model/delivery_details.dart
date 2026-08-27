import 'package:json_annotation/json_annotation.dart';

part 'delivery_details.g.dart';

@JsonSerializable()
class DeliveryDetails {
  String? state;
  String? lga;
  String? deliveryAddress;
  String? contactPhone;
  String? orderNotes;

  DeliveryDetails({
    this.state,
    this.lga,
    this.deliveryAddress,
    this.contactPhone,
    this.orderNotes,
  });

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) {
    return _$DeliveryDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryDetailsToJson(this);
}
