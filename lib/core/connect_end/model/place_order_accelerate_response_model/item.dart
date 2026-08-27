import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? productId;
  String? productName;
  String? manufacturerDistributorName;
  String? category;
  String? sku;
  String? imageUrl;
  int? quantity;
  int? unitPrice;
  int? lineTotal;
  int? minimumOrderQuantity;
  int? packSize;
  String? unit;
  String? categoryId;

  Item({
    this.productId,
    this.productName,
    this.manufacturerDistributorName,
    this.category,
    this.sku,
    this.imageUrl,
    this.quantity,
    this.unitPrice,
    this.lineTotal,
    this.minimumOrderQuantity,
    this.packSize,
    this.unit,
    this.categoryId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
