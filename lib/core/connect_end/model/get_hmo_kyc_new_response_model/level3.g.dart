// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level3 _$Level3FromJson(Map<String, dynamic> json) => Level3(
  bankInformation: json['bankInformation'] == null
      ? null
      : BankInformation.fromJson(
          json['bankInformation'] as Map<String, dynamic>,
        ),
  applicationForm: json['applicationForm'] == null
      ? null
      : ApplicationForm.fromJson(
          json['applicationForm'] as Map<String, dynamic>,
        ),
  scheduleOfPlans: json['scheduleOfPlans'] == null
      ? null
      : ScheduleOfPlans.fromJson(
          json['scheduleOfPlans'] as Map<String, dynamic>,
        ),
  listOfHospitals: json['listOfHospitals'] == null
      ? null
      : ListOfHospitals.fromJson(
          json['listOfHospitals'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$Level3ToJson(Level3 instance) => <String, dynamic>{
  'bankInformation': instance.bankInformation,
  'applicationForm': instance.applicationForm,
  'scheduleOfPlans': instance.scheduleOfPlans,
  'listOfHospitals': instance.listOfHospitals,
};
