import 'package:json_annotation/json_annotation.dart';

part 'company_details.g.dart';

@JsonSerializable()
class CompanyDetails {
  String? id;
  String? name;

  CompanyDetails({this.id, this.name});

  factory CompanyDetails.fromJson(Map<String, dynamic> json) {
    return _$CompanyDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyDetailsToJson(this);
}
