// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_third_step_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveThirdStepResponseModel _$SaveThirdStepResponseModelFromJson(
  Map<String, dynamic> json,
) => SaveThirdStepResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SaveThirdStepResponseModelToJson(
  SaveThirdStepResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
