import 'delivery_details.dart';

class PlaceOrderWalletEntityModel {
  String? deliveryMethod;
  String? deliveryDate;
  DeliveryDetails? deliveryDetails;
  String? paymentMethod;
  double? expectedSubtotal;
  int? expectedDeliveryFee;
  double? expectedTotal;
  String? stateCode;
  String? lgaCode;
  String? timeBlockStart;
  String? timeBlockEnd;

  PlaceOrderWalletEntityModel({
    this.deliveryMethod,
    this.deliveryDate,
    this.deliveryDetails,
    this.paymentMethod,
    this.expectedSubtotal,
    this.expectedDeliveryFee,
    this.expectedTotal,
    this.stateCode,
    this.lgaCode,
    this.timeBlockStart,
    this.timeBlockEnd,
  });

  factory PlaceOrderWalletEntityModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderWalletEntityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryDate: json['deliveryDate'] as String?,
      deliveryDetails: json['deliveryDetails'] == null
          ? null
          : DeliveryDetails.fromJson(
              json['deliveryDetails'] as Map<String, dynamic>,
            ),
      paymentMethod: json['paymentMethod'] as String?,
      expectedSubtotal: (json['expectedSubtotal'] as num?)?.toDouble(),
      expectedDeliveryFee: json['expectedDeliveryFee'] as int?,
      expectedTotal: (json['expectedTotal'] as num?)?.toDouble(),
      stateCode: json['stateCode'] as String?,
      lgaCode: json['lgaCode'] as String?,
      timeBlockStart: json['timeBlockStart'] as String?,
      timeBlockEnd: json['timeBlockEnd'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'deliveryDate': deliveryDate,
    'deliveryDetails': deliveryDetails?.toJson(),
    'paymentMethod': paymentMethod,
    'expectedSubtotal': expectedSubtotal,
    'expectedDeliveryFee': expectedDeliveryFee,
    'expectedTotal': expectedTotal,
    'stateCode': stateCode,
    'lgaCode': lgaCode,
    'timeBlockStart': timeBlockStart,
    'timeBlockEnd': timeBlockEnd,
  };
}
