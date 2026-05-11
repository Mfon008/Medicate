import 'package:json_annotation/json_annotation.dart';

part 'application_form.g.dart';

@JsonSerializable()
class ApplicationForm {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  ApplicationForm({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory ApplicationForm.fromJson(Map<String, dynamic> json) {
    return _$ApplicationFormFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplicationFormToJson(this);
}
