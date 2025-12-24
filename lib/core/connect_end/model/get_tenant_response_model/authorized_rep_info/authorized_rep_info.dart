import 'package:json_annotation/json_annotation.dart';

import 'means_of_id.dart';

part 'authorized_rep_info.g.dart';

@JsonSerializable()
class AuthorizedRepInfo {
  String? fullName;
  String? phone;
  String? email;
  MeansOfId? meansOfId;
  String? meansOfIdType;

  AuthorizedRepInfo({
    this.fullName,
    this.phone,
    this.email,
    this.meansOfId,
    this.meansOfIdType,
  });

  factory AuthorizedRepInfo.fromJson(Map<String, dynamic> json) {
    return _$AuthorizedRepInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthorizedRepInfoToJson(this);
}
