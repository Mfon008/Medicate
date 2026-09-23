import 'package:json_annotation/json_annotation.dart';

part 'business_addresses.g.dart';

@JsonSerializable()
class BusinessAddresses {
  String? id;
  String? businessAddress;
  String? country;
  String? state;
  String? lga;

  BusinessAddresses({
    this.id,
    this.businessAddress,
    this.country,
    this.state,
    this.lga,
  });

  factory BusinessAddresses.fromJson(Map<String, dynamic> json) {
    return _$BusinessAddressesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessAddressesToJson(this);
}
