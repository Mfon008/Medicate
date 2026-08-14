class VolumePricing {
  int? quantity;
  int? pricePerUnit;

  VolumePricing({this.quantity, this.pricePerUnit});

  factory VolumePricing.fromJson(Map<String, dynamic> json) => VolumePricing(
    quantity: json['quantity'] as int?,
    pricePerUnit: json['pricePerUnit'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'quantity': quantity,
    'pricePerUnit': pricePerUnit,
  };
}
