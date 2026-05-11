// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hmo_dashboard_count_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHmoDashboardCountResponseModel _$GetHmoDashboardCountResponseModelFromJson(
  Map<String, dynamic> json,
) => GetHmoDashboardCountResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetHmoDashboardCountResponseModelToJson(
  GetHmoDashboardCountResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
