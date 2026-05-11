import 'package:json_annotation/json_annotation.dart';

import 'application_form.dart';
import 'bank_detail.dart';
import 'cac_certificate.dart';
import 'hmo_accreditation.dart';
import 'kyc_level.dart';
import 'list_of_hospitals.dart';
import 'logo.dart';
import 'schedule_of_plans.dart';
import 'tax_id_certificate.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? hmoId;
  List<KycLevel>? kycLevels;
  Logo? logo;
  CacCertificate? cacCertificate;
  HmoAccreditation? hmoAccreditation;
  TaxIdCertificate? taxIdCertificate;
  ApplicationForm? applicationForm;
  ScheduleOfPlans? scheduleOfPlans;
  ListOfHospitals? listOfHospitals;
  List<BankDetail>? bankDetails;

  Data({
    this.hmoId,
    this.kycLevels,
    this.logo,
    this.cacCertificate,
    this.hmoAccreditation,
    this.taxIdCertificate,
    this.applicationForm,
    this.scheduleOfPlans,
    this.listOfHospitals,
    this.bankDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
