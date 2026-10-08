// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hmo_kyc_new_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHmoKycNewResponseModel _$GetHmoKycNewResponseModelFromJson(
  Map<String, dynamic> json,
) => GetHmoKycNewResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetHmoKycNewResponseModelToJson(
  GetHmoKycNewResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
