// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceBreakdown _$PriceBreakdownFromJson(Map<String, dynamic> json) =>
    PriceBreakdown(
      channel: json['channel'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toInt(),
      units: (json['units'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      isPaid: json['isPaid'] as bool?,
    );

Map<String, dynamic> _$PriceBreakdownToJson(PriceBreakdown instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'unitPrice': instance.unitPrice,
      'units': instance.units,
      'amount': instance.amount,
      'currency': instance.currency,
      'isPaid': instance.isPaid,
    };
