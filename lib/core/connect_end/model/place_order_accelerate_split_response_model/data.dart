import 'package:json_annotation/json_annotation.dart';

import 'order.dart';
import 'payment.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Order? order;
  Payment? payment;

  Data({this.order, this.payment});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
