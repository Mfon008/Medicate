class CreatePaymentWalletEntityModel {
  int? amount;
  String? currency;
  String? description;
  String? paymentForType;
  String? paymentForId;
  String? callbackUrl;

  CreatePaymentWalletEntityModel({
    this.amount,
    this.currency,
    this.description,
    this.paymentForType,
    this.paymentForId,
    this.callbackUrl,
  });

  factory CreatePaymentWalletEntityModel.fromJson(Map<String, dynamic> json) {
    return CreatePaymentWalletEntityModel(
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
      description: json['description'] as String?,
      paymentForType: json['paymentForType'] as String?,
      paymentForId: json['paymentForId'] as String?,
      callbackUrl: json['callbackUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'currency': currency,
    'description': description,
    'paymentForType': paymentForType,
    'paymentForId': paymentForId,
    'callbackUrl': callbackUrl,
  };
}
