// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReminderResponseModel _$CreateReminderResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateReminderResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateReminderResponseModelToJson(
  CreateReminderResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
