// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_created_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreatedUserResponseModel _$GetCreatedUserResponseModelFromJson(
  Map<String, dynamic> json,
) => GetCreatedUserResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetCreatedUserResponseModelToJson(
  GetCreatedUserResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
