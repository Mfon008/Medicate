import 'package:json_annotation/json_annotation.dart';

import 'membership.dart';
import 'user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? accessToken;
  String? refreshToken;
  User? user;
  List<Membership>? memberships;

  Data({this.accessToken, this.refreshToken, this.user, this.memberships});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
