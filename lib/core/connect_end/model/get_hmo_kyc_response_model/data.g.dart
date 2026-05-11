// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  hmoId: json['hmoId'] as String?,
  kycLevels: (json['kycLevels'] as List<dynamic>?)
      ?.map((e) => KycLevel.fromJson(e as Map<String, dynamic>))
      .toList(),
  logo: json['logo'] == null
      ? null
      : Logo.fromJson(json['logo'] as Map<String, dynamic>),
  cacCertificate: json['cacCertificate'] == null
      ? null
      : CacCertificate.fromJson(json['cacCertificate'] as Map<String, dynamic>),
  hmoAccreditation: json['hmoAccreditation'] == null
      ? null
      : HmoAccreditation.fromJson(
          json['hmoAccreditation'] as Map<String, dynamic>,
        ),
  taxIdCertificate: json['taxIdCertificate'] == null
      ? null
      : TaxIdCertificate.fromJson(
          json['taxIdCertificate'] as Map<String, dynamic>,
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
  bankDetails: (json['bankDetails'] as List<dynamic>?)
      ?.map((e) => BankDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'hmoId': instance.hmoId,
  'kycLevels': instance.kycLevels,
  'logo': instance.logo,
  'cacCertificate': instance.cacCertificate,
  'hmoAccreditation': instance.hmoAccreditation,
  'taxIdCertificate': instance.taxIdCertificate,
  'applicationForm': instance.applicationForm,
  'scheduleOfPlans': instance.scheduleOfPlans,
  'listOfHospitals': instance.listOfHospitals,
  'bankDetails': instance.bankDetails,
};
