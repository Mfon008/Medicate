class PatientDetails {
  String? fullName;
  String? phoneNumber;
  String? email;

  PatientDetails({this.fullName, this.phoneNumber, this.email});

  factory PatientDetails.fromJson(Map<String, dynamic> json) {
    return PatientDetails(
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'phoneNumber': phoneNumber,
    'email': email,
  };
}
