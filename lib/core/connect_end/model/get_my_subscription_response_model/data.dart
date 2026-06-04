import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'meta.dart';
import 'summary.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Item>? items;
  Summary? summary;
  Meta? meta;

  Data({this.items, this.summary, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
