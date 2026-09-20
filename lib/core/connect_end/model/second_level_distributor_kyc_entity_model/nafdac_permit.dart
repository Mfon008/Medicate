import 'package:json_annotation/json_annotation.dart';

part 'nafdac_permit.g.dart';

@JsonSerializable()
class NafdacPermit {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  NafdacPermit({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory NafdacPermit.fromJson(Map<String, dynamic> json) {
    return _$NafdacPermitFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NafdacPermitToJson(this);
}
