import 'package:json_annotation/json_annotation.dart';

import 'price_breakdown.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  String? paymentId;
  String? transactionReference;
  int? amount;
  String? currency;
  String? status;
  String? reminderGroupId;
  List<String>? notificationChannelsPaidFor;
  List<PriceBreakdown>? priceBreakdown;

  Payment({
    this.paymentId,
    this.transactionReference,
    this.amount,
    this.currency,
    this.status,
    this.reminderGroupId,
    this.notificationChannelsPaidFor,
    this.priceBreakdown,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
