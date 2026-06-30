import 'benefit.dart';

class UpdateHmoPlanEntityModel {
  String? planName;
  String? description;
  int? price;
  int? duration;
  List<Benefit>? benefits;
  List<String>? hospitalNetworkIds;

  UpdateHmoPlanEntityModel({
    this.planName,
    this.description,
    this.price,
    this.duration,
    this.benefits,
    this.hospitalNetworkIds,
  });

  factory UpdateHmoPlanEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateHmoPlanEntityModel(
      planName: json['planName'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      duration: json['duration'] as int?,
      hospitalNetworkIds: json['hospitalNetworkIds'] as List<String>?,
      benefits: (json['benefits'] as List<dynamic>?)
          ?.map((e) => Benefit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'planName': planName,
    'description': description,
    'price': price,
    'duration': duration,
    'hospitalNetworkIds': hospitalNetworkIds,
    'benefits': benefits?.map((e) => e.toJson()).toList(),
  };
}
