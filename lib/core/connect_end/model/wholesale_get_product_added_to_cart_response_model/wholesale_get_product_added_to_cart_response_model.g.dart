// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wholesale_get_product_added_to_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WholesaleGetProductAddedToCartResponseModel
_$WholesaleGetProductAddedToCartResponseModelFromJson(
  Map<String, dynamic> json,
) => WholesaleGetProductAddedToCartResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WholesaleGetProductAddedToCartResponseModelToJson(
  WholesaleGetProductAddedToCartResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
