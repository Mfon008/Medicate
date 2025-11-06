// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_phamary_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpPhamaryResponseModel _$SignUpPhamaryResponseModelFromJson(
  Map<String, dynamic> json,
) => SignUpPhamaryResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SignUpPhamaryResponseModelToJson(
  SignUpPhamaryResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
