class StaffListFile {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  String? documentType;
  String? originalName;

  StaffListFile({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.documentType,
    this.originalName,
  });

  factory StaffListFile.fromJson(Map<String, dynamic> json) => StaffListFile(
    url: json['url'] as String?,
    mimeType: json['mimeType'] as String?,
    size: json['size'] as int?,
    format: json['format'] as String?,
    documentType: json['documentType'] as String?,
    originalName: json['originalName'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'mimeType': mimeType,
    'size': size,
    'format': format,
    'documentType': documentType,
    'originalName': originalName,
  };
}
