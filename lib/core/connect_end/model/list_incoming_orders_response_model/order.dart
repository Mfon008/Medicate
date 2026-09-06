import 'package:json_annotation/json_annotation.dart';

import 'actions.dart';
import 'customer.dart';
import 'status_counts.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  String? orderNumber;
  Customer? customer;
  String? customerName;
  int? itemsOrdered;
  int? orderTotal;
  String? currency;
  DateTime? dateOrdered;
  String? paymentStatus;
  String? paymentStatusLabel;
  String? status;
  String? statusLabel;
  String? badgeText;
  StatusCounts? statusCounts;
  Actions? actions;

  Order({
    this.id,
    this.orderNumber,
    this.customer,
    this.customerName,
    this.itemsOrdered,
    this.orderTotal,
    this.currency,
    this.dateOrdered,
    this.paymentStatus,
    this.paymentStatusLabel,
    this.status,
    this.statusLabel,
    this.badgeText,
    this.statusCounts,
    this.actions,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
