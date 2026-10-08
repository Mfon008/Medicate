import 'package:json_annotation/json_annotation.dart';

part 'medical_license_certificate.g.dart';

@JsonSerializable()
class MedicalLicenseCertificate {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  MedicalLicenseCertificate({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory MedicalLicenseCertificate.fromJson(Map<String, dynamic> json) {
    return _$MedicalLicenseCertificateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalLicenseCertificateToJson(this);
}
