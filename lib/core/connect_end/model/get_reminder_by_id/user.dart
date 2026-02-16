class User {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;

  User({this.id, this.fullName, this.email, this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String?,
    fullName: json['fullName'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phone'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'email': email,
    'phone': phoneNumber,
  };
}
