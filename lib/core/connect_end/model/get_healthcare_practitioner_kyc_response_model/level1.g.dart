// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level1 _$Level1FromJson(Map<String, dynamic> json) => Level1(
  fullName: json['fullName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  registrationNumber: json['registrationNumber'] as String?,
  practitionerType: json['practitionerType'] as String?,
  healthcareFacilityName: json['healthcareFacilityName'] as String?,
  areaOfExpertise: (json['areaOfExpertise'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  yearsOfExperience: (json['yearsOfExperience'] as num?)?.toInt(),
  bio: json['bio'] as String?,
  country: json['country'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  website: json['website'] as String?,
  servicesOffered: (json['servicesOffered'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  meansOfIdType: json['meansOfIdType'] as String?,
  meansOfId: json['meansOfId'] == null
      ? null
      : MeansOfId.fromJson(json['meansOfId'] as Map<String, dynamic>),
  businessAddress: json['businessAddress'] as String?,
  businessAddresses: (json['businessAddresses'] as List<dynamic>?)
      ?.map((e) => BusinessAddresses.fromJson(e as Map<String, dynamic>))
      .toList(),
  businessEmail: json['businessEmail'] as String?,
  educationalExperience: (json['educationalExperience'] as List<dynamic>?)
      ?.map((e) => EducationalExperience.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Level1ToJson(Level1 instance) => <String, dynamic>{
  'fullName': instance.fullName,
  'phoneNumber': instance.phoneNumber,
  'registrationNumber': instance.registrationNumber,
  'practitionerType': instance.practitionerType,
  'healthcareFacilityName': instance.healthcareFacilityName,
  'areaOfExpertise': instance.areaOfExpertise,
  'yearsOfExperience': instance.yearsOfExperience,
  'bio': instance.bio,
  'country': instance.country,
  'state': instance.state,
  'lga': instance.lga,
  'website': instance.website,
  'servicesOffered': instance.servicesOffered,
  'meansOfIdType': instance.meansOfIdType,
  'meansOfId': instance.meansOfId,
  'businessAddress': instance.businessAddress,
  'businessEmail': instance.businessEmail,
  'educationalExperience': instance.educationalExperience,
  'businessAddresses': instance.businessAddresses,
};
