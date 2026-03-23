// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
  fullName: json['fullName'] as String?,
  dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
  gender: json['gender'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  residentialAddress: json['residentialAddress'] as String?,
  preferredHospitalId: json['preferredHospitalId'] as String?,
);

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'residentialAddress': instance.residentialAddress,
      'preferredHospitalId': instance.preferredHospitalId,
    };
