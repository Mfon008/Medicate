import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable()
class Hospital {
  String? id;
  String? name;
  String? type;
  String? state;
  String? city;
  String? address;
  String? phone;
  String? email;
  bool? isActive;
  String? hmoId;

  Hospital({
    this.id,
    this.name,
    this.type,
    this.state,
    this.city,
    this.address,
    this.phone,
    this.email,
    this.isActive,
    this.hmoId,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return _$HospitalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}
