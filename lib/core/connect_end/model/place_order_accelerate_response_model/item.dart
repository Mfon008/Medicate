import 'package:json_annotation/json_annotation.dart';

import 'tracking.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? orderItemId;
  String? productId;
  String? productName;
  String? manufacturerName;
  String? manufacturerDistributorId;
  String? manufacturerDistributorName;
  String? assignedDistributorId;
  String? assignedDistributorName;
  String? fulfillmentGroupId;
  List<dynamic>? statusComments;
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
    this.orderItemId,
    this.productId,
    this.productName,
    this.manufacturerName,
    this.manufacturerDistributorId,
    this.manufacturerDistributorName,
    this.assignedDistributorId,
    this.assignedDistributorName,
    this.fulfillmentGroupId,
    this.statusComments,
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
