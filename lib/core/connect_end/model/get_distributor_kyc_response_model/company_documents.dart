import 'package:json_annotation/json_annotation.dart';

import 'cac_certificate.dart';
import 'company_logo.dart';

part 'company_documents.g.dart';

@JsonSerializable()
class CompanyDocuments {
  CacCertificate? cacCertificate;
  CompanyLogo? companyLogo;

  CompanyDocuments({this.cacCertificate, this.companyLogo});

  factory CompanyDocuments.fromJson(Map<String, dynamic> json) {
    return _$CompanyDocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyDocumentsToJson(this);
}
