// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_distributor_kyc_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDistributorKycResponseModel _$GetDistributorKycResponseModelFromJson(
  Map<String, dynamic> json,
) => GetDistributorKycResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetDistributorKycResponseModelToJson(
  GetDistributorKycResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
