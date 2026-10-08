import 'package:json_annotation/json_annotation.dart';

import 'kyc_level.dart';
import 'level1.dart';
import 'level2.dart';
import 'level3.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? hmoId;
  String? kycStatus;
  List<KycLevel>? kycLevels;
  int? currentLevel;
  int? completionPercentage;
  Level1? level1;
  Level2? level2;
  Level3? level3;

  Data({
    this.hmoId,
    this.kycStatus,
    this.kycLevels,
    this.currentLevel,
    this.completionPercentage,
    this.level1,
    this.level2,
    this.level3,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
