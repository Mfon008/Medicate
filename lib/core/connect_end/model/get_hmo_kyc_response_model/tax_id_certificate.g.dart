// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_id_certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxIdCertificate _$TaxIdCertificateFromJson(Map<String, dynamic> json) =>
    TaxIdCertificate(
      url: json['url'] as String?,
      mimeType: json['mimeType'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      format: json['format'] as String?,
    );

Map<String, dynamic> _$TaxIdCertificateToJson(TaxIdCertificate instance) =>
    <String, dynamic>{
      'url': instance.url,
      'mimeType': instance.mimeType,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'format': instance.format,
    };
