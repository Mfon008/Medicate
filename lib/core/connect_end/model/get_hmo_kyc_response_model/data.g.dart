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
  businessAddress: json['businessAddress'] as String?,
  businessEmail: json['businessEmail'] as String?,
  contactPersonFirstName: json['contactPersonFirstName'] as String?,
  contactPersonLastName: json['contactPersonLastName'] as String?,
  contactPersonDesignation: json['contactPersonDesignation'] as String?,
  bankDetails: (json['bankDetails'] as List<dynamic>?)
      ?.map((e) => BankDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
  logo: json['logo'] == null
      ? null
      : Logo.fromJson(json['logo'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'tenantType': instance.tenantType,
  'name': instance.name,
  'owner': instance.owner,
  'businessAddress': instance.businessAddress,
  'businessEmail': instance.businessEmail,
  'contactPersonFirstName': instance.contactPersonFirstName,
  'contactPersonLastName': instance.contactPersonLastName,
  'contactPersonDesignation': instance.contactPersonDesignation,
  'bankDetails': instance.bankDetails,
  'logo': instance.logo,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
