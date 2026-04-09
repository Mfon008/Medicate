// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_subscription_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMySubscriptionResponseModel _$GetMySubscriptionResponseModelFromJson(
  Map<String, dynamic> json,
) => GetMySubscriptionResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetMySubscriptionResponseModelToJson(
  GetMySubscriptionResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
