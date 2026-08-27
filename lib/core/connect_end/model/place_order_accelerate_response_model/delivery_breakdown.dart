import 'package:json_annotation/json_annotation.dart';

part 'delivery_breakdown.g.dart';

@JsonSerializable()
class DeliveryBreakdown {
  List<dynamic>? productIds;
  List<String>? distributorIds;
  List<String>? distributorNames;
  int? orderSubtotal;
  String? locationId;
  String? deliveryMethod;
  int? deliveryFee;

  DeliveryBreakdown({
    this.productIds,
    this.distributorIds,
    this.distributorNames,
    this.orderSubtotal,
    this.locationId,
    this.deliveryMethod,
    this.deliveryFee,
  });

  factory DeliveryBreakdown.fromJson(Map<String, dynamic> json) {
    return _$DeliveryBreakdownFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryBreakdownToJson(this);
}
