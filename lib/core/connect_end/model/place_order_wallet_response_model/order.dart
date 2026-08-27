import 'package:json_annotation/json_annotation.dart';

import 'delivery_breakdown.dart';
import 'delivery_details.dart';
import 'distributor_fulfillment.dart';
import 'item.dart';
import 'payment.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  String? id;
  String? orderNumber;
  String? buyerTenantId;
  String? buyerUserId;
  String? buyerTenantName;
  String? status;
  List<Item>? items;
  List<DistributorFulfillment>? distributorFulfillments;
  String? deliveryMethod;
  DateTime? deliveryDate;
  String? timeWindowLabel;
  DeliveryDetails? deliveryDetails;
  List<DeliveryBreakdown>? deliveryBreakdown;
  double? subtotal;
  int? deliveryFee;
  double? total;
  String? currency;
  Payment? payment;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? cartClearedAt;

  Order({
    this.id,
    this.orderNumber,
    this.buyerTenantId,
    this.buyerUserId,
    this.buyerTenantName,
    this.status,
    this.items,
    this.distributorFulfillments,
    this.deliveryMethod,
    this.deliveryDate,
    this.timeWindowLabel,
    this.deliveryDetails,
    this.deliveryBreakdown,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.currency,
    this.payment,
    this.createdAt,
    this.updatedAt,
    this.cartClearedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
