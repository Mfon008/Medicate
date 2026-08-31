import 'package:json_annotation/json_annotation.dart';

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
  String? phone;
  String? kycStatus;
  bool? isProfileComplete;
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
    this.country,
    this.state,
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
