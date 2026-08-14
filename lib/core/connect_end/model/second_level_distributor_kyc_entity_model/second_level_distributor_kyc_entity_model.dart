import 'business_details.dart';
import 'company_documents.dart';
import 'role_documents.dart';

class SecondLevelDistributorKycEntityModel {
  BusinessDetails? businessDetails;
  CompanyDocuments? companyDocuments;
  List<String>? businessTypes;
  RoleDocuments? roleDocuments;

  SecondLevelDistributorKycEntityModel({
    this.businessDetails,
    this.companyDocuments,
    this.businessTypes,
    this.roleDocuments,
  });

  factory SecondLevelDistributorKycEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SecondLevelDistributorKycEntityModel(
      businessDetails: json['businessDetails'] == null
          ? null
          : BusinessDetails.fromJson(
              json['businessDetails'] as Map<String, dynamic>,
            ),
      companyDocuments: json['companyDocuments'] == null
          ? null
          : CompanyDocuments.fromJson(
              json['companyDocuments'] as Map<String, dynamic>,
            ),
      businessTypes: json['businessTypes'] as List<String>?,
      roleDocuments: json['roleDocuments'] == null
          ? null
          : RoleDocuments.fromJson(
              json['roleDocuments'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'businessDetails': businessDetails?.toJson(),
    'companyDocuments': companyDocuments?.toJson(),
    'businessTypes': businessTypes,
    'roleDocuments': roleDocuments?.toJson(),
  };
}
