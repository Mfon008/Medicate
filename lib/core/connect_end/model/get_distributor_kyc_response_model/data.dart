import 'package:json_annotation/json_annotation.dart';

import 'kyc_level.dart';
import 'level1.dart';
import 'level2.dart';
import 'level3.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? distributorId;
  String? kycStatus;
  List<KycLevel>? kycLevels;
  Level1? level1;
  Level2? level2;
  Level3? level3;
  List<String>? businessTypes;
  int? currentLevel;
  int? completionPercentage;

  Data({
    this.distributorId,
    this.kycStatus,
    this.kycLevels,
    this.level1,
    this.level2,
    this.level3,
    this.businessTypes,
    this.currentLevel,
    this.completionPercentage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
