// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_tier_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanTierDetails _$PlanTierDetailsFromJson(Map<String, dynamic> json) =>
    PlanTierDetails(
      name: json['name'] as String?,
      primaryColor: json['primaryColor'] as String?,
      secondaryColor: json['secondaryColor'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PlanTierDetailsToJson(PlanTierDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'primaryColor': instance.primaryColor,
      'secondaryColor': instance.secondaryColor,
      'features': instance.features,
    };
