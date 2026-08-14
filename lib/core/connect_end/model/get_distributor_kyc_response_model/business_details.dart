import 'package:json_annotation/json_annotation.dart';

part 'business_details.g.dart';

@JsonSerializable()
class BusinessDetails {
  String? cacRegistrationNumber;
  String? taxIdentificationNumber;
  String? registeredAddress;
  String? contactPersonName;
  String? contactPersonPhoneNumber;
  String? contactPersonEmail;
  String? businessWebsite;

  BusinessDetails({
    this.cacRegistrationNumber,
    this.taxIdentificationNumber,
    this.registeredAddress,
    this.contactPersonName,
    this.contactPersonPhoneNumber,
    this.contactPersonEmail,
    this.businessWebsite,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return _$BusinessDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}
