import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/save_second_step_response_model/staff_list_file.dart';

part 'plan_specific.g.dart';

@JsonSerializable()
class PlanSpecific {
  String? medicalHistory;
  bool? hasChronicAilment;
  String? chronicAilmentDetails;
  String? familyMedicalHistory;
  String? organizationName;
  String? cacNumber;
  String? hrContactName;
  String? hrContactPhone;
  String? hrContactEmail;
  int? staffCount;
  StaffListFile? staffListFile;

  PlanSpecific({
    this.medicalHistory,
    this.hasChronicAilment,
    this.chronicAilmentDetails,
    this.familyMedicalHistory,
    this.organizationName,
    this.cacNumber,
    this.hrContactName,
    this.hrContactPhone,
    this.hrContactEmail,
    this.staffCount,
    this.staffListFile,
  });

  factory PlanSpecific.fromJson(Map<String, dynamic> json) {
    return _$PlanSpecificFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlanSpecificToJson(this);
}
