import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';
import 'product.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Product>? products;
  Meta? meta;

  Data({this.products, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
