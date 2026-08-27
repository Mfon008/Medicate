import 'delivery_details.dart';

class PlaceOrderAccelerateEntityModel {
  String? deliveryMethod;
  DeliveryDetails? deliveryDetails;
  String? paymentMethod;
  String? callbackUrl;
  int? expectedSubtotal;
  int? expectedDeliveryFee;
  int? expectedTotal;
  String? stateCode;
  String? lgaCode;

  PlaceOrderAccelerateEntityModel({
    this.deliveryMethod,
    this.deliveryDetails,
    this.paymentMethod,
    this.callbackUrl,
    this.expectedSubtotal,
    this.expectedDeliveryFee,
    this.expectedTotal,
    this.stateCode,
    this.lgaCode,
  });

  factory PlaceOrderAccelerateEntityModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderAccelerateEntityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryDetails: json['deliveryDetails'] == null
          ? null
          : DeliveryDetails.fromJson(
              json['deliveryDetails'] as Map<String, dynamic>,
            ),
      paymentMethod: json['paymentMethod'] as String?,
      callbackUrl: json['callbackUrl'] as String?,
      expectedSubtotal: json['expectedSubtotal'] as int?,
      expectedDeliveryFee: json['expectedDeliveryFee'] as int?,
      expectedTotal: json['expectedTotal'] as int?,
      stateCode: json['stateCode'] as String?,
      lgaCode: json['lgaCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'deliveryDetails': deliveryDetails?.toJson(),
    'paymentMethod': paymentMethod,
    'callbackUrl': callbackUrl,
    'expectedSubtotal': expectedSubtotal,
    'expectedDeliveryFee': expectedDeliveryFee,
    'expectedTotal': expectedTotal,
    'stateCode': stateCode,
    'lgaCode': lgaCode,
  };
}
