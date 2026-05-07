// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plan_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlanDetailResponseModel _$GetPlanDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => GetPlanDetailResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetPlanDetailResponseModelToJson(
  GetPlanDetailResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
