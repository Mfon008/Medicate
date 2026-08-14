class PharmaceuticalDistributionLicense {
  String? url;
  String? mimeType;
  int? size;
  String? format;
  int? width;
  int? height;

  PharmaceuticalDistributionLicense({
    this.url,
    this.mimeType,
    this.size,
    this.format,
    this.width,
    this.height,
  });

  factory PharmaceuticalDistributionLicense.fromJson(
    Map<String, dynamic> json,
  ) {
    return PharmaceuticalDistributionLicense(
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
