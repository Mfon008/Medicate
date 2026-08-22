import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  String? id;
  String? buyerTenantId;
  List<Item>? items;
  int? itemCount;
  int? totalQuantity;
  double? subtotal;
  String? currency;

  Cart({
    this.id,
    this.buyerTenantId,
    this.items,
    this.itemCount,
    this.totalQuantity,
    this.subtotal,
    this.currency,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
