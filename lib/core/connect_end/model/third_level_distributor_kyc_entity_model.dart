class ThirdLevelDistributorKycEntityModel {
  String? bankName;
  String? accountName;
  String? accountNumber;
  String? bvn;

  ThirdLevelDistributorKycEntityModel({
    this.bankName,
    this.accountName,
    this.accountNumber,
    this.bvn,
  });

  factory ThirdLevelDistributorKycEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ThirdLevelDistributorKycEntityModel(
      bankName: json['bankName'] as String?,
      accountName: json['accountName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      bvn: json['bvn'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'bankName': bankName,
    'accountName': accountName,
    'accountNumber': accountNumber,
    'bvn': bvn,
  };
}
