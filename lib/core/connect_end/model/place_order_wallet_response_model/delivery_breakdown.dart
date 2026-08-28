import 'package:json_annotation/json_annotation.dart';

import 'logistics_partner.dart';
import 'time_block.dart';

part 'delivery_breakdown.g.dart';

@JsonSerializable()
class DeliveryBreakdown {
  List<String>? productIds;
  List<String>? distributorIds;
  List<String>? distributorNames;
  int? orderSubtotal;
  String? locationId;
  String? stateCode;
  String? stateName;
  String? lgaCode;
  String? lgaName;
  String? deliveryMethod;
  int? deliveryFee;
  DateTime? deliveryDate;
  TimeBlock? timeBlock;
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
    this.deliveryDate,
    this.timeBlock,
    this.logisticsPartner,
    this.deliveryConditions,
  });

  factory DeliveryBreakdown.fromJson(Map<String, dynamic> json) {
    return _$DeliveryBreakdownFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryBreakdownToJson(this);
}
