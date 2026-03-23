import 'package:json_annotation/json_annotation.dart';

part 'personal_info.g.dart';

@JsonSerializable()
class PersonalInfo {
  String? fullName;
  DateTime? dob;
  String? gender;
  String? email;
  String? phone;
  String? residentialAddress;
  String? preferredHospitalId;

  PersonalInfo({
    this.fullName,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.residentialAddress,
    this.preferredHospitalId,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return _$PersonalInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);
}
