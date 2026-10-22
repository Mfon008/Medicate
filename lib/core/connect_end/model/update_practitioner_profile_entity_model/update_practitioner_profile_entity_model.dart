// import 'bank_detail.dart';
import 'educational_experience.dart';
import 'logo.dart';
import 'means_of_id.dart';

class UpdatePractitionerProfileEntityModel {
  Logo? logo;
  String? typeOfHealthcareProvider;
  String? healthcareFacilityName;
  String? registrationNumber;
  int? yearsOfExperience;
  String? bio;
  String? country;
  String? state;
  String? lga;
  String? website;
  String? meansOfIdType;
  MeansOfId? meansOfId;
  List<String>? servicesOffered;
  String? businessAddress;
  String? businessEmail;
  List<EducationalExperience>? educationalExperience;

  UpdatePractitionerProfileEntityModel({
    this.logo,
    this.typeOfHealthcareProvider,
    this.healthcareFacilityName,
    this.registrationNumber,
    this.yearsOfExperience,
    this.bio,
    this.country,
    this.state,
    this.lga,
    this.website,
    this.meansOfIdType,
    this.meansOfId,
    this.servicesOffered,
    this.businessAddress,
    this.businessEmail,
    this.educationalExperience,
  });

  factory UpdatePractitionerProfileEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdatePractitionerProfileEntityModel(
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      typeOfHealthcareProvider: json['typeOfHealthcareProvider'] as String?,
      healthcareFacilityName: json['healthcareFacilityName'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      yearsOfExperience: json['yearsOfExperience'] as int?,
      bio: json['bio'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      website: json['website'] as String?,
      meansOfIdType: json['meansOfIdType'] as String?,
      meansOfId: json['meansOfId'] == null
          ? null
          : MeansOfId.fromJson(json['meansOfId'] as Map<String, dynamic>),
      servicesOffered: json['servicesOffered'] as List<String>?,
      businessAddress: json['businessAddress'] as String?,
      businessEmail: json['businessEmail'] as String?,
      educationalExperience: (json['educationalExperience'] as List<dynamic>?)
          ?.map(
            (e) => EducationalExperience.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'logo': logo?.toJson(),
    'typeOfHealthcareProvider': typeOfHealthcareProvider,
    'healthcareFacilityName': healthcareFacilityName,
    'registrationNumber': registrationNumber,
    'yearsOfExperience': yearsOfExperience,
    'bio': bio,
    'country': country,
    'state': state,
    'lga': lga,
    'website': website,
    'meansOfIdType': meansOfIdType,
    'meansOfId': meansOfId?.toJson(),
    'servicesOffered': servicesOffered,
    'businessAddress': businessAddress,
    'businessEmail': businessEmail,
    'educationalExperience': educationalExperience
        ?.map((e) => e.toJson())
        .toList(),
  };
}
