// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_schedule_split_delivery_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteScheduleSplitDeliveryResponseModel
_$QuoteScheduleSplitDeliveryResponseModelFromJson(Map<String, dynamic> json) =>
    QuoteScheduleSplitDeliveryResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteScheduleSplitDeliveryResponseModelToJson(
  QuoteScheduleSplitDeliveryResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
