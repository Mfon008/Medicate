import 'package:json_annotation/json_annotation.dart';

import 'business_address.dart';

part 'level1.g.dart';

@JsonSerializable()
class Level1 {
  String? pharmacyName;
  String? phoneNumber;
  String? licenseNumber;
  String? businessAddress;
  String? email;
  String? country;
  String? state;
  String? lga;
  List<String>? selectedServices;
  String? contactPersonName;
  String? contactEmail;
  String? bankName;
  String? accountName;
  List<BusinessAddress>? businessAddresses;

  Level1({
    this.pharmacyName,
    this.phoneNumber,
    this.licenseNumber,
    this.businessAddress,
    this.email,
    this.country,
    this.state,
    this.lga,
    this.selectedServices,
    this.contactPersonName,
    this.contactEmail,
    this.bankName,
    this.accountName,
    this.businessAddresses,
  });

  factory Level1.fromJson(Map<String, dynamic> json) {
    return _$Level1FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level1ToJson(this);
}
