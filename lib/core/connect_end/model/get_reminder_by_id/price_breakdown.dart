import 'package:json_annotation/json_annotation.dart';

part 'price_breakdown.g.dart';

@JsonSerializable()
class PriceBreakdown {
  String? channel;
  int? unitPrice;
  int? units;
  int? amount;
  String? currency;
  bool? isPaid;

  PriceBreakdown({
    this.channel,
    this.unitPrice,
    this.units,
    this.amount,
    this.currency,
    this.isPaid,
  });

  factory PriceBreakdown.fromJson(Map<String, dynamic> json) {
    return _$PriceBreakdownFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PriceBreakdownToJson(this);
}
