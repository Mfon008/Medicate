// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_pharmacy_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPharmacyOtpModel _$VerifyPharmacyOtpModelFromJson(
  Map<String, dynamic> json,
) => VerifyPharmacyOtpModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyPharmacyOtpModelToJson(
  VerifyPharmacyOtpModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
