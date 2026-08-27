// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_accelerate_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderAccelerateResponseModel _$PlaceOrderAccelerateResponseModelFromJson(
  Map<String, dynamic> json,
) => PlaceOrderAccelerateResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlaceOrderAccelerateResponseModelToJson(
  PlaceOrderAccelerateResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
