// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReminderResponseModel _$UpdateReminderResponseModelFromJson(
  Map<String, dynamic> json,
) => UpdateReminderResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateReminderResponseModelToJson(
  UpdateReminderResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
