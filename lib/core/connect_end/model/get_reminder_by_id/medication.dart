import 'package:json_annotation/json_annotation.dart';
import 'package:medicate_app/core/connect_end/model/get_reminder_by_id/medication_image.dart' show MedicationImage;

import 'daily_dose_time.dart';

part 'medication.g.dart';

@JsonSerializable()
class Medication {
	String? medicationName;
	String? medicationType;
	String? dosage;
	DateTime? startDateTime;
	int? durationInDays;
	DateTime? endDateTime;
	String? scheduleType;
	int? timesPerDay;
	String? note;
	List<List<DailyDoseTime>>? dailyDoseTimes;
	String? medicationStatus;
	MedicationImage? medicationImage;
	@JsonKey(name: '_id') 
	String? id;

	Medication({
		this.medicationName, 
		this.medicationType, 
		this.dosage, 
		this.startDateTime, 
		this.durationInDays, 
		this.endDateTime, 
		this.scheduleType, 
		this.timesPerDay, 
		this.note, 
		this.dailyDoseTimes, 
		this.medicationStatus, 
		this.medicationImage, 
		this.id, 
	});

	factory Medication.fromJson(Map<String, dynamic> json) {
		return _$MedicationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MedicationToJson(this);
}
