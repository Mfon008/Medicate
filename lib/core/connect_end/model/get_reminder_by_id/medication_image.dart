import 'package:json_annotation/json_annotation.dart';

part 'medication_image.g.dart';

@JsonSerializable()
class MedicationImage {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;
  @JsonKey(name: '_id')
  String? id;
  String? key;

  MedicationImage({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
    this.key,
    this.id,
  });

  factory MedicationImage.fromJson(Map<String, dynamic> json) {
    return _$MedicationImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicationImageToJson(this);
}
