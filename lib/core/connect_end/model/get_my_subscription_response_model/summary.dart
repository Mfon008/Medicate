import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable()
class Summary {
  int? all;
  int? active;
  int? expiringSoon;
  int? expired;
  int? underReview;
  int? draft;
  int? rejected;

  Summary({
    this.all,
    this.active,
    this.expiringSoon,
    this.expired,
    this.underReview,
    this.draft,
    this.rejected,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return _$SummaryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}
