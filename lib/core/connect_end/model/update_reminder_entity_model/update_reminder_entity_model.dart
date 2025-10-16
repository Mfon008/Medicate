import 'payment.dart';

class UpdateReminderEntityModel {
  String? dosage;
  int? timesPerDay;
  List<String>? notificationChannels;
  Payment? payment;

  UpdateReminderEntityModel({
    this.dosage,
    this.timesPerDay,
    this.notificationChannels,
    this.payment,
  });

  factory UpdateReminderEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateReminderEntityModel(
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
