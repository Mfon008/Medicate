import 'package:json_annotation/json_annotation.dart';

part 'benefit.g.dart';

@JsonSerializable()
class Benefit {
  String? description;
  String? coverageLimit;

  Benefit({this.description, this.coverageLimit});

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return _$BenefitFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BenefitToJson(this);
}
