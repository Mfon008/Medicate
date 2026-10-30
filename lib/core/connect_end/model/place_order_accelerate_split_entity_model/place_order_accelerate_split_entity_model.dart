import 'delivery.dart';

class PlaceOrderAccelerateSplitEntityModel {
  String? deliveryMethod;
  String? paymentMethod;
  String? callbackUrl;
  bool? splitOrder;
  double? expectedSubtotal;
  int? expectedDeliveryFee;
  double? expectedTotal;
  String? deliveryDate;
  List<Delivery>? deliveries;

  PlaceOrderAccelerateSplitEntityModel({
    this.deliveryMethod,
    this.paymentMethod,
    this.callbackUrl,
    this.splitOrder,
    this.expectedSubtotal,
    this.expectedDeliveryFee,
    this.expectedTotal,
    this.deliveryDate,
    this.deliveries,
  });

  factory PlaceOrderAccelerateSplitEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PlaceOrderAccelerateSplitEntityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      callbackUrl: json['callbackUrl'] as String?,
      splitOrder: json['splitOrder'] as bool?,
      expectedSubtotal: (json['expectedSubtotal'] as num?)?.toDouble(),
      expectedDeliveryFee: json['expectedDeliveryFee'] as int?,
      expectedTotal: (json['expectedTotal'] as num?)?.toDouble(),
      deliveryDate: json['deliveryDate'] as String?,
      deliveries: (json['deliveries'] as List<dynamic>?)
          ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'paymentMethod': paymentMethod,
    'callbackUrl': callbackUrl,
    'splitOrder': splitOrder,
    'expectedSubtotal': expectedSubtotal,
    'expectedDeliveryFee': expectedDeliveryFee,
    'expectedTotal': expectedTotal,
    'deliveryDate': deliveryDate,
    'deliveries': deliveries?.map((e) => e.toJson()).toList(),
  };
}
