import 'package:json_annotation/json_annotation.dart';

import 'application_form.dart';
import 'bank_information.dart';
import 'list_of_hospitals.dart';
import 'schedule_of_plans.dart';

part 'level3.g.dart';

@JsonSerializable()
class Level3 {
  BankInformation? bankInformation;
  ApplicationForm? applicationForm;
  ScheduleOfPlans? scheduleOfPlans;
  ListOfHospitals? listOfHospitals;

  Level3({
    this.bankInformation,
    this.applicationForm,
    this.scheduleOfPlans,
    this.listOfHospitals,
  });

  factory Level3.fromJson(Map<String, dynamic> json) {
    return _$Level3FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level3ToJson(this);
}
