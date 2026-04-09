import 'package:json_annotation/json_annotation.dart';

import 'dependent.dart';

part 'plan_specific.g.dart';

@JsonSerializable()
class PlanSpecific {
  String? medicalHistory;
  bool? hasChronicAilment;
  String? chronicAilmentDetails;
  String? familyMedicalHistory;
  List<Dependent>? dependents;
  String? organizationName;
  String? cacNumber;
  String? hrContactName;
  String? hrContactPhone;
  String? hrContactEmail;
  int? staffCount;

  PlanSpecific({
    this.medicalHistory,
    this.hasChronicAilment,
    this.chronicAilmentDetails,
    this.familyMedicalHistory,
    this.dependents,
    this.organizationName,
    this.cacNumber,
    this.hrContactName,
    this.hrContactPhone,
    this.hrContactEmail,
    this.staffCount,
  });

  factory PlanSpecific.fromJson(Map<String, dynamic> json) {
    return _$PlanSpecificFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlanSpecificToJson(this);
}
