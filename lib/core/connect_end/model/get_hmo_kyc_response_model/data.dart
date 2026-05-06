import 'package:json_annotation/json_annotation.dart';

import 'bank_detail.dart';
import 'logo.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? tenantType;
  String? name;
  String? owner;
  String? businessAddress;
  String? businessEmail;
  String? contactPersonFirstName;
  String? contactPersonLastName;
  String? contactPersonDesignation;
  List<BankDetail>? bankDetails;
  Logo? logo;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.tenantType,
    this.name,
    this.owner,
    this.businessAddress,
    this.businessEmail,
    this.contactPersonFirstName,
    this.contactPersonLastName,
    this.contactPersonDesignation,
    this.bankDetails,
    this.logo,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
