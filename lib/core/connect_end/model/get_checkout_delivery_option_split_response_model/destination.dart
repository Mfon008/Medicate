import 'package:json_annotation/json_annotation.dart';

part 'destination.g.dart';

@JsonSerializable()
class Destination {
  String? stateCode;
  String? stateName;
  String? lgaCode;
  String? lgaName;

  Destination({this.stateCode, this.stateName, this.lgaCode, this.lgaName});

  factory Destination.fromJson(Map<String, dynamic> json) {
    return _$DestinationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}
