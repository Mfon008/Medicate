import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? id;
  String? channel;
  int? unitPrice;
  String? currency;
  bool? isActive;
  bool? isPaid;
  bool? configured;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.channel,
    this.unitPrice,
    this.currency,
    this.isActive,
    this.isPaid,
    this.configured,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
