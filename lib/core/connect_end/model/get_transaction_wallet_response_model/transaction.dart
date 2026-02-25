import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  String? id;
  String? amount;
  String? type;
  String? reference;
  String? description;
  String? createdAt;

  Transaction({
    this.id,
    this.amount,
    this.type,
    this.reference,
    this.description,
    this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return _$TransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
