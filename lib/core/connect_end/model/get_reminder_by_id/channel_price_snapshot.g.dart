// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_price_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelPriceSnapshot _$ChannelPriceSnapshotFromJson(
  Map<String, dynamic> json,
) => ChannelPriceSnapshot(
  channel: json['channel'] as String?,
  unitPrice: (json['unitPrice'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  capturedAt: json['capturedAt'] == null
      ? null
      : DateTime.parse(json['capturedAt'] as String),
);

Map<String, dynamic> _$ChannelPriceSnapshotToJson(
  ChannelPriceSnapshot instance,
) => <String, dynamic>{
  'channel': instance.channel,
  'unitPrice': instance.unitPrice,
  'currency': instance.currency,
  'capturedAt': instance.capturedAt?.toIso8601String(),
};
