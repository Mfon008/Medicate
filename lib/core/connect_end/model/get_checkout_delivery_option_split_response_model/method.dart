import 'package:json_annotation/json_annotation.dart';

part 'method.g.dart';

@JsonSerializable()
class Method {
  String? method;
  bool? available;
  int? deliveryFee;
  List<dynamic>? unavailableReasons;

  Method({
    this.method,
    this.available,
    this.deliveryFee,
    this.unavailableReasons,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return _$MethodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}
