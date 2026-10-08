import 'package:json_annotation/json_annotation.dart';

part 'pending_bank_change.g.dart';

@JsonSerializable()
class PendingBankChange {
  String? id;
  String? bankName;
  String? accountName;
  String? accountNumber;
  String? status;
  DateTime? submittedAt;

  PendingBankChange({
    this.id,
    this.bankName,
    this.accountName,
    this.accountNumber,
    this.status,
    this.submittedAt,
  });

  factory PendingBankChange.fromJson(Map<String, dynamic> json) {
    return _$PendingBankChangeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendingBankChangeToJson(this);
}
