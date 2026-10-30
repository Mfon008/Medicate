import 'package:json_annotation/json_annotation.dart';

import 'delivery_breakdown.dart';
import 'item.dart';
import 'time_block.dart';

part 'delivery.g.dart';

@JsonSerializable()
class Delivery {
  String? deliveryAddressId;
  String? deliveryAddress;
  String? country;
  String? state;
  String? lga;
  String? stateCode;
  String? lgaCode;
  List<Item>? items;
  double? subtotal;
  int? deliveryFee;
  double? total;
  List<DeliveryBreakdown>? deliveryBreakdown;
  DateTime? deliveryDate;
  TimeBlock? timeBlock;

  Delivery({
    this.deliveryAddressId,
    this.deliveryAddress,
    this.country,
    this.state,
    this.lga,
    this.stateCode,
    this.lgaCode,
    this.items,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.deliveryBreakdown,
    this.deliveryDate,
    this.timeBlock,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return _$DeliveryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);
}
