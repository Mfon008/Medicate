import 'package:json_annotation/json_annotation.dart';

part 'coverage_area.g.dart';

@JsonSerializable()
class CoverageArea {
  String? state;
  List<String>? lgas;

  CoverageArea({this.state, this.lgas});

  factory CoverageArea.fromJson(Map<String, dynamic> json) {
    return _$CoverageAreaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoverageAreaToJson(this);
}
