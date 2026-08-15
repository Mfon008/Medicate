// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_product_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductListResponseModel _$GetAllProductListResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAllProductListResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllProductListResponseModelToJson(
  GetAllProductListResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
