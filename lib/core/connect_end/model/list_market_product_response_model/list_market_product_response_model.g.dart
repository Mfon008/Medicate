// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_market_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMarketProductResponseModel _$ListMarketProductResponseModelFromJson(
  Map<String, dynamic> json,
) => ListMarketProductResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListMarketProductResponseModelToJson(
  ListMarketProductResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
