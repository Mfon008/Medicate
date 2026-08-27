// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wholesale_order_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WholesaleOrderListResponseModel _$WholesaleOrderListResponseModelFromJson(
  Map<String, dynamic> json,
) => WholesaleOrderListResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WholesaleOrderListResponseModelToJson(
  WholesaleOrderListResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
