import 'package:json_annotation/json_annotation.dart';

part 'tax_identification_number_document.g.dart';

@JsonSerializable()
class TaxIdentificationNumberDocument {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  TaxIdentificationNumberDocument({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory TaxIdentificationNumberDocument.fromJson(Map<String, dynamic> json) {
    return _$TaxIdentificationNumberDocumentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TaxIdentificationNumberDocumentToJson(this);
  }
}
