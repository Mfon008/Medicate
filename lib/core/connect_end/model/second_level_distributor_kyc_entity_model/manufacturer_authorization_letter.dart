import 'package:json_annotation/json_annotation.dart';

part 'manufacturer_authorization_letter.g.dart';

@JsonSerializable()
class ManufacturerAuthorizationLetter {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  ManufacturerAuthorizationLetter({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory ManufacturerAuthorizationLetter.fromJson(Map<String, dynamic> json) {
    return _$ManufacturerAuthorizationLetterFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ManufacturerAuthorizationLetterToJson(this);
  }
}
