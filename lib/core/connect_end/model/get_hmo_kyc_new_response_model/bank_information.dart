import 'package:json_annotation/json_annotation.dart';

part 'bank_information.g.dart';

@JsonSerializable()
class BankInformation {
  String? bankName;
  String? accountName;
  String? accountNumber;

  BankInformation({this.bankName, this.accountName, this.accountNumber});

  factory BankInformation.fromJson(Map<String, dynamic> json) {
    return _$BankInformationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankInformationToJson(this);
}
