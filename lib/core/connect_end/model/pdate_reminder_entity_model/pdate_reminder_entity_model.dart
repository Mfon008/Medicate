import 'payment.dart';

class PdateReminderEntityModel {
  String? dosage;
  int? timesPerDay;
  List<String>? notificationChannels;
  Payment? payment;

  PdateReminderEntityModel({
    this.dosage,
    this.timesPerDay,
    this.notificationChannels,
    this.payment,
  });

  factory PdateReminderEntityModel.fromJson(Map<String, dynamic> json) {
    return PdateReminderEntityModel(
      dosage: json['dosage'] as String?,
      timesPerDay: json['timesPerDay'] as int?,
      notificationChannels: json['notificationChannels'] as List<String>?,
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'dosage': dosage,
    'timesPerDay': timesPerDay,
    'notificationChannels': notificationChannels,
    'payment': payment?.toJson(),
  };
}
