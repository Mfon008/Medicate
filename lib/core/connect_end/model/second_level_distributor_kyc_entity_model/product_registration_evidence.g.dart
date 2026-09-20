// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_registration_evidence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRegistrationEvidence _$ProductRegistrationEvidenceFromJson(
  Map<String, dynamic> json,
) => ProductRegistrationEvidence(
  url: json['url'] as String?,
  mimeType: json['mimeType'] as String?,
  size: (json['size'] as num?)?.toInt(),
  format: json['format'] as String?,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductRegistrationEvidenceToJson(
  ProductRegistrationEvidence instance,
) => <String, dynamic>{
  'url': instance.url,
  'mimeType': instance.mimeType,
  'size': instance.size,
  'format': instance.format,
  'width': instance.width,
  'height': instance.height,
};
