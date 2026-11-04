import 'package:json_annotation/json_annotation.dart';

part 'contact_person.g.dart';

@JsonSerializable()
class ContactPerson {
  String? name;
  String? phoneNumber;
  String? idType;
  String? address;

  ContactPerson({this.name, this.phoneNumber, this.idType, this.address});

  factory ContactPerson.fromJson(Map<String, dynamic> json) {
    return _$ContactPersonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactPersonToJson(this);
}
