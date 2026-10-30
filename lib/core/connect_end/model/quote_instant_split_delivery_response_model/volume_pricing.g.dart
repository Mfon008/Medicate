// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumePricing _$VolumePricingFromJson(Map<String, dynamic> json) =>
    VolumePricing(
      quantity: (json['quantity'] as num?)?.toInt(),
      pricePerUnit: (json['pricePerUnit'] as num?)?.toInt(),
      enlistedPricePerUnit: (json['enlistedPricePerUnit'] as num?)?.toInt(),
      platformMarginPercentage: (json['platformMarginPercentage'] as num?)
          ?.toInt(),
    );

Map<String, dynamic> _$VolumePricingToJson(VolumePricing instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'pricePerUnit': instance.pricePerUnit,
      'enlistedPricePerUnit': instance.enlistedPricePerUnit,
      'platformMarginPercentage': instance.platformMarginPercentage,
    };
