import 'package:json_annotation/json_annotation.dart';

part 'manufacturer_authorization_letter.g.dart';

@JsonSerializable()
class ManufacturerAuthorizationLetter {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  ManufacturerAuthorizationLetter({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory ManufacturerAuthorizationLetter.fromJson(Map<String, dynamic> json) {
    return _$ManufacturerAuthorizationLetterFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ManufacturerAuthorizationLetterToJson(this);
  }
}
