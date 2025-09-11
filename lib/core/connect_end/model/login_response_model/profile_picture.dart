import 'package:json_annotation/json_annotation.dart';

part 'profile_picture.g.dart';

@JsonSerializable()
class ProfilePicture {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;
  @JsonKey(name: '_id')
  String? id;

  ProfilePicture({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
    this.id,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) {
    return _$ProfilePictureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfilePictureToJson(this);
}
