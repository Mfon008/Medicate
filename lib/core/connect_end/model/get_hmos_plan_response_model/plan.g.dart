// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
  id: json['id'] as String?,
  planName: json['planName'] as String?,
  planTier: json['planTier'] as String?,
  planTierDetails: json['planTierDetails'] == null
      ? null
      : PlanTierDetails.fromJson(
          json['planTierDetails'] as Map<String, dynamic>,
        ),
  planType: json['planType'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toInt(),
  renewalPrice: (json['renewalPrice'] as num?)?.toInt(),
  displayPrice: (json['displayPrice'] as num?)?.toDouble(),
  renewalDisplayPrice: (json['renewalDisplayPrice'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  benefitsSnippet: (json['benefitsSnippet'] as List<dynamic>?)
      ?.map((e) => BenefitsSnippet.fromJson(e as Map<String, dynamic>))
      .toList(),
  hospitalCount: (json['hospitalCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
  'id': instance.id,
  'planName': instance.planName,
  'planTier': instance.planTier,
  'planTierDetails': instance.planTierDetails,
  'planType': instance.planType,
  'description': instance.description,
  'price': instance.price,
  'renewalPrice': instance.renewalPrice,
  'displayPrice': instance.displayPrice,
  'renewalDisplayPrice': instance.renewalDisplayPrice,
  'duration': instance.duration,
  'benefitsSnippet': instance.benefitsSnippet,
  'hospitalCount': instance.hospitalCount,
};
