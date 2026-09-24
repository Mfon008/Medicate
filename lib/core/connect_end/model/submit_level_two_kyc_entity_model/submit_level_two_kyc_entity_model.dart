import 'package:json_annotation/json_annotation.dart';

import 'cac_certificate.dart';
import 'means_of_id_document.dart';
import 'pharmacy_license.dart';
import 'tax_identification_number_document.dart';

part 'submit_level_two_kyc_entity_model.g.dart';

@JsonSerializable()
class SubmitLevelTwoKycEntityModel {
  String? meansOfIdType;
  MeansOfIdDocument? meansOfIdDocument;
  CacCertificate? cacCertificate;
  PharmacyLicense? pharmacyLicense;
  TaxIdentificationNumberDocument? taxIdentificationNumberDocument;

  SubmitLevelTwoKycEntityModel({
    this.meansOfIdType,
    this.meansOfIdDocument,
    this.cacCertificate,
    this.pharmacyLicense,
    this.taxIdentificationNumberDocument,
  });

  factory SubmitLevelTwoKycEntityModel.fromJson(Map<String, dynamic> json) {
    return _$SubmitLevelTwoKycEntityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubmitLevelTwoKycEntityModelToJson(this);
}
