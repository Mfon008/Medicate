// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientDetails _$PatientDetailsFromJson(Map<String, dynamic> json) =>
    PatientDetails(
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$PatientDetailsToJson(PatientDetails instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
