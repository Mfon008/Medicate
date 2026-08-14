import 'package:json_annotation/json_annotation.dart';

part 'nafdac.g.dart';

@JsonSerializable()
class Nafdac {
  String? registrationNumber;
  bool? isVerified;
  String? productName;
  String? manufacturer;
  String? status;
  DateTime? verifiedAt;
  String? source;

  Nafdac({
    this.registrationNumber,
    this.isVerified,
    this.productName,
    this.manufacturer,
    this.status,
    this.verifiedAt,
    this.source,
  });

  factory Nafdac.fromJson(Map<String, dynamic> json) {
    return _$NafdacFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NafdacToJson(this);
}
