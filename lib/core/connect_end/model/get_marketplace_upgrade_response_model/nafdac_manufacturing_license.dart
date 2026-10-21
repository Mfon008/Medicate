import 'package:json_annotation/json_annotation.dart';

part 'nafdac_manufacturing_license.g.dart';

@JsonSerializable()
class NafdacManufacturingLicense {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  NafdacManufacturingLicense({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory NafdacManufacturingLicense.fromJson(Map<String, dynamic> json) {
    return _$NafdacManufacturingLicenseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NafdacManufacturingLicenseToJson(this);
}
