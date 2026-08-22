import 'package:json_annotation/json_annotation.dart';

import 'cart.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Cart? cart;

  Data({this.cart});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
