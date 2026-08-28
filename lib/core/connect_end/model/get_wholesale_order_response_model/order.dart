import 'package:json_annotation/json_annotation.dart';

import 'delivery_breakdown.dart';
import 'delivery_details.dart';
import 'item.dart';
import 'payment.dart';
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
  String? deliveryMethod;
  String? deliveryMethodLabel;
  dynamic deliveryDate;
  String? timeWindow;
  String? timeWindowLabel;
  DeliveryDetails? deliveryDetails;
  String? orderNotes;
  List<Item>? items;
  double? subtotal;
  int? deliveryFee;
  List<DeliveryBreakdown>? deliveryBreakdown;
  double? total;
  String? currency;
  Payment? payment;

  Order({
    this.id,
    this.orderNumber,
    this.placedAt,
    this.status,
    this.statusLabel,
    this.badgeText,
    this.statusCounts,
    this.distributorCount,
    this.deliveryMethod,
    this.deliveryMethodLabel,
    this.deliveryDate,
    this.timeWindow,
    this.timeWindowLabel,
    this.deliveryDetails,
    this.orderNotes,
    this.items,
    this.subtotal,
    this.deliveryFee,
    this.deliveryBreakdown,
    this.total,
    this.currency,
    this.payment,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
