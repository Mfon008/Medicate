import 'package:json_annotation/json_annotation.dart';

part 'hospital_network.g.dart';

@JsonSerializable()
class HospitalNetwork {
  String? id;
  String? name;
  String? type;
  String? state;
  String? city;
  String? address;
  String? phone;
  String? email;
  bool? isActive;

  HospitalNetwork({
    this.id,
    this.name,
    this.type,
    this.state,
    this.city,
    this.address,
    this.phone,
    this.email,
    this.isActive,
  });

  factory HospitalNetwork.fromJson(Map<String, dynamic> json) {
    return _$HospitalNetworkFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HospitalNetworkToJson(this);
}
