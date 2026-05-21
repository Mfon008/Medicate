// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_hmo_plan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveHmoPlanResponseModel _$ActiveHmoPlanResponseModelFromJson(
  Map<String, dynamic> json,
) => ActiveHmoPlanResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActiveHmoPlanResponseModelToJson(
  ActiveHmoPlanResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
