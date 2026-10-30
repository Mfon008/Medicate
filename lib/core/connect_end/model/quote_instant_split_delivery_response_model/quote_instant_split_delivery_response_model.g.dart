// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_instant_split_delivery_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteInstantSplitDeliveryResponseModel
_$QuoteInstantSplitDeliveryResponseModelFromJson(Map<String, dynamic> json) =>
    QuoteInstantSplitDeliveryResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteInstantSplitDeliveryResponseModelToJson(
  QuoteInstantSplitDeliveryResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
