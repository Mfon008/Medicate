// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_market_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleMarketProductResponseModel
_$GetSingleMarketProductResponseModelFromJson(Map<String, dynamic> json) =>
    GetSingleMarketProductResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleMarketProductResponseModelToJson(
  GetSingleMarketProductResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
