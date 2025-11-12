import 'package:json_annotation/json_annotation.dart';

import 'kyc_document.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<KycDocument>? kycDocuments;

  Data({this.kycDocuments});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
