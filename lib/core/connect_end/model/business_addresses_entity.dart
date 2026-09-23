class BusinessAddressesEntity {
  String? businessAddress;
  String? country;
  String? state;
  String? lga;

  BusinessAddressesEntity({
    this.businessAddress,
    this.country,
    this.state,
    this.lga,
  });

  factory BusinessAddressesEntity.fromJson(Map<String, dynamic> json) {
    return BusinessAddressesEntity(
      businessAddress: json['businessAddress'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'businessAddress': businessAddress,
    'country': country,
    'state': state,
    'lga': lga,
  };
}
