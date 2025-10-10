// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReminderResponseModel _$GetReminderResponseModelFromJson(
  Map<String, dynamic> json,
) => GetReminderResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetReminderResponseModelToJson(
  GetReminderResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
