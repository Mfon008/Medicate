import 'gmp_certificate.dart';
import 'import_permit.dart';
import 'manufacturer_authorization_letter.dart';
import 'nafdac_manufacturing_license.dart';
import 'nafdac_permit.dart';
import 'pharmaceutical_distribution_license.dart';
import 'pharmacy_council_license.dart';
import 'product_registration_evidence.dart';

class RoleDocuments {
  PharmaceuticalDistributionLicense? pharmaceuticalDistributionLicense;
  NafdacPermit? nafdacPermit;
  PharmacyCouncilLicense? pharmacyCouncilLicense;
  GmpCertificate? gmpCertificate;
  NafdacManufacturingLicense? nafdacManufacturingLicense;
  ProductRegistrationEvidence? productRegistrationEvidence;
  ImportPermit? importPermit;
  ManufacturerAuthorizationLetter? manufacturerAuthorizationLetter;

  RoleDocuments({
    this.pharmaceuticalDistributionLicense,
    this.nafdacPermit,
    this.pharmacyCouncilLicense,
    this.gmpCertificate,
    this.nafdacManufacturingLicense,
    this.productRegistrationEvidence,
    this.importPermit,
    this.manufacturerAuthorizationLetter,
  });

  factory RoleDocuments.fromJson(Map<String, dynamic> json) => RoleDocuments(
    pharmaceuticalDistributionLicense:
        json['pharmaceuticalDistributionLicense'] == null
        ? null
        : PharmaceuticalDistributionLicense.fromJson(
            json['pharmaceuticalDistributionLicense'] as Map<String, dynamic>,
          ),
    nafdacPermit: json['nafdacPermit'] == null
        ? null
        : NafdacPermit.fromJson(json['nafdacPermit'] as Map<String, dynamic>),
    pharmacyCouncilLicense: json['pharmacyCouncilLicense'] == null
        ? null
        : PharmacyCouncilLicense.fromJson(
            json['pharmacyCouncilLicense'] as Map<String, dynamic>,
          ),
    gmpCertificate: json['gmpCertificate'] == null
        ? null
        : GmpCertificate.fromJson(
            json['gmpCertificate'] as Map<String, dynamic>,
          ),
    nafdacManufacturingLicense: json['nafdacManufacturingLicense'] == null
        ? null
        : NafdacManufacturingLicense.fromJson(
            json['nafdacManufacturingLicense'] as Map<String, dynamic>,
          ),
    productRegistrationEvidence: json['productRegistrationEvidence'] == null
        ? null
        : ProductRegistrationEvidence.fromJson(
            json['productRegistrationEvidence'] as Map<String, dynamic>,
          ),
    importPermit: json['importPermit'] == null
        ? null
        : ImportPermit.fromJson(json['importPermit'] as Map<String, dynamic>),
    manufacturerAuthorizationLetter:
        json['manufacturerAuthorizationLetter'] == null
        ? null
        : ManufacturerAuthorizationLetter.fromJson(
            json['manufacturerAuthorizationLetter'] as Map<String, dynamic>,
          ),
  );

  Map<String, dynamic> toJson() => {
    'pharmaceuticalDistributionLicense': pharmaceuticalDistributionLicense
        ?.toJson(),
    'nafdacPermit': nafdacPermit?.toJson(),
    'pharmacyCouncilLicense': pharmacyCouncilLicense?.toJson(),
    'gmpCertificate': gmpCertificate?.toJson(),
    'nafdacManufacturingLicense': nafdacManufacturingLicense?.toJson(),
    'productRegistrationEvidence': productRegistrationEvidence?.toJson(),
    'importPermit': importPermit?.toJson(),
    'manufacturerAuthorizationLetter': manufacturerAuthorizationLetter
        ?.toJson(),
  };
}
