import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'meta.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Category>? categories;
  Meta? meta;

  Data({this.categories, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
