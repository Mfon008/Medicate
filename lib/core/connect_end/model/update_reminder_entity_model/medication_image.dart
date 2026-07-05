class MedicationImage {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;
  String? key;

  MedicationImage({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
    this.key,
  });

  factory MedicationImage.fromJson(Map<String, dynamic> json) {
    return MedicationImage(
      url: json['url'] as String?,
      mimeType: json['mimeType'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      size: json['size'] as int?,
      format: json['format'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'url': url,
    'mimeType': mimeType,
    'width': width,
    'height': height,
    'size': size,
    'format': format,
    'key': key,
  };
}
