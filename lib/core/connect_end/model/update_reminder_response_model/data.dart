import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? message;
  String? transactionReference;
  String? paymentId;
  dynamic data;

  Data({this.message, this.transactionReference, this.data, this.paymentId});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
