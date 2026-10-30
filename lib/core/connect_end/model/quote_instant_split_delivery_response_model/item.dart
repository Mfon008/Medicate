import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? productId;
  int? quantity;
  double? unitPrice;
  double? lineTotal;
  String? currency;
  Product? product;

  Item({
    this.productId,
    this.quantity,
    this.unitPrice,
    this.lineTotal,
    this.currency,
    this.product,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
