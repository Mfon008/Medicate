import 'package:json_annotation/json_annotation.dart';

part 'channel_price_snapshot.g.dart';

@JsonSerializable()
class ChannelPriceSnapshot {
  String? channel;
  int? unitPrice;
  String? currency;
  DateTime? capturedAt;

  ChannelPriceSnapshot({
    this.channel,
    this.unitPrice,
    this.currency,
    this.capturedAt,
  });

  factory ChannelPriceSnapshot.fromJson(Map<String, dynamic> json) {
    return _$ChannelPriceSnapshotFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChannelPriceSnapshotToJson(this);
}
