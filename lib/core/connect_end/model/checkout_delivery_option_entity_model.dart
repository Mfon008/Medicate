class CheckoutDeliveryOptionEntityModel {
  String? stateCode;
  String? lgaCode;

  CheckoutDeliveryOptionEntityModel({this.stateCode, this.lgaCode});

  factory CheckoutDeliveryOptionEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CheckoutDeliveryOptionEntityModel(
      stateCode: json['stateCode'] as String?,
      lgaCode: json['lgaCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'stateCode': stateCode, 'lgaCode': lgaCode};
}
