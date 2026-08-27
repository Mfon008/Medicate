import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';
import 'order.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Order>? orders;
  Meta? meta;

  Data({this.orders, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
