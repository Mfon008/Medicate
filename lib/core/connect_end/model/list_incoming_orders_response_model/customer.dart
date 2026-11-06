import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  String? tenantId;
  String? name;
  String? tenantType;
  String? address;
  String? displayId;
  String? registrationNumber;
  String? contactPersonName;
  String? phoneNumber;
  String? state;
  String? lga;
  String? recipientName;
  String? recipientIdType;

  Customer({
    this.tenantId,
    this.name,
    this.tenantType,
    this.address,
    this.displayId,
    this.registrationNumber,
    this.contactPersonName,
    this.phoneNumber,
    this.state,
    this.lga,
    this.recipientName,
    this.recipientIdType,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return _$CustomerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
