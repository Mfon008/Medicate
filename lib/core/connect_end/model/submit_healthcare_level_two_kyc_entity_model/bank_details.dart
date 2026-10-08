class BankDetails {
  String? bankName;
  String? accountName;
  String? accountNumber;

  BankDetails({this.bankName, this.accountName, this.accountNumber});

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
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
