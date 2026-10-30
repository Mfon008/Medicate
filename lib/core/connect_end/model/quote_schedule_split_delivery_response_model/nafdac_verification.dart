import 'package:json_annotation/json_annotation.dart';

part 'nafdac_verification.g.dart';

@JsonSerializable()
class NafdacVerification {
  String? registrationNumber;
  bool? isVerified;
  String? productName;
  String? manufacturer;
  String? status;
  DateTime? verifiedAt;

  NafdacVerification({
    this.registrationNumber,
    this.isVerified,
    this.productName,
    this.manufacturer,
    this.status,
    this.verifiedAt,
  });

  factory NafdacVerification.fromJson(Map<String, dynamic> json) {
    return _$NafdacVerificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NafdacVerificationToJson(this);
}
