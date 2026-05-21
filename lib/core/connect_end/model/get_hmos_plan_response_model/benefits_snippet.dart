import 'package:json_annotation/json_annotation.dart';

part 'benefits_snippet.g.dart';

@JsonSerializable()
class BenefitsSnippet {
  String? description;
  String? coverageLimit;

  BenefitsSnippet({this.description, this.coverageLimit});

  factory BenefitsSnippet.fromJson(Map<String, dynamic> json) {
    return _$BenefitsSnippetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BenefitsSnippetToJson(this);
}
