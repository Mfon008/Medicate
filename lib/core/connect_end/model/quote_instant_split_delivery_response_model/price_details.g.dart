// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceDetails _$PriceDetailsFromJson(Map<String, dynamic> json) => PriceDetails(
  currency: json['currency'] as String?,
  basePricePerUnit: (json['basePricePerUnit'] as num?)?.toInt(),
  marginPercentage: (json['marginPercentage'] as num?)?.toInt(),
  marginAmountPerUnit: (json['marginAmountPerUnit'] as num?)?.toInt(),
  enlistedPricePerUnit: (json['enlistedPricePerUnit'] as num?)?.toInt(),
  displayPricePerUnit: (json['displayPricePerUnit'] as num?)?.toInt(),
);

Map<String, dynamic> _$PriceDetailsToJson(PriceDetails instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'basePricePerUnit': instance.basePricePerUnit,
      'marginPercentage': instance.marginPercentage,
      'marginAmountPerUnit': instance.marginAmountPerUnit,
      'enlistedPricePerUnit': instance.enlistedPricePerUnit,
      'displayPricePerUnit': instance.displayPricePerUnit,
    };
