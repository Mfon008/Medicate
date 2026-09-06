import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  String? tenantId;
  String? name;
  String? address;
  String? phoneNumber;
  String? state;
  String? lga;

  Customer({
    this.tenantId,
    this.name,
    this.address,
    this.phoneNumber,
    this.state,
    this.lga,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return _$CustomerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
