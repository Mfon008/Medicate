import 'package:json_annotation/json_annotation.dart';

part 'gmp_certificate.g.dart';

@JsonSerializable()
class GmpCertificate {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  GmpCertificate({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory GmpCertificate.fromJson(Map<String, dynamic> json) {
    return _$GmpCertificateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GmpCertificateToJson(this);
}
