// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_application_rsponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartApplicationRsponseModel _$StartApplicationRsponseModelFromJson(
  Map<String, dynamic> json,
) => StartApplicationRsponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StartApplicationRsponseModelToJson(
  StartApplicationRsponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
