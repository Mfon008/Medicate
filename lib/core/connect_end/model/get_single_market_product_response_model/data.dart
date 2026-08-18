import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Product? product;

  Data({this.product});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
