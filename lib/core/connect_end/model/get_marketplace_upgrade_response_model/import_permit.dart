import 'package:json_annotation/json_annotation.dart';

part 'import_permit.g.dart';

@JsonSerializable()
class ImportPermit {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  ImportPermit({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory ImportPermit.fromJson(Map<String, dynamic> json) {
    return _$ImportPermitFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImportPermitToJson(this);
}
