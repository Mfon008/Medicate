import 'package:json_annotation/json_annotation.dart';

import 'distributor.dart';
import 'importer.dart';
import 'manufacturer.dart';

part 'second_level_distributor_kyc_entity_model.g.dart';

@JsonSerializable()
class SecondLevelDistributorKycEntityModel {
  List<String>? businessTypes;
  Distributor? distributor;
  Manufacturer? manufacturer;
  Importer? importer;

  SecondLevelDistributorKycEntityModel({
    this.businessTypes,
    this.distributor,
    this.manufacturer,
    this.importer,
  });

  factory SecondLevelDistributorKycEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$SecondLevelDistributorKycEntityModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SecondLevelDistributorKycEntityModelToJson(this);
  }
}
