class DeliveryDetails {
  String? state;
  String? lga;
  String? deliveryAddress;
  String? contactPhone;
  String? orderNotes;

  DeliveryDetails({
    this.state,
    this.lga,
    this.deliveryAddress,
    this.contactPhone,
    this.orderNotes,
  });

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) {
    return DeliveryDetails(
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      contactPhone: json['contactPhone'] as String?,
      orderNotes: json['orderNotes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'state': state,
    'lga': lga,
    'deliveryAddress': deliveryAddress,
    'contactPhone': contactPhone,
    'orderNotes': orderNotes,
  };
}
