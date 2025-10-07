import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  Data({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
