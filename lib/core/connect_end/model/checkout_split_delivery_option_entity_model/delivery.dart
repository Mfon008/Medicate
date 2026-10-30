import 'item.dart';

class Delivery {
  String? deliveryAddressId;
  List<Item>? items;

  Delivery({this.deliveryAddressId, this.items});

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
    deliveryAddressId: json['deliveryAddressId'] as String?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'deliveryAddressId': deliveryAddressId,
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
