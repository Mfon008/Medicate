// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_instant_delivery_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteInstantDeliveryResponseModel _$QuoteInstantDeliveryResponseModelFromJson(
  Map<String, dynamic> json,
) => QuoteInstantDeliveryResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QuoteInstantDeliveryResponseModelToJson(
  QuoteInstantDeliveryResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
