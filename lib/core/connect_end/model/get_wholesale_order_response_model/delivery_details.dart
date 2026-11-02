import 'package:json_annotation/json_annotation.dart';

part 'delivery_details.g.dart';

@JsonSerializable()
class DeliveryDetails {
  String? recipientName;
  String? recipientIdType;
  String? tenantId;
  String? name;
  String? address;
  String? phoneNumber;
  String? state;
  String? lga;

  DeliveryDetails({
    this.recipientName,
    this.recipientIdType,
    this.tenantId,
    this.name,
    this.address,
    this.phoneNumber,
    this.state,
    this.lga,
  });

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) {
    return _$DeliveryDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryDetailsToJson(this);
}
