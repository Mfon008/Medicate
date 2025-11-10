import 'package:json_annotation/json_annotation.dart';

import 'bank_detail.dart';

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
  List<String>? servicesOffered;
  List<BankDetail>? bankDetails;
  String? contactEmail;
  String? contactPersonName;
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
    this.servicesOffered,
    this.bankDetails,
    this.contactEmail,
    this.contactPersonName,
    this.country,
    this.lga,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
