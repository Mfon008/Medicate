// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retry_payment_reminder_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetryPaymentReminderResponseModel _$RetryPaymentReminderResponseModelFromJson(
  Map<String, dynamic> json,
) => RetryPaymentReminderResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  datum: json['data'] == null
      ? null
      : Datum.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RetryPaymentReminderResponseModelToJson(
  RetryPaymentReminderResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.datum,
};
