// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpResponseModel _$ResendOtpResponseModelFromJson(
  Map<String, dynamic> json,
) => ResendOtpResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResendOtpResponseModelToJson(
  ResendOtpResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
