// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordResponseModel _$ForgotPasswordResponseModelFromJson(
  Map<String, dynamic> json,
) => ForgotPasswordResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForgotPasswordResponseModelToJson(
  ForgotPasswordResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data,
};
