import 'application_form.dart';
import 'list_of_hospitals.dart';
import 'schedule_of_plans.dart';

class UpdateThirdHmoKycEntityModel {
  String? bankName;
  String? accountName;
  String? accountNumber;
  ApplicationForm? applicationForm;
  ScheduleOfPlans? scheduleOfPlans;
  ListOfHospitals? listOfHospitals;

  UpdateThirdHmoKycEntityModel({
    this.bankName,
    this.accountName,
    this.accountNumber,
    this.applicationForm,
    this.scheduleOfPlans,
    this.listOfHospitals,
  });

  factory UpdateThirdHmoKycEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateThirdHmoKycEntityModel(
      bankName: json['bankName'] as String?,
      accountName: json['accountName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      applicationForm: json['applicationForm'] == null
          ? null
          : ApplicationForm.fromJson(
              json['applicationForm'] as Map<String, dynamic>,
            ),
      scheduleOfPlans: json['scheduleOfPlans'] == null
          ? null
          : ScheduleOfPlans.fromJson(
              json['scheduleOfPlans'] as Map<String, dynamic>,
            ),
      listOfHospitals: json['listOfHospitals'] == null
          ? null
          : ListOfHospitals.fromJson(
              json['listOfHospitals'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'bankName': bankName,
    'accountName': accountName,
    'accountNumber': accountNumber,
    'applicationForm': applicationForm?.toJson(),
    'scheduleOfPlans': scheduleOfPlans?.toJson(),
    'listOfHospitals': listOfHospitals?.toJson(),
  };
}
