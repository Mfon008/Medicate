import 'package:json_annotation/json_annotation.dart';

part 'company_logo.g.dart';

@JsonSerializable()
class CompanyLogo {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  CompanyLogo({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory CompanyLogo.fromJson(Map<String, dynamic> json) {
    return _$CompanyLogoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyLogoToJson(this);
}
