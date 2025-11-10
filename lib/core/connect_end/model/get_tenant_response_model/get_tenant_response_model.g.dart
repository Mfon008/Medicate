// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tenant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTenantResponseModel _$GetTenantResponseModelFromJson(
  Map<String, dynamic> json,
) => GetTenantResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetTenantResponseModelToJson(
  GetTenantResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
