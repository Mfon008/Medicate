// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_roles_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRolesResponseModel _$GetRolesResponseModelFromJson(
  Map<String, dynamic> json,
) => GetRolesResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetRolesResponseModelToJson(
  GetRolesResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
