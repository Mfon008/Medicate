import 'package:json_annotation/json_annotation.dart';

part 'nafdac_permit.g.dart';

@JsonSerializable()
class NafdacPermit {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  NafdacPermit({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory NafdacPermit.fromJson(Map<String, dynamic> json) {
    return _$NafdacPermitFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NafdacPermitToJson(this);
}
