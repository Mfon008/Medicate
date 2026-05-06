// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
  id: json['id'] as String?,
  hmoId: json['hmoId'] as String?,
  planName: json['planName'] as String?,
  planType: json['planType'] as String?,
  planTier: json['planTier'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  hospitalNetworkIds: (json['hospitalNetworkIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  benefits: (json['benefits'] as List<dynamic>?)
      ?.map((e) => Benefit.fromJson(e as Map<String, dynamic>))
      .toList(),
  isActive: json['isActive'] as bool?,
  hospitalNetwork: (json['hospitalNetwork'] as List<dynamic>?)
      ?.map((e) => HospitalNetwork.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
  'id': instance.id,
  'hmoId': instance.hmoId,
  'planName': instance.planName,
  'planType': instance.planType,
  'planTier': instance.planTier,
  'description': instance.description,
  'price': instance.price,
  'duration': instance.duration,
  'hospitalNetworkIds': instance.hospitalNetworkIds,
  'benefits': instance.benefits,
  'isActive': instance.isActive,
  'hospitalNetwork': instance.hospitalNetwork,
};
