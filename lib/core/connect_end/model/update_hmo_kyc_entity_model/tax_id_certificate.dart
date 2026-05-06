class TaxIdCertificate {
  String? url;
  String? mimeType;
  int? size;
  String? format;

  TaxIdCertificate({this.url, this.mimeType, this.size, this.format});

  factory TaxIdCertificate.fromJson(Map<String, dynamic> json) {
    return TaxIdCertificate(
      url: json['url'] as String?,
      mimeType: json['mimeType'] as String?,
      size: json['size'] as int?,
      format: json['format'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'url': url,
    'mimeType': mimeType,
    'size': size,
    'format': format,
  };
}
