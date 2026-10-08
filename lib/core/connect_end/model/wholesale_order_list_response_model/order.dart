import 'package:json_annotation/json_annotation.dart';

import 'delivery_breakdown.dart';
import 'status_counts.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  String? orderNumber;
  DateTime? placedAt;
  String? status;
  String? statusLabel;
  String? badgeText;
  StatusCounts? statusCounts;
  int? distributorCount;
  double? total;
  double? subtotal;
  int? deliveryFee;
  List<DeliveryBreakdown>? deliveryBreakdown;
  String? currency;
  String? deliveryMethod;
  String? deliveryMethodLabel;
  int? itemCount;

  Order({
    this.id,
    this.orderNumber,
    this.placedAt,
    this.status,
    this.statusLabel,
    this.badgeText,
    this.statusCounts,
    this.distributorCount,
    this.total,
    this.subtotal,
    this.deliveryFee,
    this.deliveryBreakdown,
    this.currency,
    this.deliveryMethod,
    this.deliveryMethodLabel,
    this.itemCount,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
