import 'package:json_annotation/json_annotation.dart';

part 'means_of_id_document.g.dart';

@JsonSerializable()
class MeansOfIdDocument {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  MeansOfIdDocument({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory MeansOfIdDocument.fromJson(Map<String, dynamic> json) {
    return _$MeansOfIdDocumentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MeansOfIdDocumentToJson(this);
}
