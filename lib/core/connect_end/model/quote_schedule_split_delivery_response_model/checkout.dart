import 'package:json_annotation/json_annotation.dart';

import 'delivery.dart';
import 'item.dart';
import 'selected_window.dart';

part 'checkout.g.dart';

@JsonSerializable()
class Checkout {
  List<Item>? items;
  int? itemCount;
  int? totalQuantity;
  double? subtotal;
  int? deliveryFee;
  double? total;
  String? currency;
  String? deliveryMethod;
  SelectedWindow? selectedWindow;
  bool? splitOrder;
  List<Delivery>? deliveries;

  Checkout({
    this.items,
    this.itemCount,
    this.totalQuantity,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.currency,
    this.deliveryMethod,
    this.selectedWindow,
    this.splitOrder,
    this.deliveries,
  });

  factory Checkout.fromJson(Map<String, dynamic> json) {
    return _$CheckoutFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckoutToJson(this);
}
