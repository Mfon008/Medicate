import 'package:json_annotation/json_annotation.dart';

import 'distributor.dart';
import 'importer.dart';
import 'manufacturer.dart';

part 'kyc.g.dart';

@JsonSerializable()
class Kyc {
  List<String>? businessTypes;
  Distributor? distributor;
  Manufacturer? manufacturer;
  Importer? importer;

  Kyc({this.businessTypes, this.distributor, this.manufacturer, this.importer});

  factory Kyc.fromJson(Map<String, dynamic> json) => _$KycFromJson(json);

  Map<String, dynamic> toJson() => _$KycToJson(this);
}
