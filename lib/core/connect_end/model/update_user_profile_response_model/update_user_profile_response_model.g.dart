// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserProfileResponseModel _$UpdateUserProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => UpdateUserProfileResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateUserProfileResponseModelToJson(
  UpdateUserProfileResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
