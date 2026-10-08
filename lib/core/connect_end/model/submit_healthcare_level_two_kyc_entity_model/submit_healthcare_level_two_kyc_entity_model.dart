import 'bank_details.dart';
import 'medical_license_certificate.dart';
import 'proof_of_physical_address.dart';
import 'tax_identification_number_document.dart';

class SubmitHealthcareLevelTwoKycEntityModel {
  MedicalLicenseCertificate? medicalLicenseCertificate;
  TaxIdentificationNumberDocument? taxIdentificationNumberDocument;
  ProofOfPhysicalAddress? proofOfPhysicalAddress;
  BankDetails? bankDetails;

  SubmitHealthcareLevelTwoKycEntityModel({
    this.medicalLicenseCertificate,
    this.taxIdentificationNumberDocument,
    this.proofOfPhysicalAddress,
    this.bankDetails,
  });

  factory SubmitHealthcareLevelTwoKycEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SubmitHealthcareLevelTwoKycEntityModel(
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
    );
  }

  Map<String, dynamic> toJson() => {
    'medicalLicenseCertificate': medicalLicenseCertificate?.toJson(),
    'taxIdentificationNumberDocument': taxIdentificationNumberDocument
        ?.toJson(),
    'proofOfPhysicalAddress': proofOfPhysicalAddress?.toJson(),
    'bankDetails': bankDetails?.toJson(),
  };
}
