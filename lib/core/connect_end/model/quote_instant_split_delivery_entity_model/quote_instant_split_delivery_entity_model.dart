import 'delivery.dart';

class QuoteInstantSplitDeliveryEntityModel {
  String? deliveryMethod;
  bool? splitOrder;
  List<Delivery>? deliveries;

  QuoteInstantSplitDeliveryEntityModel({
    this.deliveryMethod,
    this.splitOrder,
    this.deliveries,
  });

  factory QuoteInstantSplitDeliveryEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuoteInstantSplitDeliveryEntityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      splitOrder: json['splitOrder'] as bool?,
      deliveries: (json['deliveries'] as List<dynamic>?)
          ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'splitOrder': splitOrder,
    'deliveries': deliveries?.map((e) => e.toJson()).toList(),
  };
}
