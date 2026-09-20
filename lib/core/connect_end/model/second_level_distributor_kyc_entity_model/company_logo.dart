import 'package:json_annotation/json_annotation.dart';

part 'company_logo.g.dart';

@JsonSerializable()
class CompanyLogo {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  CompanyLogo({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory CompanyLogo.fromJson(Map<String, dynamic> json) {
    return _$CompanyLogoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompanyLogoToJson(this);
}
