// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_second_step_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveSecondStepResponseModel _$SaveSecondStepResponseModelFromJson(
  Map<String, dynamic> json,
) => SaveSecondStepResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SaveSecondStepResponseModelToJson(
  SaveSecondStepResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
