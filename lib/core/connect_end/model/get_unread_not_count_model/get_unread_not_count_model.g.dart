// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_unread_not_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUnreadNotCountModel _$GetUnreadNotCountModelFromJson(
  Map<String, dynamic> json,
) => GetUnreadNotCountModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUnreadNotCountModelToJson(
  GetUnreadNotCountModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
