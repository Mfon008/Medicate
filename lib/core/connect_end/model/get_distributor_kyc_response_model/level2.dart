import 'package:json_annotation/json_annotation.dart';

import 'business_details.dart';
import 'company_documents.dart';
import 'role_documents.dart';

part 'level2.g.dart';

@JsonSerializable()
class Level2 {
  BusinessDetails? businessDetails;
  CompanyDocuments? companyDocuments;
  List<String>? businessTypes;
  RoleDocuments? roleDocuments;

  Level2({
    this.businessDetails,
    this.companyDocuments,
    this.businessTypes,
    this.roleDocuments,
  });

  factory Level2.fromJson(Map<String, dynamic> json) {
    return _$Level2FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level2ToJson(this);
}
