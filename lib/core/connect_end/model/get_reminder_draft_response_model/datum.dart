import 'package:json_annotation/json_annotation.dart';

import 'payload.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? id;
  String? userId;
  dynamic tenantId;
  String? title;
  Payload? payload;
  bool? paymentInitiated;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.tenantId,
    this.title,
    this.payload,
    this.paymentInitiated,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
