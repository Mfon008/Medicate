import 'package:json_annotation/json_annotation.dart';

import 'actions.dart';
import 'fulfillment_timeline.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? orderItemId;
  String? productId;
  String? productName;
  String? sku;
  String? imageUrl;
  int? quantity;
  int? unitPrice;
  int? lineTotal;
  int? minimumOrderQuantity;
  int? packSize;
  String? unit;
  String? fulfillmentStatus;
  String? fulfillmentStatusLabel;
  List<FulfillmentTimeline>? fulfillmentTimeline;
  Actions? actions;

  Item({
    this.orderItemId,
    this.productId,
    this.productName,
    this.sku,
    this.imageUrl,
    this.quantity,
    this.unitPrice,
    this.lineTotal,
    this.minimumOrderQuantity,
    this.packSize,
    this.unit,
    this.fulfillmentStatus,
    this.fulfillmentStatusLabel,
    this.fulfillmentTimeline,
    this.actions,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
