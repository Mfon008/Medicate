import 'package:json_annotation/json_annotation.dart';

part 'proof_of_physical_address.g.dart';

@JsonSerializable()
class ProofOfPhysicalAddress {
  String? url;
  String? mimeType;
  int? width;
  int? height;
  int? size;
  String? format;

  ProofOfPhysicalAddress({
    this.url,
    this.mimeType,
    this.width,
    this.height,
    this.size,
    this.format,
  });

  factory ProofOfPhysicalAddress.fromJson(Map<String, dynamic> json) {
    return _$ProofOfPhysicalAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProofOfPhysicalAddressToJson(this);
}
