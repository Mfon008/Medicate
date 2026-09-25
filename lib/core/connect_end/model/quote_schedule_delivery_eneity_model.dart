class QuoteScheduleDeliveryEneityModel {
  String? deliveryMethod;
  String? deliveryDate;
  String? deliveryAddressId;
  String? timeBlockStart;
  String? timeBlockEnd;

  QuoteScheduleDeliveryEneityModel({
    this.deliveryMethod,
    this.deliveryDate,
    this.deliveryAddressId,
    this.timeBlockStart,
    this.timeBlockEnd,
  });

  factory QuoteScheduleDeliveryEneityModel.fromJson(Map<String, dynamic> json) {
    return QuoteScheduleDeliveryEneityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryDate: json['deliveryDate'] as String?,
      deliveryAddressId: json['deliveryAddressId'] as String?,
      timeBlockStart: json['timeBlockStart'] as String?,
      timeBlockEnd: json['timeBlockEnd'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'deliveryDate': deliveryDate,
    'deliveryAddressId': deliveryAddressId,
    'timeBlockStart': timeBlockStart,
    'timeBlockEnd': timeBlockEnd,
  };
}
