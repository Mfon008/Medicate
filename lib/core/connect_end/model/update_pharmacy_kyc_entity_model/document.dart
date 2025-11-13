
class Document {
  String? documentType;
  dynamic file;

  Document({this.documentType, this.file});

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    documentType: json['documentType'] as String?,
    file: json['file'],
  );

  Map<String, dynamic> toJson() => {
    'documentType': documentType,
    'file': file?.toJson(),
  };
}
