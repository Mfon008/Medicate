import 'delivery.dart';

class QuoteScheduleSplitDeliveryEntityModel {
  String? deliveryMethod;
  String? deliveryDate;
  String? timeBlockStart;
  String? timeBlockEnd;
  bool? splitOrder;
  List<Delivery>? deliveries;

  QuoteScheduleSplitDeliveryEntityModel({
    this.deliveryMethod,
    this.deliveryDate,
    this.timeBlockStart,
    this.timeBlockEnd,
    this.splitOrder,
    this.deliveries,
  });

  factory QuoteScheduleSplitDeliveryEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return QuoteScheduleSplitDeliveryEntityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryDate: json['deliveryDate'] as String?,
      timeBlockStart: json['timeBlockStart'] as String?,
      timeBlockEnd: json['timeBlockEnd'] as String?,
      splitOrder: json['splitOrder'] as bool?,
      deliveries: (json['deliveries'] as List<dynamic>?)
          ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'deliveryDate': deliveryDate,
    'timeBlockStart': timeBlockStart,
    'timeBlockEnd': timeBlockEnd,
    'splitOrder': splitOrder,
    'deliveries': deliveries?.map((e) => e.toJson()).toList(),
  };
}
