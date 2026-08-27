import 'package:json_annotation/json_annotation.dart';

part 'delivery_destination.g.dart';

@JsonSerializable()
class DeliveryDestination {
  String? stateCode;
  String? stateName;
  String? lgaCode;
  String? lgaName;

  DeliveryDestination({
    this.stateCode,
    this.stateName,
    this.lgaCode,
    this.lgaName,
  });

  factory DeliveryDestination.fromJson(Map<String, dynamic> json) {
    return _$DeliveryDestinationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliveryDestinationToJson(this);
}
