// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_hospitals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfHospitals _$ListOfHospitalsFromJson(Map<String, dynamic> json) =>
    ListOfHospitals(
      url: json['url'] as String?,
      mimeType: json['mimeType'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      format: json['format'] as String?,
    );

Map<String, dynamic> _$ListOfHospitalsToJson(ListOfHospitals instance) =>
    <String, dynamic>{
      'url': instance.url,
      'mimeType': instance.mimeType,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'format': instance.format,
    };
