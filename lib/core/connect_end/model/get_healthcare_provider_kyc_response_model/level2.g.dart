// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level2 _$Level2FromJson(Map<String, dynamic> json) => Level2(
  medicalLicenseCertificate: json['medicalLicenseCertificate'] == null
      ? null
      : MedicalLicenseCertificate.fromJson(
          json['medicalLicenseCertificate'] as Map<String, dynamic>,
        ),
  taxIdentificationNumberDocument:
      json['taxIdentificationNumberDocument'] == null
      ? null
      : TaxIdentificationNumberDocument.fromJson(
          json['taxIdentificationNumberDocument'] as Map<String, dynamic>,
        ),
  proofOfPhysicalAddress: json['proofOfPhysicalAddress'] == null
      ? null
      : ProofOfPhysicalAddress.fromJson(
          json['proofOfPhysicalAddress'] as Map<String, dynamic>,
        ),
  bankDetails: json['bankDetails'] == null
      ? null
      : BankDetails.fromJson(json['bankDetails'] as Map<String, dynamic>),
  pendingBankChange: json['pendingBankChange'] == null
      ? null
      : PendingBankChange.fromJson(
          json['pendingBankChange'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$Level2ToJson(Level2 instance) => <String, dynamic>{
  'medicalLicenseCertificate': instance.medicalLicenseCertificate,
  'taxIdentificationNumberDocument': instance.taxIdentificationNumberDocument,
  'proofOfPhysicalAddress': instance.proofOfPhysicalAddress,
  'bankDetails': instance.bankDetails,
  'pendingBankChange': instance.pendingBankChange,
};
