import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: '_id')
  String? id;
  String? medicationType;
  String? medicationName;
  String? time;
  String? date;
  String? status;
  String? note;
  String? doseId;
  String? reminderId;

  Datum({
    this.id,
    this.medicationType,
    this.medicationName,
    this.time,
    this.date,
    this.status,
    this.note,
    this.doseId,
    this.reminderId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
