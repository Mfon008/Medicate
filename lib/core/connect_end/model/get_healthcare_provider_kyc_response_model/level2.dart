import 'package:json_annotation/json_annotation.dart';

import 'bank_details.dart';
import 'medical_license_certificate.dart';
import 'pending_bank_change.dart';
import 'proof_of_physical_address.dart';
import 'tax_identification_number_document.dart';

part 'level2.g.dart';

@JsonSerializable()
class Level2 {
  MedicalLicenseCertificate? medicalLicenseCertificate;
  TaxIdentificationNumberDocument? taxIdentificationNumberDocument;
  ProofOfPhysicalAddress? proofOfPhysicalAddress;
  BankDetails? bankDetails;
  PendingBankChange? pendingBankChange;

  Level2({
    this.medicalLicenseCertificate,
    this.taxIdentificationNumberDocument,
    this.proofOfPhysicalAddress,
    this.bankDetails,
    this.pendingBankChange,
  });

  factory Level2.fromJson(Map<String, dynamic> json) {
    return _$Level2FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level2ToJson(this);
}
