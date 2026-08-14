import 'package:json_annotation/json_annotation.dart';

part 'product_registration_evidence.g.dart';

@JsonSerializable()
class ProductRegistrationEvidence {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  ProductRegistrationEvidence({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory ProductRegistrationEvidence.fromJson(Map<String, dynamic> json) {
    return _$ProductRegistrationEvidenceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductRegistrationEvidenceToJson(this);
}
