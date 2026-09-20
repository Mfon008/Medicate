import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_council_license.g.dart';

@JsonSerializable()
class PharmacyCouncilLicense {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  PharmacyCouncilLicense({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory PharmacyCouncilLicense.fromJson(Map<String, dynamic> json) {
    return _$PharmacyCouncilLicenseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PharmacyCouncilLicenseToJson(this);
}
