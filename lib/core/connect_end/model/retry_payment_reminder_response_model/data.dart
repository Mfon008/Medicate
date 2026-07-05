import 'package:json_annotation/json_annotation.dart';

import 'breakdown.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? reminderId;
  String? reminderGroupId;
  String? transactionReference;
  String? currency;
  int? totalAmount;
  String? status;
  List<String>? retryChannels;
  List<Breakdown>? breakdown;
  bool? resumed;

  Data({
    this.reminderId,
    this.reminderGroupId,
    this.transactionReference,
    this.currency,
    this.totalAmount,
    this.status,
    this.retryChannels,
    this.breakdown,
    this.resumed,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
