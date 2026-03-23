// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hmo_plan_payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HmoPlanPaymentResponseModel _$HmoPlanPaymentResponseModelFromJson(
  Map<String, dynamic> json,
) => HmoPlanPaymentResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HmoPlanPaymentResponseModelToJson(
  HmoPlanPaymentResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
