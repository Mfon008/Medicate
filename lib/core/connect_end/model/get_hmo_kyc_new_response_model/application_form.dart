import 'package:json_annotation/json_annotation.dart';

part 'application_form.g.dart';

@JsonSerializable()
class ApplicationForm {
  String? url;
  String? mimeType;
  int? size;
  int? width;
  int? height;
  String? format;

  ApplicationForm({
    this.url,
    this.mimeType,
    this.size,
    this.width,
    this.height,
    this.format,
  });

  factory ApplicationForm.fromJson(Map<String, dynamic> json) {
    return _$ApplicationFormFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplicationFormToJson(this);
}
