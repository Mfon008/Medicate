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
  organizationName: json['organizationName'] as String?,
  cacNumber: json['cacNumber'] as String?,
  hrContactName: json['hrContactName'] as String?,
  hrContactPhone: json['hrContactPhone'] as String?,
  hrContactEmail: json['hrContactEmail'] as String?,
  staffCount: (json['staffCount'] as num?)?.toInt(),
  dependent: (json['dependents'] as List<dynamic>?)
      ?.map((e) => Dependent.fromJson(e as Map<String, dynamic>))
      .toList(),
  staffListFile: json['staffListFile'] == null
      ? null
      : StaffListFile.fromJson(json['staffListFile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlanSpecificToJson(PlanSpecific instance) =>
    <String, dynamic>{
      'medicalHistory': instance.medicalHistory,
      'hasChronicAilment': instance.hasChronicAilment,
      'chronicAilmentDetails': instance.chronicAilmentDetails,
      'familyMedicalHistory': instance.familyMedicalHistory,
      'organizationName': instance.organizationName,
      'cacNumber': instance.cacNumber,
      'hrContactName': instance.hrContactName,
      'hrContactPhone': instance.hrContactPhone,
      'hrContactEmail': instance.hrContactEmail,
      'staffCount': instance.staffCount,
      'dependents': instance.dependent,
      'staffListFile': instance.staffListFile,
    };
