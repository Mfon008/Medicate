// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_distributor_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDistributorProfileResponseModel _$GetDistributorProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => GetDistributorProfileResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetDistributorProfileResponseModelToJson(
  GetDistributorProfileResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
