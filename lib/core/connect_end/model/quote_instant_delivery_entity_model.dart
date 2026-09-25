class QuoteInstantDeliveryEntityModel {
  String? deliveryMethod;
  String? deliveryAddressId;

  QuoteInstantDeliveryEntityModel({
    this.deliveryMethod,
    this.deliveryAddressId,
  });

  factory QuoteInstantDeliveryEntityModel.fromJson(Map<String, dynamic> json) {
    return QuoteInstantDeliveryEntityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryAddressId: json['deliveryAddressId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'deliveryAddressId': deliveryAddressId,
  };
}
