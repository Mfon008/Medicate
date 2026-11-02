import 'package:json_annotation/json_annotation.dart';

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
  });

  factory Deliveries.fromJson(Map<String, dynamic> json) {
    return _$DeliveriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveriesToJson(this);
}
