// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nafdac_permit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NafdacPermit _$NafdacPermitFromJson(Map<String, dynamic> json) => NafdacPermit(
  url: json['url'] as String?,
  mimeType: json['mimeType'] as String?,
  size: (json['size'] as num?)?.toInt(),
  format: json['format'] as String?,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
);

Map<String, dynamic> _$NafdacPermitToJson(NafdacPermit instance) =>
    <String, dynamic>{
      'url': instance.url,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'format': instance.format,
      'width': instance.width,
      'height': instance.height,
    };
