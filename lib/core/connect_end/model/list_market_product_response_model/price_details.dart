import 'package:json_annotation/json_annotation.dart';

part 'price_details.g.dart';

@JsonSerializable()
class PriceDetails {
  String? currency;
  int? basePricePerUnit;
  int? marginPercentage;
  int? marginAmountPerUnit;
  int? enlistedPricePerUnit;
  int? displayPricePerUnit;

  PriceDetails({
    this.currency,
    this.basePricePerUnit,
    this.marginPercentage,
    this.marginAmountPerUnit,
    this.enlistedPricePerUnit,
    this.displayPricePerUnit,
  });

  factory PriceDetails.fromJson(Map<String, dynamic> json) {
    return _$PriceDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PriceDetailsToJson(this);
}
