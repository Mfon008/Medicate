import 'dependent.dart';

class PlanSpecific {
  String? familyMedicalHistory;
  List<Dependent>? dependents;

  PlanSpecific({this.familyMedicalHistory, this.dependents});

  factory PlanSpecific.fromJson(Map<String, dynamic> json) => PlanSpecific(
    familyMedicalHistory: json['familyMedicalHistory'] as String?,
    dependents: (json['dependents'] as List<dynamic>?)
        ?.map((e) => Dependent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'familyMedicalHistory': familyMedicalHistory,
    'dependents': dependents?.map((e) => e.toJson()).toList(),
  };
}
