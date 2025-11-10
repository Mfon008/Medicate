class BankDetail {
  String? bankName;
  String? accountName;
  String? accountNumber;

  BankDetail({this.bankName, this.accountName, this.accountNumber});

  factory BankDetail.fromJson(Map<String, dynamic> json) => BankDetail(
    bankName: json['bankName'] as String?,
    accountName: json['accountName'] as String?,
    accountNumber: json['accountNumber'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'bankName': bankName,
    'accountName': accountName,
    'accountNumber': accountNumber,
  };
}
