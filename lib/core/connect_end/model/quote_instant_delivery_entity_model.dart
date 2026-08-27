class QuoteInstantDeliveryEntityModel {
  String? deliveryMethod;
  String? stateCode;
  String? lgaCode;

  QuoteInstantDeliveryEntityModel({
    this.deliveryMethod,
    this.stateCode,
    this.lgaCode,
  });

  factory QuoteInstantDeliveryEntityModel.fromJson(Map<String, dynamic> json) {
    return QuoteInstantDeliveryEntityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      stateCode: json['stateCode'] as String?,
      lgaCode: json['lgaCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'stateCode': stateCode,
    'lgaCode': lgaCode,
  };
}
