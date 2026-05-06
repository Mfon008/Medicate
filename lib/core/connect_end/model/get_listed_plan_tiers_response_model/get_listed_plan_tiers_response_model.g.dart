// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_listed_plan_tiers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListedPlanTiersResponseModel _$GetListedPlanTiersResponseModelFromJson(
  Map<String, dynamic> json,
) => GetListedPlanTiersResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetListedPlanTiersResponseModelToJson(
  GetListedPlanTiersResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
