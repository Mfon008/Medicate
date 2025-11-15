
import 'package:medicate_app/core/connect_end/model/update_pharmacy_kyc_entity_model/file.dart';

class Document {
  String? documentType;
  File? file;

  Document({this.documentType, this.file});

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    documentType: json['documentType'] as String?,
    file: json['file'],
  );

  Map<String, dynamic> toJson() => {
    'documentType': documentType,
    'file': file,
  };
}
