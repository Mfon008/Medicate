// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiatePaymentResponseModel _$InitiatePaymentResponseModelFromJson(
  Map<String, dynamic> json,
) => InitiatePaymentResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InitiatePaymentResponseModelToJson(
  InitiatePaymentResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
