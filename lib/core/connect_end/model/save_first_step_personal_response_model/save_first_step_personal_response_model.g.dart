// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_first_step_personal_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveFirstStepPersonalResponseModel _$SaveFirstStepPersonalResponseModelFromJson(
  Map<String, dynamic> json,
) => SaveFirstStepPersonalResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SaveFirstStepPersonalResponseModelToJson(
  SaveFirstStepPersonalResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
