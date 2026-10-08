import 'package:json_annotation/json_annotation.dart';

import 'business_addresses.dart';

part 'level1.g.dart';

@JsonSerializable()
class Level1 {
  String? healthcareFacilityName;
  String? phoneNumber;
  String? registrationNumber;
  String? providerType;
  String? country;
  String? state;
  String? lga;
  String? website;
  List<String>? servicesOffered;
  List<BusinessAddresses>? businessAddresses;
  String? businessAddress;
  String? businessEmail;

  Level1({
    this.healthcareFacilityName,
    this.phoneNumber,
    this.registrationNumber,
    this.providerType,
    this.country,
    this.state,
    this.lga,
    this.website,
    this.servicesOffered,
    this.businessAddresses,
    this.businessAddress,
    this.businessEmail,
  });

  factory Level1.fromJson(Map<String, dynamic> json) {
    return _$Level1FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level1ToJson(this);
}
