import 'package:json_annotation/json_annotation.dart';

part 'bank_detail.g.dart';

@JsonSerializable()
class BankDetail {
  String? accountName;
  String? bankName;
  String? accountNumber;

  BankDetail({this.accountName, this.bankName, this.accountNumber});

  factory BankDetail.fromJson(Map<String, dynamic> json) {
    return _$BankDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankDetailToJson(this);
}
