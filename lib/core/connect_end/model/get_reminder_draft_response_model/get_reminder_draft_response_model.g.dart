// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reminder_draft_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReminderDraftResponseModel _$GetReminderDraftResponseModelFromJson(
  Map<String, dynamic> json,
) => GetReminderDraftResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetReminderDraftResponseModelToJson(
  GetReminderDraftResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
