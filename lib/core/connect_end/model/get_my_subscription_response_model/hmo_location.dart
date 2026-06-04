import 'package:json_annotation/json_annotation.dart';

part 'hmo_location.g.dart';

@JsonSerializable()
class HmoLocation {
  String? state;
  String? address;

  HmoLocation({this.state, this.address});

  factory HmoLocation.fromJson(Map<String, dynamic> json) {
    return _$HmoLocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HmoLocationToJson(this);
}
