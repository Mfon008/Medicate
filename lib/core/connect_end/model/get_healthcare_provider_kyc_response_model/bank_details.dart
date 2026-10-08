import 'package:json_annotation/json_annotation.dart';

part 'bank_details.g.dart';

@JsonSerializable()
class BankDetails {
  String? bankName;
  String? accountName;
  String? accountNumber;

  BankDetails({this.bankName, this.accountName, this.accountNumber});

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return _$BankDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);
}
