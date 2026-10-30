class DeliveryDetails {
  String? state;
  String? lga;
  String? deliveryAddress;
  String? recipientName;
  String? contactPhone;
  String? recipientIdType;
  String? orderNotes;

  DeliveryDetails({
    this.state,
    this.lga,
    this.deliveryAddress,
    this.recipientName,
    this.contactPhone,
    this.recipientIdType,
    this.orderNotes,
  });

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) {
    return DeliveryDetails(
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      contactPhone: json['contactPhone'] as String?,
      recipientName: json['recipientName'] as String?,
      recipientIdType: json['recipientIdType'] as String?,
      orderNotes: json['orderNotes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'state': state,
    'lga': lga,
    'deliveryAddress': deliveryAddress,
    'contactPhone': contactPhone,
    'recipientName': recipientName,
    'recipientIdType': recipientIdType,
    'orderNotes': orderNotes,
  };
}
