class GmpCertificate {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  GmpCertificate({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory GmpCertificate.fromJson(Map<String, dynamic> json) {
    return GmpCertificate(
      url: json['url'] as String?,
      mimeType: json['mimeType'] as String?,
      size: json['size'] as int?,
      format: json['format'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'url': url,
    'mimeType': mimeType,
    'size': size,
    'format': format,
    'width': width,
    'height': height,
  };
}
