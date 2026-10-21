import 'package:json_annotation/json_annotation.dart';

import 'cac_certificate.dart';
import 'company_logo.dart';
import 'gmp_certificate.dart';
import 'import_permit.dart';
import 'manufacturer_authorization_letter.dart';
import 'nafdac_manufacturing_license.dart';
import 'nafdac_permit.dart';
import 'pharmaceutical_distribution_license.dart';
import 'pharmacy_council_license.dart';
import 'product_registration_evidence.dart';

part 'market_documents.g.dart';

@JsonSerializable()
class MarketDocuments {
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

  MarketDocuments({
    this.cacCertificate,
    this.pharmaceuticalDistributionLicense,
    this.nafdacPermit,
    this.gmpCertificate,
    this.pharmacyCouncilLicense,
    this.companyLogo,
    this.importPermit,
    this.nafdacManufacturingLicense,
    this.productRegistrationEvidence,
    this.manufacturerAuthorizationLetter,
  });

  factory MarketDocuments.fromJson(Map<String, dynamic> json) {
    return _$MarketDocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MarketDocumentsToJson(this);
}
