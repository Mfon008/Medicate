import 'package:json_annotation/json_annotation.dart';

part 'hmo_accreditation.g.dart';

@JsonSerializable()
class HmoAccreditation {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  HmoAccreditation({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory HmoAccreditation.fromJson(Map<String, dynamic> json) {
    return _$HmoAccreditationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HmoAccreditationToJson(this);
}
