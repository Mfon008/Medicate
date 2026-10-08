import 'package:json_annotation/json_annotation.dart';

part 'tax_id_certificate.g.dart';

@JsonSerializable()
class TaxIdCertificate {
  String? url;
  String? mimeType;
  int? size;
  int? width;
  int? height;
  String? format;

  TaxIdCertificate({
    this.url,
    this.mimeType,
    this.size,
    this.width,
    this.height,
    this.format,
  });

  factory TaxIdCertificate.fromJson(Map<String, dynamic> json) {
    return _$TaxIdCertificateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaxIdCertificateToJson(this);
}
