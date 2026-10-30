class DeliveryDetails {
  String? state;
  String? lga;
  String? deliveryAddress;
  String? recipientName;
  String? recipientIdType;
  String? contactPhone;
  String? orderNotes;

  DeliveryDetails({
    this.state,
    this.lga,
    this.deliveryAddress,
    this.contactPhone,
    this.orderNotes,
    this.recipientIdType,
    this.recipientName,
  });

  factory DeliveryDetails.fromJson(Map<String, dynamic> json) {
    return DeliveryDetails(
      recipientIdType: json['recipientIdType'] as String?,
      recipientName: json['recipientName'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      contactPhone: json['contactPhone'] as String?,
      orderNotes: json['orderNotes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'recipientIdType': recipientIdType,
    'recipientName': recipientName,
    'state': state,
    'lga': lga,
    'deliveryAddress': deliveryAddress,
    'contactPhone': contactPhone,
    'orderNotes': orderNotes,
  };
}
