class Item {
  String? productId;
  int? quantity;

  Item({this.productId, this.quantity});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    productId: json['productId'] as String?,
    quantity: json['quantity'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'quantity': quantity,
  };
}
