import 'package:json_annotation/json_annotation.dart';

part 'cac_certificate.g.dart';

@JsonSerializable()
class CacCertificate {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  CacCertificate({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory CacCertificate.fromJson(Map<String, dynamic> json) {
    return _$CacCertificateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CacCertificateToJson(this);
}
