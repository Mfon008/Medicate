// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reminder_retry_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReminderRetryPaymentModel _$GetReminderRetryPaymentModelFromJson(
  Map<String, dynamic> json,
) => GetReminderRetryPaymentModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetReminderRetryPaymentModelToJson(
  GetReminderRetryPaymentModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
