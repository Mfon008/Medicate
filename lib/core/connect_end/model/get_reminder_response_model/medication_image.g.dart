// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationImage _$MedicationImageFromJson(Map<String, dynamic> json) =>
    MedicationImage(
      url: json['url'] as String?,
      mimeType: json['mimeType'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      format: json['format'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$MedicationImageToJson(MedicationImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'mimeType': instance.mimeType,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'format': instance.format,
      '_id': instance.id,
    };
