import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/gmp_certificate.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/nafdac_manufacturing_license.dart';
import 'package:medicate_app/core/connect_end/model/second_level_distributor_kyc_entity_model/product_registration_evidence.dart';

import 'cac_certificate.dart';
import 'company_logo.dart';
part 'man_documents.g.dart';


@JsonSerializable()
class ManDocuments {
  CacCertificate? cacCertificate;
  // PharmaceuticalDistributionLicense? pharmaceuticalDistributionLicense;
  // NafdacPermit? nafdacPermit;
  // PharmacyCouncilLicense? pharmacyCouncilLicense;
  CompanyLogo? companyLogo;
  GmpCertificate? gmpCertificate;
  NafdacManufacturingLicense? nafdacManufacturingLicense;
  // ImportPermit? importPermit;
  // ManufacturerAuthorizationLetter? manufacturerAuthorizationLetter;
  ProductRegistrationEvidence? productRegistrationEvidence;

  ManDocuments({
    this.cacCertificate,
    // this.pharmaceuticalDistributionLicense,
    // this.nafdacPermit,
    // this.pharmacyCouncilLicense,
    this.companyLogo,
    this.gmpCertificate,
    // this.importPermit,
    // this.manufacturerAuthorizationLetter,
    this.nafdacManufacturingLicense,
    this.productRegistrationEvidence,
  });

  factory ManDocuments.fromJson(Map<String, dynamic> json) {
    return _$ManDocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ManDocumentsToJson(this);
}
