import 'package:json_annotation/json_annotation.dart';

part 'gmp_certificate.g.dart';

@JsonSerializable()
class GmpCertificate {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  GmpCertificate({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory GmpCertificate.fromJson(Map<String, dynamic> json) {
    return _$GmpCertificateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GmpCertificateToJson(this);
}
