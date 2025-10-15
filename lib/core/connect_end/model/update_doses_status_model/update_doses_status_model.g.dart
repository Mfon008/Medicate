// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_doses_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDosesStatusModel _$UpdateDosesStatusModelFromJson(
  Map<String, dynamic> json,
) => UpdateDosesStatusModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateDosesStatusModelToJson(
  UpdateDosesStatusModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
