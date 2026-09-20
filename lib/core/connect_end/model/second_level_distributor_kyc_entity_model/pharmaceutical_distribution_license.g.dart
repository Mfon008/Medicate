// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmaceutical_distribution_license.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmaceuticalDistributionLicense _$PharmaceuticalDistributionLicenseFromJson(
  Map<String, dynamic> json,
) => PharmaceuticalDistributionLicense(
  url: json['url'] as String?,
  mimeType: json['mimeType'] as String?,
  size: (json['size'] as num?)?.toInt(),
  format: json['format'] as String?,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
);

Map<String, dynamic> _$PharmaceuticalDistributionLicenseToJson(
  PharmaceuticalDistributionLicense instance,
) => <String, dynamic>{
  'url': instance.url,
  'mimeType': instance.mimeType,
  'size': instance.size,
  'format': instance.format,
  'width': instance.width,
  'height': instance.height,
};
