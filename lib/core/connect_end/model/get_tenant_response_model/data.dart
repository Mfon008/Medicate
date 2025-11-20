import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_tenant_response_model/bank_detail.dart';

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
  List<KycDocument>? kycDocuments;
  List<BankDetail>? bankDetails;
  Logo? logo;
  List<String>? servicesOffered;
  String? country;
  String? lga;
  String? state;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.tenantType,
    this.name,
    this.owner,
    this.licenseNumber,
    this.businessAddress,
    this.email,
    this.kycDocuments,
    this.bankDetails,
    this.logo,
    this.createdAt,
    this.updatedAt,
    this.servicesOffered,
    this.state,
    this.lga,
    this.country,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
