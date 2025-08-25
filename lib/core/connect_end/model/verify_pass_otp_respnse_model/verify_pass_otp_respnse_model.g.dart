// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_pass_otp_respnse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPassOtpRespnseModel _$VerifyPassOtpRespnseModelFromJson(
  Map<String, dynamic> json,
) => VerifyPassOtpRespnseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyPassOtpRespnseModelToJson(
  VerifyPassOtpRespnseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data,
};
