import 'package:json_annotation/json_annotation.dart';

import 'subscription.dart';
import 'summary.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  Summary? summary;
  List<Subscription>? subscriptions;

  Data({this.summary, this.subscriptions});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
