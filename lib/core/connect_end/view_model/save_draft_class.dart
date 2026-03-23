class IndividualRubyFirstDraft {
  String? fullName;
  String? dob;
  String? gender;
  String? phoneNumber;
  String? residentialAddress;
  String? filteredState;
  String? selectedHospital;

  IndividualRubyFirstDraft({
    this.fullName,
    this.dob,
    this.gender,
    this.phoneNumber,
    this.residentialAddress,
    this.filteredState,
    this.selectedHospital,
  });

  factory IndividualRubyFirstDraft.fromJson(Map<String, dynamic> json) {
    return IndividualRubyFirstDraft(
      fullName: json['fullName'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      residentialAddress: json['residentialAddress'] as String?,
      filteredState: json['filteredState'] as String?,
      selectedHospital: json['selectedHospital'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'dob': dob,
    'gender': gender,
    'phoneNumber': phoneNumber,
    'residentialAddress': residentialAddress,
    'filteredState': filteredState,
    'selectedHospital': selectedHospital,
  };
}

class IndividualRubySecondDraft {
  String? medicationHistory;
  String? medicalHistoryDetails;

  IndividualRubySecondDraft({
    this.medicalHistoryDetails,
    this.medicationHistory,
  });

  factory IndividualRubySecondDraft.fromJson(Map<String, dynamic> json) {
    return IndividualRubySecondDraft(
      medicationHistory: json['medicationHistory'] as String?,
      medicalHistoryDetails: json['medicalHistoryDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'medicalHistory': medicationHistory,
    'medicalHistoryDetails': medicalHistoryDetails,
  };
}
