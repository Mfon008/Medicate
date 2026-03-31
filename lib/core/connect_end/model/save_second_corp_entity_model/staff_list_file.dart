class StaffListFile {
  String? uploadId;

  StaffListFile({this.uploadId});

  factory StaffListFile.fromJson(Map<String, dynamic> json) =>
      StaffListFile(uploadId: json['uploadId'] as String?);

  Map<String, dynamic> toJson() => {'uploadId': uploadId};
}
