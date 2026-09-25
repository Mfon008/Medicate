class CheckoutDeliveryOptionEntityModel {
  String? deliveryAddressId;

  CheckoutDeliveryOptionEntityModel({this.deliveryAddressId});

  factory CheckoutDeliveryOptionEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CheckoutDeliveryOptionEntityModel(
      deliveryAddressId: json['deliveryAddressId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'deliveryAddressId': deliveryAddressId};
}
