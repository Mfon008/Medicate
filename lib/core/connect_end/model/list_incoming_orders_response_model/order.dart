import 'package:json_annotation/json_annotation.dart';

import 'actions.dart';
import 'customer.dart';
import 'delivery.dart';
import 'fulfillment_timeline.dart';
import 'item.dart';
import 'status_counts.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  String? fulfillmentGroupId;
  int? revision;
  String? orderNumber;
  Customer? customer;
  String? customerName;
  DateTime? placedAt;
  DateTime? dateOrdered;
  String? currency;
  String? paymentStatus;
  String? paymentStatusLabel;
  String? status;
  String? statusLabel;
  String? badgeText;
  StatusCounts? statusCounts;
  int? itemsOrdered;
  int? itemCount;
  int? orderTotal;
  int? subtotal;
  List<Item>? items;
  bool? splitOrder;
  int? deliveryCount;
  List<Delivery>? deliveries;
  List<FulfillmentTimeline>? fulfillmentTimeline;
  String? orderNotes;
  String? latestStatusComment;
  bool? inventoryReviewRequired;
  Actions? actions;

  Order({
    this.id,
    this.fulfillmentGroupId,
    this.revision,
    this.orderNumber,
    this.customer,
    this.customerName,
    this.placedAt,
    this.dateOrdered,
    this.currency,
    this.paymentStatus,
    this.paymentStatusLabel,
    this.status,
    this.statusLabel,
    this.badgeText,
    this.statusCounts,
    this.itemsOrdered,
    this.itemCount,
    this.orderTotal,
    this.subtotal,
    this.items,
    this.splitOrder,
    this.deliveryCount,
    this.deliveries,
    this.fulfillmentTimeline,
    this.orderNotes,
    this.latestStatusComment,
    this.inventoryReviewRequired,
    this.actions,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
