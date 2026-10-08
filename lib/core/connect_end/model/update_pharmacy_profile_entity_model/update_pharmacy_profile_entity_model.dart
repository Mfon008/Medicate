import 'package:medicate_app/core/connect_end/model/update_pharmacy_profile_entity_model/logo.dart';

class UpdatePharmacyProfileEntityModel {
  String? country;
  String? state;
  String? lga;
  String? businessAddress;
  List<String>? servicesOffered;
  String? contactPersonName;
  String? contactEmail;
  String? email;
  Logo? logo;

  UpdatePharmacyProfileEntityModel({
    this.country,
    this.state,
    this.lga,
    this.businessAddress,
    this.servicesOffered,
    this.contactPersonName,
    this.contactEmail,
    this.email,
    this.logo,
  });

  factory UpdatePharmacyProfileEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdatePharmacyProfileEntityModel(
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      businessAddress: json['businessAddress'] as String?,
      servicesOffered: json['servicesOffered'] as List<String>?,
      contactPersonName: json['contactPersonName'] as String?,
      contactEmail: json['contactEmail'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'country': country,
    'state': state,
    'lga': lga,
    'businessAddress': businessAddress,
    'servicesOffered': servicesOffered,
    'contactPersonName': contactPersonName,
    'contactEmail': contactEmail,
    'email': email,
    'logo': logo?.toJson(),
  };
}
