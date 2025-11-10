import 'bank_detail.dart';

class UpdatePharmacyProfileEntityModel {
  String? country;
  String? state;
  String? lga;
  String? businessAddress;
  List<String>? servicesOffered;
  String? contactPersonName;
  String? contactEmail;
  List<BankDetail>? bankDetails;

  UpdatePharmacyProfileEntityModel({
    this.country,
    this.state,
    this.lga,
    this.businessAddress,
    this.servicesOffered,
    this.contactPersonName,
    this.contactEmail,
    this.bankDetails,
  });

  factory UpdatePharmacyProfileEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdatePharmacyProfileEntityModel(
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      businessAddress: json['businessAddress'] as String?,
      servicesOffered: json['servicesOffered'] as List<String>?,
      contactPersonName: json['contactPersonName'] as String?,
      contactEmail: json['contactEmail'] as String?,
      bankDetails: (json['bankDetails'] as List<dynamic>?)
          ?.map((e) => BankDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    'bankDetails': bankDetails?.map((e) => e.toJson()).toList(),
  };
}
