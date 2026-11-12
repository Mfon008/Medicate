import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_wholesale_order_response_model/fulfillments/fulfillments.dart';

import '../status_counts.dart';
import 'delivery_breakdown.dart';
import 'item.dart';

part 'deliveries.g.dart';

@JsonSerializable()
class Deliveries {
  String? deliveryAddressId;
  String? deliveryAddress;
  String? country;
  String? state;
  String? lga;
  String? stateCode;
  String? lgaCode;
  String? recipientName;
  String? contactPhone;
  String? recipientIdType;
  String? orderNotes;
  List<Item>? items;
  double? subtotal;
  int? deliveryFee;
  double? total;
  String? deliveryId;
  int? deliveryNumber;
  String? status;
  String? statusLabel;
  StatusCounts? statusCounts;
  List<Fulfillments>? fulfillments;
  dynamic timeline;
  dynamic fulfillmentTimeline;
  DateTime? estimatedDeliveryDate;
  List<DeliveryBreakdown>? deliveryBreakdown;

  Deliveries({
    this.deliveryAddressId,
    this.deliveryAddress,
    this.country,
    this.state,
    this.lga,
    this.stateCode,
    this.lgaCode,
    this.recipientName,
    this.contactPhone,
    this.recipientIdType,
    this.orderNotes,
    this.items,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.deliveryBreakdown,
    this.estimatedDeliveryDate,
    this.deliveryId,
    this.deliveryNumber,
    this.status,
    this.statusCounts,
    this.statusLabel,
    this.fulfillments,
    this.timeline,
    this.fulfillmentTimeline,
  });

  factory Deliveries.fromJson(Map<String, dynamic> json) {
    return _$DeliveriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveriesToJson(this);
}
