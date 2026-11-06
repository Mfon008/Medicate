import 'package:json_annotation/json_annotation.dart';

part 'current_allocation.g.dart';

@JsonSerializable()
class CurrentAllocation {
  String? orderItemId;
  String? productId;
  int? quantity;
  String? state;
  int? generation;

  CurrentAllocation({
    this.orderItemId,
    this.productId,
    this.quantity,
    this.state,
    this.generation,
  });

  factory CurrentAllocation.fromJson(Map<String, dynamic> json) {
    return _$CurrentAllocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentAllocationToJson(this);
}
