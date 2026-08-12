import 'package:json_annotation/json_annotation.dart';

part 'manufacturer_registration_number_model.g.dart';

@JsonSerializable()
class ManufacturerRegistrationNumberModel {
  String? phone;
  String? distributorManufacturerName;
  String? registrationNumber;
  String? businessAddress;

  ManufacturerRegistrationNumberModel({
    this.phone,
    this.distributorManufacturerName,
    this.registrationNumber,
    this.businessAddress,
  });

  factory ManufacturerRegistrationNumberModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ManufacturerRegistrationNumberModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ManufacturerRegistrationNumberModelToJson(this);
  }
}
