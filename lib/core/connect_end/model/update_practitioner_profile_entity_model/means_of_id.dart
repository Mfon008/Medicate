class MeansOfId {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  MeansOfId({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory MeansOfId.fromJson(Map<String, dynamic> json) => MeansOfId(
    url: json['url'] as String?,
    mimeType: json['mimeType'] as String?,
    width: json['width'] as int?,
    height: json['height'] as int?,
    size: json['size'] as int?,
    format: json['format'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'mimeType': mimeType,
    'width': width,
    'height': height,
    'size': size,
    'format': format,
  };
}
