import 'package:json_annotation/json_annotation.dart';

part 'hmo_logo.g.dart';

@JsonSerializable()
class HmoLogo {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  HmoLogo({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory HmoLogo.fromJson(Map<String, dynamic> json) {
    return _$HmoLogoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HmoLogoToJson(this);
}
