import 'package:json_annotation/json_annotation.dart';

part 'cac_certificate.g.dart';

@JsonSerializable()
class CacCertificate {
  String? url;
  String? mimeType;
  int? size;
  int? width;
  int? height;
  String? format;

  CacCertificate({
    this.url,
    this.mimeType,
    this.size,
    this.width,
    this.height,
    this.format,
  });

  factory CacCertificate.fromJson(Map<String, dynamic> json) {
    return _$CacCertificateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CacCertificateToJson(this);
}
