import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? productId;
  String? productName;
  String? sku;
  String? unit;
  int? quantity;
  double? unitPrice;
  double? lineTotal;
  String? distributorId;
  String? distributorName;
  String? orderItemId;
  String? manufacturerName;
  int? minimumOrderQuantity;
  String? imageUrl;

  Item({
    this.productId,
    this.productName,
    this.sku,
    this.unit,
    this.quantity,
    this.unitPrice,
    this.lineTotal,
    this.distributorId,
    this.distributorName,
    this.orderItemId,
    this.imageUrl,
    this.manufacturerName,
    this.minimumOrderQuantity
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
