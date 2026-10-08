import 'package:json_annotation/json_annotation.dart';

import 'cac_certificate.dart';
import 'hmo_accreditation.dart';
import 'logo.dart';
import 'tax_id_certificate.dart';

part 'level2.g.dart';

@JsonSerializable()
class Level2 {
  Logo? logo;
  CacCertificate? cacCertificate;
  HmoAccreditation? hmoAccreditation;
  TaxIdCertificate? taxIdCertificate;

  Level2({
    this.logo,
    this.cacCertificate,
    this.hmoAccreditation,
    this.taxIdCertificate,
  });

  factory Level2.fromJson(Map<String, dynamic> json) {
    return _$Level2FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level2ToJson(this);
}
