import 'package:json_annotation/json_annotation.dart';

import 'transaction.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Transaction>? transactions;

  Data({this.transactions});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
