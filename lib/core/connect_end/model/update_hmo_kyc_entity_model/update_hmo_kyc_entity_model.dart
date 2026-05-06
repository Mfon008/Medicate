import 'cac_certificate.dart';
import 'hmo_accreditation.dart';
import 'logo.dart';
import 'tax_id_certificate.dart';

class UpdateHmoKycEntityModel {
  Logo? logo;
  CacCertificate? cacCertificate;
  HmoAccreditation? hmoAccreditation;
  TaxIdCertificate? taxIdCertificate;

  UpdateHmoKycEntityModel({
    this.logo,
    this.cacCertificate,
    this.hmoAccreditation,
    this.taxIdCertificate,
  });

  factory UpdateHmoKycEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateHmoKycEntityModel(
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      cacCertificate: json['cacCertificate'] == null
          ? null
          : CacCertificate.fromJson(
              json['cacCertificate'] as Map<String, dynamic>,
            ),
      hmoAccreditation: json['hmoAccreditation'] == null
          ? null
          : HmoAccreditation.fromJson(
              json['hmoAccreditation'] as Map<String, dynamic>,
            ),
      taxIdCertificate: json['taxIdCertificate'] == null
          ? null
          : TaxIdCertificate.fromJson(
              json['taxIdCertificate'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'logo': logo?.toJson(),
    'cacCertificate': cacCertificate?.toJson(),
    'hmoAccreditation': hmoAccreditation?.toJson(),
    'taxIdCertificate': taxIdCertificate?.toJson(),
  };
}
