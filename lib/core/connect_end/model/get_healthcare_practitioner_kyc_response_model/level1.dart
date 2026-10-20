import 'package:json_annotation/json_annotation.dart';

import 'business_addresses.dart';
import 'educational_experience.dart';
import 'means_of_id.dart';

part 'level1.g.dart';

@JsonSerializable()
class Level1 {
  String? fullName;
  String? phoneNumber;
  String? registrationNumber;
  String? practitionerType;
  String? healthcareFacilityName;
  List<String>? areaOfExpertise;
  int? yearsOfExperience;
  String? bio;
  String? country;
  String? state;
  String? lga;
  String? website;
  List<String>? servicesOffered;
  String? meansOfIdType;
  MeansOfId? meansOfId;
  String? businessAddress;
  String? businessEmail;
  List<EducationalExperience>? educationalExperience;
  List<BusinessAddresses>? businessAddresses;

  Level1({
    this.fullName,
    this.phoneNumber,
    this.registrationNumber,
    this.practitionerType,
    this.healthcareFacilityName,
    this.areaOfExpertise,
    this.yearsOfExperience,
    this.bio,
    this.country,
    this.state,
    this.lga,
    this.website,
    this.servicesOffered,
    this.meansOfIdType,
    this.meansOfId,
    this.businessAddress,
    this.businessAddresses,
    this.businessEmail,
    this.educationalExperience,
  });

  factory Level1.fromJson(Map<String, dynamic> json) {
    return _$Level1FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level1ToJson(this);
}
