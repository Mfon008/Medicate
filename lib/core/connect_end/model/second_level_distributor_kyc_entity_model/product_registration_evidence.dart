import 'package:json_annotation/json_annotation.dart';

part 'product_registration_evidence.g.dart';

@JsonSerializable()
class ProductRegistrationEvidence {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  ProductRegistrationEvidence({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory ProductRegistrationEvidence.fromJson(Map<String, dynamic> json) {
    return _$ProductRegistrationEvidenceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductRegistrationEvidenceToJson(this);
}
