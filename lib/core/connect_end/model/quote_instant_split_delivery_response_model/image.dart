import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  Image({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
