import 'package:json_annotation/json_annotation.dart';

import 'actions.dart';
import 'current_allocation.dart';
import 'fulfillment_timeline.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? fulfillmentGroupId;
  String? nafdacRegistrationNumber;
  String? orderItemId;
  String? productId;
  String? manufacturerDistributorId;
  String? productName;
  String? manufacturerName;
  String? manufacturerDistributorName;
  String? categoryId;
  String? category;
  String? sku;
  String? imageUrl;
  int? quantity;
  int? unitPrice;
  int? lineTotal;
  int? minimumOrderQuantity;
  int? packSize;
  String? unit;
  String? fulfillmentStatus;
  List<FulfillmentTimeline>? fulfillmentTimeline;
  CurrentAllocation? currentAllocation;
  String? fulfillmentStatusLabel;
  Actions? actions;

  Item({
    this.fulfillmentGroupId,
    this.nafdacRegistrationNumber,
    this.orderItemId,
    this.productId,
    this.manufacturerDistributorId,
    this.productName,
    this.manufacturerName,
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
    this.fulfillmentStatus,
    this.fulfillmentTimeline,
    this.currentAllocation,
    this.fulfillmentStatusLabel,
    this.actions,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
