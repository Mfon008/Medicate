import 'package:json_annotation/json_annotation.dart';

part 'list_of_hospitals.g.dart';

@JsonSerializable()
class ListOfHospitals {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  ListOfHospitals({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory ListOfHospitals.fromJson(Map<String, dynamic> json) {
    return _$ListOfHospitalsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListOfHospitalsToJson(this);
}
