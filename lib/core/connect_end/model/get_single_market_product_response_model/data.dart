import 'package:json_annotation/json_annotation.dart';

import 'product.dart';
import 'similar_products.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Product? product;
  List<SimilarProducts>? similarProducts;

  Data({this.product, this.similarProducts});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
