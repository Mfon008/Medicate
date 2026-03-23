import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  String? documentType;
  String? originalName;

  Document({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.documentType,
    this.originalName,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return _$DocumentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
