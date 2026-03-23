class Document {
  String? documentType;
  String? uploadId;
  String? docName;

  Document({this.documentType, this.uploadId, this.docName});

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    documentType: json['documentType'] as String?,
    uploadId: json['uploadId'] as String?,
    docName: json['docName'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'documentType': documentType,
    'uploadId': uploadId,
    // 'docName': docName,
  };
}
