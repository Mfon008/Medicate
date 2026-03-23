import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? transactionReference;
  String? redirectUrl;
  String? status;
  String? walletTransactionId;
  String? newWalletBalance;
  String? paymentMethod;

  Data({
    this.transactionReference,
    this.redirectUrl,
    this.status,
    this.walletTransactionId,
    this.newWalletBalance,
    this.paymentMethod,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
