// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_today_reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTodayReminderModel _$GetTodayReminderModelFromJson(
  Map<String, dynamic> json,
) => GetTodayReminderModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetTodayReminderModelToJson(
  GetTodayReminderModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
