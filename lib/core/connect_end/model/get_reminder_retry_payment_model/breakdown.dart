import 'package:json_annotation/json_annotation.dart';

part 'breakdown.g.dart';

@JsonSerializable()
class Breakdown {
  String? channel;
  int? unitPrice;
  int? units;
  int? amount;
  String? currency;
  bool? isPaid;

  Breakdown({
    this.channel,
    this.unitPrice,
    this.units,
    this.amount,
    this.currency,
    this.isPaid,
  });

  factory Breakdown.fromJson(Map<String, dynamic> json) {
    return _$BreakdownFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BreakdownToJson(this);
}
