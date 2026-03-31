import 'staff_list_file.dart';

class PlanSpecific {
  String? organizationName;
  String? cacNumber;
  String? hrContactName;
  String? hrContactPhone;
  String? hrContactEmail;
  int? staffCount;
  StaffListFile? staffListFile;

  PlanSpecific({
    this.organizationName,
    this.cacNumber,
    this.hrContactName,
    this.hrContactPhone,
    this.hrContactEmail,
    this.staffCount,
    this.staffListFile,
  });

  factory PlanSpecific.fromJson(Map<String, dynamic> json) => PlanSpecific(
    organizationName: json['organizationName'] as String?,
    cacNumber: json['cacNumber'] as String?,
    hrContactName: json['hrContactName'] as String?,
    hrContactPhone: json['hrContactPhone'] as String?,
    hrContactEmail: json['hrContactEmail'] as String?,
    staffCount: json['staffCount'] as int?,
    staffListFile: json['staffListFile'] == null
        ? null
        : StaffListFile.fromJson(json['staffListFile'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'organizationName': organizationName,
    'cacNumber': cacNumber,
    'hrContactName': hrContactName,
    'hrContactPhone': hrContactPhone,
    'hrContactEmail': hrContactEmail,
    'staffCount': staffCount,
    'staffListFile': staffListFile?.toJson(),
  };
}
