// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  tenantType: json['tenantType'] as String?,
  name: json['name'] as String?,
  owner: json['owner'] as String?,
  providerType: json['providerType'] as String?,
  healthcareFacilityName: json['healthcareFacilityName'] as String?,
  registrationNumber: json['registrationNumber'] as String?,
  servicesOffered: (json['servicesOffered'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  website: json['website'] as String?,
  businessEmail: json['businessEmail'] as String?,
  businessAddress: json['businessAddress'] as String?,
  bankDetails: (json['bankDetails'] as List<dynamic>?)
      ?.map((e) => BankDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
  country: json['country'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  authorizedRepInfo: json['authorizedRepInfo'] == null
      ? null
      : AuthorizedRepInfo.fromJson(
          json['authorizedRepInfo'] as Map<String, dynamic>,
        ),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'tenantType': instance.tenantType,
  'name': instance.name,
  'owner': instance.owner,
  'providerType': instance.providerType,
  'healthcareFacilityName': instance.healthcareFacilityName,
  'registrationNumber': instance.registrationNumber,
  'servicesOffered': instance.servicesOffered,
  'website': instance.website,
  'businessEmail': instance.businessEmail,
  'businessAddress': instance.businessAddress,
  'bankDetails': instance.bankDetails,
  'country': instance.country,
  'state': instance.state,
  'lga': instance.lga,
  'authorizedRepInfo': instance.authorizedRepInfo,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
