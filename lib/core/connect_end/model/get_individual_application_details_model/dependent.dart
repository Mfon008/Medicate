class Dependent {
  String? fullName;
  String? relationship;
  DateTime? dob;
  String? gender;

  Dependent({this.fullName, this.relationship, this.dob, this.gender});

  factory Dependent.fromJson(Map<String, dynamic> json) => Dependent(
    fullName: json['fullName'] as String?,
    relationship: json['relationship'] as String?,
    dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    gender: json['gender'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'relationship': relationship,
    'dob': dob?.toIso8601String(),
    'gender': gender,
  };
}
