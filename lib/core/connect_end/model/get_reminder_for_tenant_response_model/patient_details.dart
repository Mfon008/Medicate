import 'package:json_annotation/json_annotation.dart';

part 'patient_details.g.dart';

@JsonSerializable()
class PatientDetails {
  String? fullName;
  String? phoneNumber;
  String? email;

  PatientDetails({this.fullName, this.phoneNumber, this.email});

  factory PatientDetails.fromJson(Map<String, dynamic> json) {
    return _$PatientDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientDetailsToJson(this);
}
