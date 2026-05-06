import 'package:json_annotation/json_annotation.dart';

part 'hospital_network.g.dart';

@JsonSerializable()
class HospitalNetwork {
  String? id;

  HospitalNetwork({this.id});

  factory HospitalNetwork.fromJson(Map<String, dynamic> json) {
    return _$HospitalNetworkFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HospitalNetworkToJson(this);
}
