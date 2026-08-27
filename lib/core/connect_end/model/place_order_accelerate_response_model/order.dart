import 'package:json_annotation/json_annotation.dart';

import 'delivery_breakdown.dart';
import 'delivery_details.dart';
import 'item.dart';
import 'payment.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  String? orderNumber;
  String? buyerTenantId;
  String? buyerUserId;
  String? status;
  List<Item>? items;
  String? deliveryMethod;
  DateTime? deliveryDate;
  String? timeWindow;
  String? timeWindowLabel;
  DeliveryDetails? deliveryDetails;
  int? subtotal;
  int? deliveryFee;
  int? total;
  String? currency;
  Payment? payment;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<DeliveryBreakdown>? deliveryBreakdown;

  Order({
    this.id,
    this.orderNumber,
    this.buyerTenantId,
    this.buyerUserId,
    this.status,
    this.items,
    this.deliveryMethod,
    this.deliveryDate,
    this.timeWindow,
    this.timeWindowLabel,
    this.deliveryDetails,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.currency,
    this.payment,
    this.createdAt,
    this.updatedAt,
    this.deliveryBreakdown,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
