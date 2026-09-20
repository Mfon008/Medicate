import 'package:json_annotation/json_annotation.dart';

part 'pharmaceutical_distribution_license.g.dart';

@JsonSerializable()
class PharmaceuticalDistributionLicense {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  PharmaceuticalDistributionLicense({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
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
