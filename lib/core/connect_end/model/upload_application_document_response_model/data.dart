import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? uploadId;
  String? originalName;
  String? url;
  String? mimeType;
  int? size;
  String? format;

  Data({
    this.uploadId,
    this.originalName,
    this.url,
    this.mimeType,
    this.size,
    this.format,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
