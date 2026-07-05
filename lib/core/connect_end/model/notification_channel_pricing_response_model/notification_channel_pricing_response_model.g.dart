// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_channel_pricing_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationChannelPricingResponseModel
_$NotificationChannelPricingResponseModelFromJson(Map<String, dynamic> json) =>
    NotificationChannelPricingResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationChannelPricingResponseModelToJson(
  NotificationChannelPricingResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
