import 'package:json_annotation/json_annotation.dart';

part 'hmo_accreditation.g.dart';

@JsonSerializable()
class HmoAccreditation {
  String? url;
  String? mimeType;
  int? size;
  int? width;
  int? height;
  String? format;

  HmoAccreditation({
    this.url,
    this.mimeType,
    this.size,
    this.width,
    this.height,
    this.format,
  });

  factory HmoAccreditation.fromJson(Map<String, dynamic> json) {
    return _$HmoAccreditationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HmoAccreditationToJson(this);
}
