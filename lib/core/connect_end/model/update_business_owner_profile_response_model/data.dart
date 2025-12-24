import 'package:json_annotation/json_annotation.dart';

import 'authorized_rep_info.dart';
import 'bank_detail.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? tenantType;
  String? name;
  String? owner;
  String? providerType;
  String? healthcareFacilityName;
  String? registrationNumber;
  List<String>? servicesOffered;
  String? website;
  String? businessEmail;
  String? businessAddress;
  List<BankDetail>? bankDetails;
  String? country;
  String? state;
  String? lga;
  AuthorizedRepInfo? authorizedRepInfo;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.tenantType,
    this.name,
    this.owner,
    this.providerType,
    this.healthcareFacilityName,
    this.registrationNumber,
    this.servicesOffered,
    this.website,
    this.businessEmail,
    this.businessAddress,
    this.bankDetails,
    this.country,
    this.state,
    this.lga,
    this.authorizedRepInfo,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
