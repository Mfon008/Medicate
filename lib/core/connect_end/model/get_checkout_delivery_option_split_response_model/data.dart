import 'package:json_annotation/json_annotation.dart';

import 'delivery.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  bool? splitOrder;
  bool? available;
  List<Delivery>? deliveries;

  Data({this.splitOrder, this.available, this.deliveries});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
