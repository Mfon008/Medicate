import 'benefit.dart';

class CreateHmoPlanEntityModel {
  String? planName;
  String? planType;
  String? planTier;
  String? description;
  int? price;
  int? duration;
  List<String>? hospitalNetworkIds;
  List<Benefit>? benefits;

  CreateHmoPlanEntityModel({
    this.planName,
    this.planType,
    this.planTier,
    this.description,
    this.price,
    this.duration,
    this.hospitalNetworkIds,
    this.benefits,
  });

  factory CreateHmoPlanEntityModel.fromJson(Map<String, dynamic> json) {
    return CreateHmoPlanEntityModel(
      planName: json['planName'] as String?,
      planType: json['planType'] as String?,
      planTier: json['planTier'] as String?,
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
    'planType': planType,
    'planTier': planTier,
    'description': description,
    'price': price,
    'duration': duration,
    'hospitalNetworkIds': hospitalNetworkIds,
    'benefits': benefits?.map((e) => e.toJson()).toList(),
  };
}
