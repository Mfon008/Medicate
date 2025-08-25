import 'package:json_annotation/json_annotation.dart';

import 'phone.dart';
import 'tokens.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? displayName;
  Phone? phone;
  Tokens? tokens;

  Data({this.id, this.displayName, this.phone, this.tokens});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
