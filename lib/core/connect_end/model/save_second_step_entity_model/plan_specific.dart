class PlanSpecific {
  String? medicalHistory;
  bool? hasChronicAilment;
  String? chronicAilmentDetails;

  PlanSpecific({
    this.medicalHistory,
    this.hasChronicAilment,
    this.chronicAilmentDetails,
  });

  factory PlanSpecific.fromJson(Map<String, dynamic> json) => PlanSpecific(
    medicalHistory: json['medicalHistory'] as String?,
    hasChronicAilment: json['hasChronicAilment'] as bool?,
    chronicAilmentDetails: json['chronicAilmentDetails'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'medicalHistory': medicalHistory,
    'hasChronicAilment': hasChronicAilment,
    'chronicAilmentDetails': chronicAilmentDetails,
  };
}
