import 'package:json_annotation/json_annotation.dart';

import 'delivery.dart';

part 'place_order_wallet_split_entity_model.g.dart';

@JsonSerializable()
class PlaceOrderWalletSplitEntityModel {
  String? deliveryMethod;
  String? paymentMethod;
  bool? splitOrder;
  double? expectedSubtotal;
  int? expectedDeliveryFee;
  double? expectedTotal;
  String? deliveryDate;
  List<Delivery>? deliveries;

  PlaceOrderWalletSplitEntityModel({
    this.deliveryMethod,
    this.paymentMethod,
    this.splitOrder,
    this.expectedSubtotal,
    this.expectedDeliveryFee,
    this.expectedTotal,
    this.deliveryDate,
    this.deliveries,
  });

  factory PlaceOrderWalletSplitEntityModel.fromJson(Map<String, dynamic> json) {
    return _$PlaceOrderWalletSplitEntityModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaceOrderWalletSplitEntityModelToJson(this);
  }
}
