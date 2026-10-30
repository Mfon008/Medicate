import 'item.dart';

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

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
    deliveryAddressId: json['deliveryAddressId'] as String?,
    recipientName: json['recipientName'] as String?,
    recipientIdType: json['recipientIdType'] as String?,
    contactPhone: json['contactPhone'] as String?,
    orderNotes: json['orderNotes'] as String?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'deliveryAddressId': deliveryAddressId,
    'recipientName': recipientName,
    'recipientIdType': recipientIdType,
    'contactPhone': contactPhone,
    'orderNotes': orderNotes,
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
