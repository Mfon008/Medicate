class CreateHospitalNetworkEntityModel {
  String? name;
  String? type;
  String? state;
  String? city;
  String? address;
  String? phone;
  String? email;

  CreateHospitalNetworkEntityModel({
    this.name,
    this.type,
    this.state,
    this.city,
    this.address,
    this.phone,
    this.email,
  });

  factory CreateHospitalNetworkEntityModel.fromJson(Map<String, dynamic> json) {
    return CreateHospitalNetworkEntityModel(
      name: json['name'] as String?,
      type: json['type'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type,
    'state': state,
    'city': city,
    'address': address,
    'phone': phone,
    'email': email,
  };
}
