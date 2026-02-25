class InitiatePaymentWalletEntityModel {
  String? reference;
  String? callbackUrl;

  InitiatePaymentWalletEntityModel({this.reference, this.callbackUrl});

  factory InitiatePaymentWalletEntityModel.fromJson(Map<String, dynamic> json) {
    return InitiatePaymentWalletEntityModel(
      reference: json['reference'] as String?,
      callbackUrl: json['callbackUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'reference': reference,
    'callbackUrl': callbackUrl,
  };
}
