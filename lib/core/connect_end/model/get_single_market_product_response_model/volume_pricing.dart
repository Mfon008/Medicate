import 'package:json_annotation/json_annotation.dart';

part 'volume_pricing.g.dart';

@JsonSerializable()
class VolumePricing {
  int? quantity;
  int? pricePerUnit;
  int? enlistedPricePerUnit;
  int? platformMarginPercentage;

  VolumePricing({
    this.quantity,
    this.pricePerUnit,
    this.enlistedPricePerUnit,
    this.platformMarginPercentage,
  });

  factory VolumePricing.fromJson(Map<String, dynamic> json) {
    return _$VolumePricingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VolumePricingToJson(this);
}
