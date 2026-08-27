import 'package:json_annotation/json_annotation.dart';

import 'logistics_partner.dart';

part 'delivery_breakdown.g.dart';

@JsonSerializable()
class DeliveryBreakdown {
  List<String>? productIds;
  List<String>? distributorIds;
  List<String>? distributorNames;
  double? orderSubtotal;
  String? locationId;
  String? stateCode;
  String? stateName;
  String? lgaCode;
  String? lgaName;
  String? deliveryMethod;
  int? deliveryFee;
  int? estimatedDeliveryMinutes;
  LogisticsPartner? logisticsPartner;
  String? deliveryConditions;

  DeliveryBreakdown({
    this.productIds,
    this.distributorIds,
    this.distributorNames,
    this.orderSubtotal,
    this.locationId,
    this.stateCode,
    this.stateName,
    this.lgaCode,
    this.lgaName,
    this.deliveryMethod,
    this.deliveryFee,
    this.estimatedDeliveryMinutes,
    this.logisticsPartner,
    this.deliveryConditions,
  });

  factory DeliveryBreakdown.fromJson(Map<String, dynamic> json) {
    return _$DeliveryBreakdownFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryBreakdownToJson(this);
}
