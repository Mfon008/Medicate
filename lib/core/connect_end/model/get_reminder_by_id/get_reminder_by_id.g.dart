// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reminder_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReminderById _$GetReminderByIdFromJson(Map<String, dynamic> json) =>
    GetReminderById(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetReminderByIdToJson(GetReminderById instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
