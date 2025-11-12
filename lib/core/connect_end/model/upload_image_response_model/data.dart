import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  Data({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
