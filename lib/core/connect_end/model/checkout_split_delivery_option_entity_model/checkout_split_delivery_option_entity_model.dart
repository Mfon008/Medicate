import 'delivery.dart';

class CheckoutSplitDeliveryOptionEntityModel {
  bool? splitOrder;
  List<Delivery>? deliveries;

  CheckoutSplitDeliveryOptionEntityModel({this.splitOrder, this.deliveries});

  factory CheckoutSplitDeliveryOptionEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CheckoutSplitDeliveryOptionEntityModel(
      splitOrder: json['splitOrder'] as bool?,
      deliveries: (json['deliveries'] as List<dynamic>?)
          ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'splitOrder': splitOrder,
    'deliveries': deliveries?.map((e) => e.toJson()).toList(),
  };
}
