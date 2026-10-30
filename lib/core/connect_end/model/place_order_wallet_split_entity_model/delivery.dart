import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'delivery.g.dart';

@JsonSerializable()
class Delivery {
  String? deliveryAddressId;
  String? recipientName;
  String? recipientIdType;
  String? contactPhone;
  String? orderNotes;
  List<Item>? items;

  Delivery({
    this.deliveryAddressId,
    this.recipientName,
    this.recipientIdType,
    this.contactPhone,
    this.orderNotes,
    this.items,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return _$DeliveryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);
}
