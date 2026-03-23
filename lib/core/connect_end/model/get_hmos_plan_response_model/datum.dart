import 'package:json_annotation/json_annotation.dart';

import 'benefits_snippet.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? id;
  String? planName;
  String? planTier;
  String? planType;
  String? description;
  int? price;
  int? duration;
  List<BenefitsSnippet>? benefitsSnippet;
  int? hospitalCount;

  Datum({
    this.id,
    this.planName,
    this.planTier,
    this.planType,
    this.description,
    this.price,
    this.duration,
    this.benefitsSnippet,
    this.hospitalCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
