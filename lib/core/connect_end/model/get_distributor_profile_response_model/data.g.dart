// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  tenantType: json['tenantType'] as String?,
  distributorManufacturerName: json['distributorManufacturerName'] as String?,
  registrationNumber: json['registrationNumber'] as String?,
  email: json['email'] as String?,
  businessAddress: json['businessAddress'] as String?,
  country: json['country'] as String?,
  state: json['state'] as String?,
  lga: json['lga'] as String?,
  phone: json['phone'] as String?,
  kycStatus: json['kycStatus'] as String?,
  isProfileComplete: json['isProfileComplete'] as bool?,
  profileCompletionPercentage: (json['profileCompletionPercentage'] as num?)
      ?.toInt(),
  missingFields: (json['missingFields'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  lastActive: json['lastActive'] == null
      ? null
      : DateTime.parse(json['lastActive'] as String),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'tenantType': instance.tenantType,
  'distributorManufacturerName': instance.distributorManufacturerName,
  'registrationNumber': instance.registrationNumber,
  'email': instance.email,
  'businessAddress': instance.businessAddress,
  'country': instance.country,
  'state': instance.state,
  'lga': instance.lga,
  'phone': instance.phone,
  'kycStatus': instance.kycStatus,
  'isProfileComplete': instance.isProfileComplete,
  'profileCompletionPercentage': instance.profileCompletionPercentage,
  'missingFields': instance.missingFields,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'lastActive': instance.lastActive?.toIso8601String(),
};
