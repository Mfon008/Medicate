// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breakdown _$BreakdownFromJson(Map<String, dynamic> json) => Breakdown(
  channel: json['channel'] as String?,
  unitPrice: (json['unitPrice'] as num?)?.toInt(),
  units: (json['units'] as num?)?.toInt(),
  amount: (json['amount'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  isPaid: json['isPaid'] as bool?,
);

Map<String, dynamic> _$BreakdownToJson(Breakdown instance) => <String, dynamic>{
  'channel': instance.channel,
  'unitPrice': instance.unitPrice,
  'units': instance.units,
  'amount': instance.amount,
  'currency': instance.currency,
  'isPaid': instance.isPaid,
};
