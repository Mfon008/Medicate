import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String? orderItemId;
  String? productId;
  String? productName;
  String? fulfillmentStatus;
  bool? canAdvance;

  Item({
    this.orderItemId,
    this.productId,
    this.productName,
    this.fulfillmentStatus,
    this.canAdvance,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
