import 'package:json_annotation/json_annotation.dart';

part 'means_of_id.g.dart';

@JsonSerializable()
class MeansOfId {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  MeansOfId({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory MeansOfId.fromJson(Map<String, dynamic> json) {
    return _$MeansOfIdFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MeansOfIdToJson(this);
}
