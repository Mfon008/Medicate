import 'package:json_annotation/json_annotation.dart';

import 'actions.dart';
import 'customer.dart';
import 'item.dart';
import 'payment.dart';
import 'status_counts.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  String? orderNumber;
  DateTime? placedAt;
  Customer? customer;
  String? orderNotes;
  List<Item>? items;
  int? itemCount;
  int? subtotal;
  String? currency;
  String? paymentStatus;
  String? paymentStatusLabel;
  Payment? payment;
  String? status;
  String? statusLabel;
  String? badgeText;
  StatusCounts? statusCounts;
  Actions? actions;

  Order({
    this.id,
    this.orderNumber,
    this.placedAt,
    this.customer,
    this.orderNotes,
    this.items,
    this.itemCount,
    this.subtotal,
    this.currency,
    this.paymentStatus,
    this.paymentStatusLabel,
    this.payment,
    this.status,
    this.statusLabel,
    this.badgeText,
    this.statusCounts,
    this.actions,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
