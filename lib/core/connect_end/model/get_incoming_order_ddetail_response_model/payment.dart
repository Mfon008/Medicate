import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  String? method;
  String? status;
  String? paymentId;
  String? transactionReference;
  String? redirectUrl;

  Payment({
    this.method,
    this.status,
    this.paymentId,
    this.transactionReference,
    this.redirectUrl,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
