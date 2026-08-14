import 'package:json_annotation/json_annotation.dart';

part 'pharmaceutical_distribution_license.g.dart';

@JsonSerializable()
class PharmaceuticalDistributionLicense {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  PharmaceuticalDistributionLicense({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory PharmaceuticalDistributionLicense.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$PharmaceuticalDistributionLicenseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PharmaceuticalDistributionLicenseToJson(this);
  }
}
