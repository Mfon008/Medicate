// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_wallet_split_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderWalletSplitEntityModel _$PlaceOrderWalletSplitEntityModelFromJson(
  Map<String, dynamic> json,
) => PlaceOrderWalletSplitEntityModel(
  deliveryMethod: json['deliveryMethod'] as String?,
  paymentMethod: json['paymentMethod'] as String?,
  splitOrder: json['splitOrder'] as bool?,
  expectedSubtotal: (json['expectedSubtotal'] as num?)?.toDouble(),
  expectedDeliveryFee: (json['expectedDeliveryFee'] as num?)?.toInt(),
  expectedTotal: (json['expectedTotal'] as num?)?.toDouble(),
  deliveryDate: json['deliveryDate'] as String?,
  deliveries: (json['deliveries'] as List<dynamic>?)
      ?.map((e) => Delivery.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PlaceOrderWalletSplitEntityModelToJson(
  PlaceOrderWalletSplitEntityModel instance,
) => <String, dynamic>{
  'deliveryMethod': instance.deliveryMethod,
  'paymentMethod': instance.paymentMethod,
  'splitOrder': instance.splitOrder,
  'expectedSubtotal': instance.expectedSubtotal,
  'expectedDeliveryFee': instance.expectedDeliveryFee,
  'expectedTotal': instance.expectedTotal,
  'deliveryDate': instance.deliveryDate,
  'deliveries': instance.deliveries,
};
