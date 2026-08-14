import 'cac_certificate.dart';
import 'company_logo.dart';

class CompanyDocuments {
  CacCertificate? cacCertificate;
  CompanyLogo? companyLogo;

  CompanyDocuments({this.cacCertificate, this.companyLogo});

  factory CompanyDocuments.fromJson(Map<String, dynamic> json) {
    return CompanyDocuments(
      cacCertificate: json['cacCertificate'] == null
          ? null
          : CacCertificate.fromJson(
              json['cacCertificate'] as Map<String, dynamic>,
            ),
      companyLogo: json['companyLogo'] == null
          ? null
          : CompanyLogo.fromJson(json['companyLogo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'cacCertificate': cacCertificate?.toJson(),
    'companyLogo': companyLogo?.toJson(),
  };
}
