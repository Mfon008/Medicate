class PayWithWalletEntityModel {
  String? transactionReference;

  PayWithWalletEntityModel({this.transactionReference});

  factory PayWithWalletEntityModel.fromJson(Map<String, dynamic> json) {
    return PayWithWalletEntityModel(
      transactionReference: json['transactionReference'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'transactionReference': transactionReference,
  };
}
