import 'package:json_annotation/json_annotation.dart';

part 'phone.g.dart';

@JsonSerializable()
class Phone {
  String? phoneNumber;
  bool? isVerified;
  @JsonKey(name: '_id')
  String? id;

  Phone({this.phoneNumber, this.isVerified, this.id});

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneToJson(this);
}
