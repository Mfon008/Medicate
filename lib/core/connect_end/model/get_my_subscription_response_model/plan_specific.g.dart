// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_specific.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanSpecific _$PlanSpecificFromJson(Map<String, dynamic> json) => PlanSpecific(
  medicalHistory: json['medicalHistory'] as String?,
  hasChronicAilment: json['hasChronicAilment'] as bool?,
  chronicAilmentDetails: json['chronicAilmentDetails'] as String?,
  familyMedicalHistory: json['familyMedicalHistory'] as String?,
  dependents: (json['dependents'] as List<dynamic>?)
      ?.map((e) => Dependent.fromJson(e as Map<String, dynamic>))
      .toList(),
  organizationName: json['organizationName'] as String?,
  cacNumber: json['cacNumber'] as String?,
  hrContactName: json['hrContactName'] as String?,
  hrContactPhone: json['hrContactPhone'] as String?,
  hrContactEmail: json['hrContactEmail'] as String?,
  staffCount: (json['staffCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$PlanSpecificToJson(PlanSpecific instance) =>
    <String, dynamic>{
      'medicalHistory': instance.medicalHistory,
      'hasChronicAilment': instance.hasChronicAilment,
      'chronicAilmentDetails': instance.chronicAilmentDetails,
      'familyMedicalHistory': instance.familyMedicalHistory,
      'dependents': instance.dependents,
      'organizationName': instance.organizationName,
      'cacNumber': instance.cacNumber,
      'hrContactName': instance.hrContactName,
      'hrContactPhone': instance.hrContactPhone,
      'hrContactEmail': instance.hrContactEmail,
      'staffCount': instance.staffCount,
    };
