import 'package:json_annotation/json_annotation.dart';

import 'kyc_level.dart';
import 'level1.dart';
import 'level2.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? pharmacyId;
  String? kycStatus;
  List<KycLevel>? kycLevels;
  Level1? level1;
  Level2? level2;
  int? currentLevel;
  int? completionPercentage;

  Data({
    this.pharmacyId,
    this.kycStatus,
    this.kycLevels,
    this.level1,
    this.level2,
    this.currentLevel,
    this.completionPercentage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
