import 'package:json_annotation/json_annotation.dart';

part 'cac_certificate.g.dart';

@JsonSerializable()
class CacCertificate {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  CacCertificate({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory CacCertificate.fromJson(Map<String, dynamic> json) {
    return _$CacCertificateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CacCertificateToJson(this);
}
