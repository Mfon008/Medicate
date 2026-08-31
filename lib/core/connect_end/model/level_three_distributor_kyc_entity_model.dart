class LevelThreeDistributorKycEntityModel {
  String? bankName;
  String? accountName;
  String? accountNumber;
  String? bvn;

  LevelThreeDistributorKycEntityModel({
    this.bankName,
    this.accountName,
    this.accountNumber,
    this.bvn,
  });

  factory LevelThreeDistributorKycEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LevelThreeDistributorKycEntityModel(
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
