import 'package:json_annotation/json_annotation.dart';

import 'cac_certificate.dart';
import 'company_logo.dart';
import 'import_permit.dart';
import 'manufacturer_authorization_letter.dart';
part 'imp_documents.g.dart';

@JsonSerializable()
class ImpDocuments {
  CacCertificate? cacCertificate;
  CompanyLogo? companyLogo;
  ImportPermit? importPermit;
  ManufacturerAuthorizationLetter? manufacturerAuthorizationLetter;

  ImpDocuments({
    this.cacCertificate,
    this.companyLogo,
    this.importPermit,
    this.manufacturerAuthorizationLetter,
  });

  factory ImpDocuments.fromJson(Map<String, dynamic> json) {
    return _$ImpDocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImpDocumentsToJson(this);
}
