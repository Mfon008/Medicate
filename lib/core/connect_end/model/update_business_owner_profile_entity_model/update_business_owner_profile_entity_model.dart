import 'bank_detail.dart';
import 'logo.dart';
import 'upload_means_of_id.dart';

class UpdateBusinessOwnerProfileEntityModel {
  Logo? logo;
  String? typeOfHealthcareProvider;
  String? healthcareFacilityName;
  String? registrationNumber;
  String? country;
  String? state;
  String? lga;
  String? website;
  List<String>? servicesOffered;
  String? businessAddress;
  String? businessEmail;
  List<BankDetail>? bankDetails;
  String? fullName;
  String? phoneNumber;
  String? designation;
  String? email;
  String? meansOfId;
  UploadMeansOfId? uploadMeansOfId;

  UpdateBusinessOwnerProfileEntityModel({
    this.logo,
    this.typeOfHealthcareProvider,
    this.healthcareFacilityName,
    this.registrationNumber,
    this.country,
    this.state,
    this.lga,
    this.website,
    this.servicesOffered,
    this.businessAddress,
    this.businessEmail,
    this.bankDetails,
    this.fullName,
    this.phoneNumber,
    this.designation,
    this.email,
    this.meansOfId,
    this.uploadMeansOfId,
  });

  factory UpdateBusinessOwnerProfileEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateBusinessOwnerProfileEntityModel(
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      typeOfHealthcareProvider: json['typeOfHealthcareProvider'] as String?,
      healthcareFacilityName: json['healthcareFacilityName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      website: json['website'] as String?,
      servicesOffered: json['servicesOffered'] as List<String>?,
      businessAddress: json['businessAddress'] as String?,
      businessEmail: json['businessEmail'] as String?,
      bankDetails: (json['bankDetails'] as List<dynamic>?)
          ?.map((e) => BankDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      designation: json['designation'] as String?,
      email: json['email'] as String?,
      meansOfId: json['meansOfId'] as String?,
      uploadMeansOfId: json['uploadMeansOfId'] == null
          ? null
          : UploadMeansOfId.fromJson(
              json['uploadMeansOfId'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'logo': logo?.toJson(),
    'typeOfHealthcareProvider': typeOfHealthcareProvider,
    'healthcareFacilityName': healthcareFacilityName,
    'registrationNumber': registrationNumber,
    'country': country,
    'state': state,
    'lga': lga,
    'website': website,
    'servicesOffered': servicesOffered,
    'businessAddress': businessAddress,
    'businessEmail': businessEmail,
    'bankDetails': bankDetails?.map((e) => e.toJson()).toList(),
    'fullName': fullName,
    'phoneNumber': phoneNumber,
    'designation': designation,
    'email': email,
    'meansOfId': meansOfId,
    'uploadMeansOfId': uploadMeansOfId?.toJson(),
  };
}
