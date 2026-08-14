// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDocuments _$CompanyDocumentsFromJson(Map<String, dynamic> json) =>
    CompanyDocuments(
      cacCertificate: json['cacCertificate'] == null
          ? null
          : CacCertificate.fromJson(
              json['cacCertificate'] as Map<String, dynamic>,
            ),
      companyLogo: json['companyLogo'] == null
          ? null
          : CompanyLogo.fromJson(json['companyLogo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyDocumentsToJson(CompanyDocuments instance) =>
    <String, dynamic>{
      'cacCertificate': instance.cacCertificate,
      'companyLogo': instance.companyLogo,
    };
