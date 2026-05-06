// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_listed_plan_types_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllListedPlanTypesResponseModel _$GetAllListedPlanTypesResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAllListedPlanTypesResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllListedPlanTypesResponseModelToJson(
  GetAllListedPlanTypesResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
