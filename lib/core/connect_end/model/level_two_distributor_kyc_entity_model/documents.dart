import 'cac_certificate.dart';
import 'company_logo.dart';
import 'nafdac_permit.dart';
import 'pharmaceutical_distribution_license.dart';
import 'pharmacy_council_license.dart';

class Documents {
  CacCertificate? cacCertificate;
  PharmaceuticalDistributionLicense? pharmaceuticalDistributionLicense;
  NafdacPermit? nafdacPermit;
  PharmacyCouncilLicense? pharmacyCouncilLicense;
  CompanyLogo? companyLogo;

  Documents({
    this.cacCertificate,
    this.pharmaceuticalDistributionLicense,
    this.nafdacPermit,
    this.pharmacyCouncilLicense,
    this.companyLogo,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
    cacCertificate: json['cacCertificate'] == null
        ? null
        : CacCertificate.fromJson(
            json['cacCertificate'] as Map<String, dynamic>,
          ),
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
    companyLogo: json['companyLogo'] == null
        ? null
        : CompanyLogo.fromJson(json['companyLogo'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'cacCertificate': cacCertificate?.toJson(),
    'pharmaceuticalDistributionLicense': pharmaceuticalDistributionLicense
        ?.toJson(),
    'nafdacPermit': nafdacPermit?.toJson(),
    'pharmacyCouncilLicense': pharmacyCouncilLicense?.toJson(),
    'companyLogo': companyLogo?.toJson(),
  };
}
