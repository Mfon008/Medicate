// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nafdac_manufacturing_license.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NafdacManufacturingLicense _$NafdacManufacturingLicenseFromJson(
  Map<String, dynamic> json,
) => NafdacManufacturingLicense(
  url: json['url'] as String?,
  mimeType: json['mimeType'] as String?,
  size: (json['size'] as num?)?.toInt(),
  format: json['format'] as String?,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
);

Map<String, dynamic> _$NafdacManufacturingLicenseToJson(
  NafdacManufacturingLicense instance,
) => <String, dynamic>{
  'url': instance.url,
  'mimeType': instance.mimeType,
  'size': instance.size,
  'format': instance.format,
  'width': instance.width,
  'height': instance.height,
};
