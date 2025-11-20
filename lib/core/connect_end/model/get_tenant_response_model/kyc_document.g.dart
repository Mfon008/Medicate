// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycDocument _$KycDocumentFromJson(Map<String, dynamic> json) => KycDocument(
  documentType: json['documentType'] as String?,
  file: json['file'] == null
      ? null
      : File.fromJson(json['file'] as Map<String, dynamic>),
  status: json['status'] as String?,
  uploadedAt: json['uploadedAt'] as String?,
);

Map<String, dynamic> _$KycDocumentToJson(KycDocument instance) =>
    <String, dynamic>{
      'documentType': instance.documentType,
      'file': instance.file,
      'status': instance.status,
      'uploadedAt': instance.uploadedAt,
    };
