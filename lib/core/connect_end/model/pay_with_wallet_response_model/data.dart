import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? transactionReference;
  String? status;
  String? walletTransactionId;
  String? newWalletBalance;

  Data({
    this.transactionReference,
    this.status,
    this.walletTransactionId,
    this.newWalletBalance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
