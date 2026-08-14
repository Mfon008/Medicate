// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDetails _$BusinessDetailsFromJson(Map<String, dynamic> json) =>
    BusinessDetails(
      cacRegistrationNumber: json['cacRegistrationNumber'] as String?,
      taxIdentificationNumber: json['taxIdentificationNumber'] as String?,
      registeredAddress: json['registeredAddress'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      contactPersonPhoneNumber: json['contactPersonPhoneNumber'] as String?,
      contactPersonEmail: json['contactPersonEmail'] as String?,
      businessWebsite: json['businessWebsite'] as String?,
    );

Map<String, dynamic> _$BusinessDetailsToJson(BusinessDetails instance) =>
    <String, dynamic>{
      'cacRegistrationNumber': instance.cacRegistrationNumber,
      'taxIdentificationNumber': instance.taxIdentificationNumber,
      'registeredAddress': instance.registeredAddress,
      'contactPersonName': instance.contactPersonName,
      'contactPersonPhoneNumber': instance.contactPersonPhoneNumber,
      'contactPersonEmail': instance.contactPersonEmail,
      'businessWebsite': instance.businessWebsite,
    };
