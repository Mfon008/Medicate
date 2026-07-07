import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? message;
  String? reminderGroupId;
  String? transactionReference;
  String? paymentId;

  Data({this.message, this.reminderGroupId, this.transactionReference, this.paymentId});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
