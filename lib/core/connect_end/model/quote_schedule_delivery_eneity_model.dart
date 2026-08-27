class QuoteScheduleDeliveryEneityModel {
  String? deliveryMethod;
  String? deliveryDate;
  String? stateCode;
  String? lgaCode;
  String? timeBlockStart;
  String? timeBlockEnd;

  QuoteScheduleDeliveryEneityModel({
    this.deliveryMethod,
    this.deliveryDate,
    this.stateCode,
    this.lgaCode,
    this.timeBlockStart,
    this.timeBlockEnd,
  });

  factory QuoteScheduleDeliveryEneityModel.fromJson(Map<String, dynamic> json) {
    return QuoteScheduleDeliveryEneityModel(
      deliveryMethod: json['deliveryMethod'] as String?,
      deliveryDate: json['deliveryDate'] as String?,
      stateCode: json['stateCode'] as String?,
      lgaCode: json['lgaCode'] as String?,
      timeBlockStart: json['timeBlockStart'] as String?,
      timeBlockEnd: json['timeBlockEnd'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'deliveryMethod': deliveryMethod,
    'deliveryDate': deliveryDate,
    'stateCode': stateCode,
    'lgaCode': lgaCode,
    'timeBlockStart': timeBlockStart,
    'timeBlockEnd': timeBlockEnd,
  };
}
