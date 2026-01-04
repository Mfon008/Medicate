import 'bank_detail.dart';
import 'logo.dart';

class UpdateHmoProfileEntityModel {
  Logo? logo;
  String? name;
  String? businessAddress;
  String? businessEmail;
  String? country;
  String? state;
  String? lga;
  String? contactPersonFirstName;
  String? contactPersonLastName;
  String? contactPersonDesignation;
  List<BankDetail>? bankDetails;

  UpdateHmoProfileEntityModel({
    this.logo,
    this.name,
    this.businessAddress,
    this.businessEmail,
    this.country,
    this.state,
    this.lga,
    this.contactPersonFirstName,
    this.contactPersonLastName,
    this.contactPersonDesignation,
    this.bankDetails,
  });

  factory UpdateHmoProfileEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateHmoProfileEntityModel(
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      name: json['name'] as String?,
      businessAddress: json['businessAddress'] as String?,
      businessEmail: json['businessEmail'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      contactPersonFirstName: json['contactPersonFirstName'] as String?,
      contactPersonLastName: json['contactPersonLastName'] as String?,
      contactPersonDesignation: json['contactPersonDesignation'] as String?,
      bankDetails: (json['bankDetails'] as List<dynamic>?)
          ?.map((e) => BankDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'logo': logo?.toJson(),
    'name': name,
    'businessAddress': businessAddress,
    'businessEmail': businessEmail,
    'country': country,
    'state': state,
    'lga': lga,
    'contactPersonFirstName': contactPersonFirstName,
    'contactPersonLastName': contactPersonLastName,
    'contactPersonDesignation': contactPersonDesignation,
    'bankDetails': bankDetails?.map((e) => e.toJson()).toList(),
  };
}
