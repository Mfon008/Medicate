class WholesaleAddToCartEntityModel {
  String? productId;
  int? quantity;

  WholesaleAddToCartEntityModel({this.productId, this.quantity});

  factory WholesaleAddToCartEntityModel.fromJson(Map<String, dynamic> json) {
    return WholesaleAddToCartEntityModel(
      productId: json['productId'] as String?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'quantity': quantity,
  };
}
