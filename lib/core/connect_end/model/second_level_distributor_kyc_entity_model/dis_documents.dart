import 'package:json_annotation/json_annotation.dart';

import 'cac_certificate.dart';
import 'company_logo.dart';
import 'nafdac_permit.dart';
import 'pharmaceutical_distribution_license.dart';
import 'pharmacy_council_license.dart';

part 'dis_documents.g.dart';

@JsonSerializable()
class DisDocuments {
  CacCertificate? cacCertificate;
  PharmaceuticalDistributionLicense? pharmaceuticalDistributionLicense;
  NafdacPermit? nafdacPermit;
  PharmacyCouncilLicense? pharmacyCouncilLicense;
  CompanyLogo? companyLogo;
  // GmpCertificate? gmpCertificate;
  // NafdacManufacturingLicense? nafdacManufacturingLicense;
  // ImportPermit? importPermit;
  // ManufacturerAuthorizationLetter? manufacturerAuthorizationLetter;
  // ProductRegistrationEvidence? productRegistrationEvidence;

  DisDocuments({
    this.cacCertificate,
    this.pharmaceuticalDistributionLicense,
    this.nafdacPermit,
    this.pharmacyCouncilLicense,
    this.companyLogo,
    // this.gmpCertificate,
    // this.importPermit,
    // this.manufacturerAuthorizationLetter,
    // this.nafdacManufacturingLicense,
    // this.productRegistrationEvidence,
  });

  factory DisDocuments.fromJson(Map<String, dynamic> json) {
    return _$DisDocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DisDocumentsToJson(this);
}
