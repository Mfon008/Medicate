import 'package:json_annotation/json_annotation.dart';

import 'gmp_certificate.dart';
import 'nafdac_manufacturing_license.dart';
import 'nafdac_permit.dart';
import 'pharmaceutical_distribution_license.dart';
import 'pharmacy_council_license.dart';
import 'product_registration_evidence.dart';

part 'role_documents.g.dart';

@JsonSerializable()
class RoleDocuments {
  PharmaceuticalDistributionLicense? pharmaceuticalDistributionLicense;
  NafdacPermit? nafdacPermit;
  PharmacyCouncilLicense? pharmacyCouncilLicense;
  GmpCertificate? gmpCertificate;
  NafdacManufacturingLicense? nafdacManufacturingLicense;
  ProductRegistrationEvidence? productRegistrationEvidence;

  RoleDocuments({
    this.pharmaceuticalDistributionLicense,
    this.nafdacPermit,
    this.pharmacyCouncilLicense,
    this.gmpCertificate,
    this.nafdacManufacturingLicense,
    this.productRegistrationEvidence,
  });

  factory RoleDocuments.fromJson(Map<String, dynamic> json) {
    return _$RoleDocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RoleDocumentsToJson(this);
}
