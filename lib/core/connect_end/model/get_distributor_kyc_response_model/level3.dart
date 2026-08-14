import 'package:json_annotation/json_annotation.dart';

part 'level3.g.dart';

@JsonSerializable()
class Level3 {
  String? bankName;
  String? accountName;
  String? accountNumber;
  String? bvn;

  Level3({this.bankName, this.accountName, this.accountNumber, this.bvn});

  factory Level3.fromJson(Map<String, dynamic> json) {
    return _$Level3FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Level3ToJson(this);
}
