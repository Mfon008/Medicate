// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wholesale_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWholesaleOrderResponseModel _$GetWholesaleOrderResponseModelFromJson(
  Map<String, dynamic> json,
) => GetWholesaleOrderResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetWholesaleOrderResponseModelToJson(
  GetWholesaleOrderResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
