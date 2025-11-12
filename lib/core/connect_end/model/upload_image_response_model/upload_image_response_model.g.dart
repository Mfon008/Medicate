// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponseModel _$UploadImageResponseModelFromJson(
  Map<String, dynamic> json,
) => UploadImageResponseModel(
  success: json['success'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UploadImageResponseModelToJson(
  UploadImageResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
