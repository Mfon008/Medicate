// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imp_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImpDocuments _$ImpDocumentsFromJson(Map<String, dynamic> json) => ImpDocuments(
  cacCertificate: json['cacCertificate'] == null
      ? null
      : CacCertificate.fromJson(json['cacCertificate'] as Map<String, dynamic>),
  companyLogo: json['companyLogo'] == null
      ? null
      : CompanyLogo.fromJson(json['companyLogo'] as Map<String, dynamic>),
  importPermit: json['importPermit'] == null
      ? null
      : ImportPermit.fromJson(json['importPermit'] as Map<String, dynamic>),
  manufacturerAuthorizationLetter:
      json['manufacturerAuthorizationLetter'] == null
      ? null
      : ManufacturerAuthorizationLetter.fromJson(
          json['manufacturerAuthorizationLetter'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ImpDocumentsToJson(
  ImpDocuments instance,
) => <String, dynamic>{
  'cacCertificate': instance.cacCertificate,
  'companyLogo': instance.companyLogo,
  'importPermit': instance.importPermit,
  'manufacturerAuthorizationLetter': instance.manufacturerAuthorizationLetter,
};
