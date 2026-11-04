// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_allocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentAllocation _$CurrentAllocationFromJson(Map<String, dynamic> json) =>
    CurrentAllocation(
      orderItemId: json['orderItemId'] as String?,
      productId: json['productId'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      state: json['state'] as String?,
      generation: (json['generation'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CurrentAllocationToJson(CurrentAllocation instance) =>
    <String, dynamic>{
      'orderItemId': instance.orderItemId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'state': instance.state,
      'generation': instance.generation,
    };
