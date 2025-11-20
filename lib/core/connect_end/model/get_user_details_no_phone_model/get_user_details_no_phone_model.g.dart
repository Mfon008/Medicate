// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_details_no_phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDetailsNoPhoneModel _$GetUserDetailsNoPhoneModelFromJson(
  Map<String, dynamic> json,
) => GetUserDetailsNoPhoneModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUserDetailsNoPhoneModelToJson(
  GetUserDetailsNoPhoneModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
