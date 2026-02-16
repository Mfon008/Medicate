import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? displayName;
  String? fullName;
  String? phone;
  bool? pinSet;

  Data({this.displayName, this.fullName, this.phone, this.pinSet});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
