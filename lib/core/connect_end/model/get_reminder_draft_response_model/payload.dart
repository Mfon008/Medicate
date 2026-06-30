import 'package:json_annotation/json_annotation.dart';

import 'medication.dart';

part 'payload.g.dart';

@JsonSerializable()
class Payload {
  List<Medication>? medications;
  String? timeZone;
  List<String>? notificationChannels;
  List<String>? emails;
  List<String>? phoneNumbers;

  Payload({
    this.medications,
    this.timeZone,
    this.notificationChannels,
    this.emails,
    this.phoneNumbers,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    return _$PayloadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}
