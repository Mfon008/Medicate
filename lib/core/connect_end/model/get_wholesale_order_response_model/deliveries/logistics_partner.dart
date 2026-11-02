import 'package:json_annotation/json_annotation.dart';

part 'logistics_partner.g.dart';

@JsonSerializable()
class LogisticsPartner {
  String? id;
  String? name;
  String? contactPerson;
  String? phone;
  String? email;
  String? coverageNotes;

  LogisticsPartner({
    this.id,
    this.name,
    this.contactPerson,
    this.phone,
    this.email,
    this.coverageNotes,
  });

  factory LogisticsPartner.fromJson(Map<String, dynamic> json) {
    return _$LogisticsPartnerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogisticsPartnerToJson(this);
}
