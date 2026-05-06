// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hmo_kyc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHmoKycResponseModel _$GetHmoKycResponseModelFromJson(
  Map<String, dynamic> json,
) => GetHmoKycResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetHmoKycResponseModelToJson(
  GetHmoKycResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
