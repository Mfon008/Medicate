import 'package:json_annotation/json_annotation.dart';

import 'cac_certificate.dart';
import 'means_of_id_document.dart';
import 'pharmacy_license.dart';
import 'tax_identification_number_document.dart';

part 'level2.g.dart';

@JsonSerializable()
class Level2 {
  String? meansOfIdType;
  MeansOfIdDocument? meansOfIdDocument;
  CacCertificate? cacCertificate;
  PharmacyLicense? pharmacyLicense;
  TaxIdentificationNumberDocument? taxIdentificationNumberDocument;

  Level2({
    this.meansOfIdType,
    this.meansOfIdDocument,
    this.cacCertificate,
    this.pharmacyLicense,
    this.taxIdentificationNumberDocument,
  });

  factory Level2.fromJson(Map<String, dynamic> json) {
    return _$Level2FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level2ToJson(this);
}
