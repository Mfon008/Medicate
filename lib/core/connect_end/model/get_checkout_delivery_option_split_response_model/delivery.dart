import 'package:json_annotation/json_annotation.dart';

import 'destination.dart';
import 'method.dart';

part 'delivery.g.dart';

@JsonSerializable()
class Delivery {
  String? deliveryAddressId;
  Destination? destination;
  bool? available;
  List<Method>? methods;
  List<String>? unavailableReasons;

  Delivery({
    this.deliveryAddressId,
    this.destination,
    this.available,
    this.methods,
    this.unavailableReasons,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return _$DeliveryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);
}
