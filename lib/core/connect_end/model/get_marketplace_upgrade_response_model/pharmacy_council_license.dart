import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_council_license.g.dart';

@JsonSerializable()
class PharmacyCouncilLicense {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  PharmacyCouncilLicense({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory PharmacyCouncilLicense.fromJson(Map<String, dynamic> json) {
    return _$PharmacyCouncilLicenseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PharmacyCouncilLicenseToJson(this);
}
