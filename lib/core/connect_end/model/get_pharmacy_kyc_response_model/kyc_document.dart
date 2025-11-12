import 'package:json_annotation/json_annotation.dart';

import 'file.dart';

part 'kyc_document.g.dart';

@JsonSerializable()
class KycDocument {
  String? documentType;
  File? file;
  String? status;
  String? uploadedAt;

  KycDocument({this.documentType, this.file, this.status, this.uploadedAt});

  factory KycDocument.fromJson(Map<String, dynamic> json) {
    return _$KycDocumentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KycDocumentToJson(this);
}
