// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  uploadId: json['uploadId'] as String?,
  originalName: json['originalName'] as String?,
  url: json['url'] as String?,
  mimeType: json['mimeType'] as String?,
  size: (json['size'] as num?)?.toInt(),
  format: json['format'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'uploadId': instance.uploadId,
  'originalName': instance.originalName,
  'url': instance.url,
  'mimeType': instance.mimeType,
  'size': instance.size,
  'format': instance.format,
};
