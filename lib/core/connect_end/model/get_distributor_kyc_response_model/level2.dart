import 'package:json_annotation/json_annotation.dart';

import 'distributor.dart';
import 'importer.dart';
import 'manufacturer.dart';

part 'level2.g.dart';

@JsonSerializable()
class Level2 {
  List<String>? businessTypes;
  Distributor? distributor;
  Manufacturer? manufacturer;
  Importer? importer;

  Level2({
    this.businessTypes,
    this.distributor,
    this.manufacturer,
    this.importer,
  });

  factory Level2.fromJson(Map<String, dynamic> json) {
    return _$Level2FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level2ToJson(this);
}
