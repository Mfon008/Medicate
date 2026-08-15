// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleProductResponseModel _$GetSingleProductResponseModelFromJson(
  Map<String, dynamic> json,
) => GetSingleProductResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetSingleProductResponseModelToJson(
  GetSingleProductResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
