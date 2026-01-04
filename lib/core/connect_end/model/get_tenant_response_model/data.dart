import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_tenant_response_model/bank_detail.dart';
import 'package:medicate_app/core/connect_end/model/get_tenant_response_model/educational_experience/educational_experience.dart';
import 'package:medicate_app/core/connect_end/model/get_tenant_response_model/means_of_id.dart';

import 'authorized_rep_info/authorized_rep_info.dart';
import 'kyc_document.dart';
import 'logo.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? tenantType;
  String? name;
  String? owner;
  String? licenseNumber;
  String? businessAddress;
  String? email;
  String? meansOfIdType;
  List<KycDocument>? kycDocuments;
  List<BankDetail>? bankDetails;
  Logo? logo;
  List<String>? servicesOffered;
  String? bio;
  String? country;
  String? lga;
  String? healthcareFacilityName;
  String? website;
  String? registrationNumber;
  String? businessEmail;
  String? contactPersonFirstName;
  String? contactPersonLastName;
  String? contactPersonDesignation;
  String? state;
  String? yearsOfExperience;
  AuthorizedRepInfo? authorizedRepInfo;
  String? createdAt;
  String? updatedAt;
  MeansOfId? meansOfId;
  List<EducationalExperience>? educationalExperience;

  Data({
    this.id,
    this.tenantType,
    this.name,
    this.owner,
    this.licenseNumber,
    this.businessAddress,
    this.businessEmail,
    this.email,
    this.healthcareFacilityName,
    this.kycDocuments,
    this.bio,
    this.bankDetails,
    this.meansOfIdType,
    this.logo,
    this.meansOfId,
    this.createdAt,
    this.yearsOfExperience,
    this.updatedAt,
    this.servicesOffered,
    this.state,
    this.lga,
    this.registrationNumber,
    this.country,
    this.authorizedRepInfo,
    this.website,
    this.educationalExperience,
    this.contactPersonDesignation,
    this.contactPersonFirstName,
    this.contactPersonLastName
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
