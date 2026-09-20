import 'package:json_annotation/json_annotation.dart';

part 'level1.g.dart';

@JsonSerializable()
class Level1 {
  String? distributorManufacturerName;
  String? phoneNumber;
  String? registrationNumber;
  String? businessAddress;
  String? country;
  String? state;
  String? lga;

  Level1({
    this.distributorManufacturerName,
    this.phoneNumber,
    this.registrationNumber,
    this.businessAddress,
    this.country,
    this.state,
    this.lga,
  });

  factory Level1.fromJson(Map<String, dynamic> json) {
    return _$Level1FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level1ToJson(this);
}
