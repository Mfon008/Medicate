// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_logo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyLogo _$CompanyLogoFromJson(Map<String, dynamic> json) => CompanyLogo(
  url: json['url'] as String?,
  mimeType: json['mimeType'] as String?,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  format: json['format'] as String?,
);

Map<String, dynamic> _$CompanyLogoToJson(CompanyLogo instance) =>
    <String, dynamic>{
      'url': instance.url,
      'mimeType': instance.mimeType,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'format': instance.format,
    };
