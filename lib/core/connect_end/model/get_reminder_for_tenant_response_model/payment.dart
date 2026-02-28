import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  String? transactionReference;
  int? amount;
  String? currency;
  String? status;
  String? reminderGroupId;
  List<String>? notificationChannelsPaidFor;

  Payment({
    this.transactionReference,
    this.amount,
    this.currency,
    this.status,
    this.reminderGroupId,
    this.notificationChannelsPaidFor,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
