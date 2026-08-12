// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_registration_number_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManufacturerRegistrationNumberModel
_$ManufacturerRegistrationNumberModelFromJson(Map<String, dynamic> json) =>
    ManufacturerRegistrationNumberModel(
      phone: json['phone'] as String?,
      distributorManufacturerName:
          json['distributorManufacturerName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      businessAddress: json['businessAddress'] as String?,
    );

Map<String, dynamic> _$ManufacturerRegistrationNumberModelToJson(
  ManufacturerRegistrationNumberModel instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'distributorManufacturerName': instance.distributorManufacturerName,
  'registrationNumber': instance.registrationNumber,
  'businessAddress': instance.businessAddress,
};
