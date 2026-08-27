import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? productId;
  String? manufacturerDistributorId;
  String? productName;
  String? manufacturerDistributorName;
  String? categoryId;
  String? category;
  String? sku;
  String? imageUrl;
  int? quantity;
  double? unitPrice;
  double? lineTotal;
  int? minimumOrderQuantity;
  int? packSize;
  String? unit;

  Item({
    this.productId,
    this.manufacturerDistributorId,
    this.productName,
    this.manufacturerDistributorName,
    this.categoryId,
    this.category,
    this.sku,
    this.imageUrl,
    this.quantity,
    this.unitPrice,
    this.lineTotal,
    this.minimumOrderQuantity,
    this.packSize,
    this.unit,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
