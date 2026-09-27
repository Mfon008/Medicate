import 'package:json_annotation/json_annotation.dart';

part 'coverage_areas.g.dart';

@JsonSerializable()
class CoverageAreas {
  String? state;
  List<String>? lgas;

  CoverageAreas({this.state, this.lgas});

  factory CoverageAreas.fromJson(Map<String, dynamic> json) {
    return _$CoverageAreasFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoverageAreasToJson(this);
}
