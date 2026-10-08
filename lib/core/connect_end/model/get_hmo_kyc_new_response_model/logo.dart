import 'package:json_annotation/json_annotation.dart';

part 'logo.g.dart';

@JsonSerializable()
class Logo {
  String? url;
  String? mimeType;
  int? size;
  int? width;
  int? height;
  String? format;

  Logo({
    this.url,
    this.mimeType,
    this.size,
    this.width,
    this.height,
    this.format,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);

  Map<String, dynamic> toJson() => _$LogoToJson(this);
}
