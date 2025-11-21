import 'package:json_annotation/json_annotation.dart';

import 'profile.dart';
import 'role.dart';
import 'user.dart';

part 'staff.g.dart';

@JsonSerializable()
class Staff {
  String? membershipId;
  String? status;
  User? user;
  Profile? profile;
  Role? role;

  Staff({this.membershipId, this.status, this.user, this.profile, this.role});

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);

  Map<String, dynamic> toJson() => _$StaffToJson(this);
}
