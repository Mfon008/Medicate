// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_application_document_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadApplicationDocumentResponseModel
_$UploadApplicationDocumentResponseModelFromJson(Map<String, dynamic> json) =>
    UploadApplicationDocumentResponseModel(
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadApplicationDocumentResponseModelToJson(
  UploadApplicationDocumentResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
