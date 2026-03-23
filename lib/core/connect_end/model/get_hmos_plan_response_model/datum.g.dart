// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: json['id'] as String?,
  planName: json['planName'] as String?,
  planTier: json['planTier'] as String?,
  planType: json['planType'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  benefitsSnippet: (json['benefitsSnippet'] as List<dynamic>?)
      ?.map((e) => BenefitsSnippet.fromJson(e as Map<String, dynamic>))
      .toList(),
  hospitalCount: (json['hospitalCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'planName': instance.planName,
  'planTier': instance.planTier,
  'planType': instance.planType,
  'description': instance.description,
  'price': instance.price,
  'duration': instance.duration,
  'benefitsSnippet': instance.benefitsSnippet,
  'hospitalCount': instance.hospitalCount,
};
