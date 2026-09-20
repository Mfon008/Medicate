import 'package:json_annotation/json_annotation.dart';

part 'nafdac_manufacturing_license.g.dart';

@JsonSerializable()
class NafdacManufacturingLicense {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  NafdacManufacturingLicense({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory NafdacManufacturingLicense.fromJson(Map<String, dynamic> json) {
    return _$NafdacManufacturingLicenseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NafdacManufacturingLicenseToJson(this);
}
