import 'package:json_annotation/json_annotation.dart';

import 'cac_certificate.dart';
import 'company_logo.dart';
import 'gmp_certificate.dart';
import 'nafdac_manufacturing_license.dart';
import 'product_registration_evidence.dart';
part 'man_documents.g.dart';

@JsonSerializable()
class ManDocuments {
  CacCertificate? cacCertificate;
  CompanyLogo? companyLogo;
  GmpCertificate? gmpCertificate;
  NafdacManufacturingLicense? nafdacManufacturingLicense;
  ProductRegistrationEvidence? productRegistrationEvidence;

  ManDocuments({
    this.cacCertificate,
    this.companyLogo,
    this.gmpCertificate,
    this.nafdacManufacturingLicense,
    this.productRegistrationEvidence,
  });

  factory ManDocuments.fromJson(Map<String, dynamic> json) {
    return _$ManDocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ManDocumentsToJson(this);
}
