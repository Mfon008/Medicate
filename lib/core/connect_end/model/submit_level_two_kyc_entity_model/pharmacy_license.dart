import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_license.g.dart';

@JsonSerializable()
class PharmacyLicense {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  PharmacyLicense({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory PharmacyLicense.fromJson(Map<String, dynamic> json) {
    return _$PharmacyLicenseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PharmacyLicenseToJson(this);
}
