import 'package:json_annotation/json_annotation.dart';

import 'tracking.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? productId;
  String? productName;
  String? manufacturerDistributorId;
  String? manufacturerDistributorName;
  String? sku;
  String? imageUrl;
  int? quantity;
  double? unitPrice;
  double? lineTotal;
  int? minimumOrderQuantity;
  int? packSize;
  String? unit;
  DateTime? estimatedDeliveryDate;
  String? fulfillmentStatus;
  String? fulfillmentStatusLabel;
  List<Tracking>? tracking;

  Item({
    this.productId,
    this.productName,
    this.manufacturerDistributorId,
    this.manufacturerDistributorName,
    this.sku,
    this.imageUrl,
    this.quantity,
    this.unitPrice,
    this.lineTotal,
    this.minimumOrderQuantity,
    this.packSize,
    this.unit,
    this.estimatedDeliveryDate,
    this.fulfillmentStatus,
    this.fulfillmentStatusLabel,
    this.tracking,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
