// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  tenantType: json['tenantType'] as String?,
  name: json['name'] as String?,
  bio: json['bio'] as String?,
  meansOfId: json['meansOfId'] == null
          ? null
          : MeansOfId.fromJson(json['meansOfId'] as Map<String, dynamic>),
  meansOfIdType: json['meansOfIdType'] as String?,
  yearsOfExperience: json['yearsOfExperience'] as String?,
  owner: json['owner'] as String?,
  licenseNumber: json['licenseNumber'] as String?,
  businessAddress: json['businessAddress'] as String?,
  businessEmail: json['businessEmail'] as String?,
  email: json['email'] as String?,
  healthcareFacilityName: json['healthcareFacilityName'] as String?,
  kycDocuments: (json['kycDocuments'] as List<dynamic>?)
      ?.map((e) => KycDocument.fromJson(e as Map<String, dynamic>))
      .toList(),
  bankDetails: (json['bankDetails'] as List<dynamic>?)
      ?.map((e) => BankDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
  educationalExperience: (json['educationalExperience'] as List<dynamic>?)
      ?.map((e) => EducationalExperience.fromJson(e as Map<String, dynamic>))
      .toList(),
  logo: json['logo'] == null
      ? null
      : Logo.fromJson(json['logo'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  servicesOffered: (json['servicesOffered'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  registrationNumber: json['registrationNumber'] as String?,
  country: json['country'] as String?,
  authorizedRepInfo: json['authorizedRepInfo'] == null
      ? null
      : AuthorizedRepInfo.fromJson(
          json['authorizedRepInfo'] as Map<String, dynamic>,
        ),
  website: json['website'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'tenantType': instance.tenantType,
  'yearsOfExperience': instance.yearsOfExperience,
  'name': instance.name,
  'owner': instance.owner,
  'meansOfIdType': instance.meansOfIdType,
  'meansOfId': instance.meansOfId,
  'bio': instance.bio,
  'licenseNumber': instance.licenseNumber,
  'businessAddress': instance.businessAddress,
  'email': instance.email,
  'kycDocuments': instance.kycDocuments,
  'bankDetails': instance.bankDetails,
  'logo': instance.logo,
  'servicesOffered': instance.servicesOffered,
  'country': instance.country,
  'lga': instance.lga,
  'healthcareFacilityName': instance.healthcareFacilityName,
  'website': instance.website,
  'registrationNumber': instance.registrationNumber,
  'businessEmail': instance.businessEmail,
  'state': instance.state,
  'authorizedRepInfo': instance.authorizedRepInfo,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
