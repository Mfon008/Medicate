import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_distributor_kyc_response_model/gmp_certificate.dart';
import 'package:medicate_app/core/connect_end/model/get_distributor_kyc_response_model/import_permit.dart';
import 'package:medicate_app/core/connect_end/model/get_distributor_kyc_response_model/manufacturer_authorization_letter.dart';
import 'package:medicate_app/core/connect_end/model/get_distributor_kyc_response_model/nafdac_manufacturing_license.dart';
import 'package:medicate_app/core/connect_end/model/get_distributor_kyc_response_model/product_registration_evidence.dart';

import 'cac_certificate.dart';
import 'company_logo.dart';
import 'nafdac_permit.dart';
import 'pharmaceutical_distribution_license.dart';
import 'pharmacy_council_license.dart';

part 'documents.g.dart';

@JsonSerializable()
class Documents {
  CacCertificate? cacCertificate;
  PharmaceuticalDistributionLicense? pharmaceuticalDistributionLicense;
  NafdacPermit? nafdacPermit;
  PharmacyCouncilLicense? pharmacyCouncilLicense;
  CompanyLogo? companyLogo; 
  GmpCertificate? gmpCertificate;
  ImportPermit? importPermit;
  NafdacManufacturingLicense? nafdacManufacturingLicense;
  ProductRegistrationEvidence? productRegistrationEvidence;
  ManufacturerAuthorizationLetter? manufacturerAuthorizationLetter;

  Documents({
    this.cacCertificate,
    this.pharmaceuticalDistributionLicense,
    this.nafdacPermit,
    this.pharmacyCouncilLicense,
    this.companyLogo,
    this.gmpCertificate,
    this.importPermit,
    this.manufacturerAuthorizationLetter,
    this.nafdacManufacturingLicense,
    this.productRegistrationEvidence,
  });

  factory Documents.fromJson(Map<String, dynamic> json) {
    return _$DocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocumentsToJson(this);
}
