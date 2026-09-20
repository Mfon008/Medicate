import 'package:json_annotation/json_annotation.dart';

part 'import_permit.g.dart';

@JsonSerializable()
class ImportPermit {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  ImportPermit({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory ImportPermit.fromJson(Map<String, dynamic> json) {
    return _$ImportPermitFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImportPermitToJson(this);
}
