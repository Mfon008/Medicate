import 'package:json_annotation/json_annotation.dart';

import 'destination.dart';
import 'method.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Destination? destination;
  bool? available;
  List<Method>? methods;

  Data({this.destination, this.available, this.methods});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
