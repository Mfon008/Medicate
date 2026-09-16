import 'distributor.dart';
import 'importer.dart';
import 'manufacturer.dart';

class LevelTwoDistributorKycEntityModel {
  List<String>? businessTypes;
  Distributor? distributor;
  Manufacturer? manufacturer;
  Importer? importer;

  LevelTwoDistributorKycEntityModel({
    this.businessTypes,
    this.distributor,
    this.manufacturer,
    this.importer,
  });

  factory LevelTwoDistributorKycEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LevelTwoDistributorKycEntityModel(
      businessTypes: json['businessTypes'] as List<String>?,
      distributor: json['distributor'] == null
          ? null
          : Distributor.fromJson(json['distributor'] as Map<String, dynamic>),
      manufacturer: json['manufacturer'] == null
          ? null
          : Manufacturer.fromJson(json['manufacturer'] as Map<String, dynamic>),
      importer: json['importer'] == null
          ? null
          : Importer.fromJson(json['importer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'businessTypes': businessTypes,
    'distributor': distributor?.toJson(),
    'manufacturer': manufacturer?.toJson(),
    'importer': importer?.toJson(),
  };
}
