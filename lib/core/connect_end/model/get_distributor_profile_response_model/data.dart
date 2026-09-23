import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_distributor_profile_response_model/business_addresses.dart';
import 'package:medicate_app/core/connect_end/model/get_distributor_profile_response_model/logo.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? tenantType;
  String? distributorManufacturerName;
  String? registrationNumber;
  String? email;
  String? businessAddress;
  String? country;
  String? state;
  String? lga;
  List<BusinessAddresses>? businessAddresses;
  String? phone;
  String? kycStatus;
  bool? isProfileComplete;
  Logo? logo;
  int? profileCompletionPercentage;
  List<String>? missingFields;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? lastActive;

  Data({
    this.id,
    this.tenantType,
    this.distributorManufacturerName,
    this.registrationNumber,
    this.email,
    this.businessAddress,
    this.businessAddresses,
    this.country,
    this.state,
    this.logo,
    this.lga,
    this.phone,
    this.kycStatus,
    this.isProfileComplete,
    this.profileCompletionPercentage,
    this.missingFields,
    this.createdAt,
    this.updatedAt,
    this.lastActive,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
