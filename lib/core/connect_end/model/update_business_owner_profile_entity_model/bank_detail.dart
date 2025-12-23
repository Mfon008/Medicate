class BankDetail {
  String? accountName;
  String? bankName;
  String? accountNumber;

  BankDetail({this.accountName, this.bankName, this.accountNumber});

  factory BankDetail.fromJson(Map<String, dynamic> json) => BankDetail(
    accountName: json['accountName'] as String?,
    bankName: json['bankName'] as String?,
    accountNumber: json['accountNumber'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'accountName': accountName,
    'bankName': bankName,
    'accountNumber': accountNumber,
  };
}
