// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cac_certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacCertificate _$CacCertificateFromJson(Map<String, dynamic> json) =>
    CacCertificate(
      url: json['url'] as String?,
      mimeType: json['mimeType'] as String?,
      size: (json['size'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      format: json['format'] as String?,
    );

Map<String, dynamic> _$CacCertificateToJson(CacCertificate instance) =>
    <String, dynamic>{
      'url': instance.url,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'width': instance.width,
      'height': instance.height,
      'format': instance.format,
    };
