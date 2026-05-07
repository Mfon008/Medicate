class HospitalNetworkEntityModel {
  List<String>? hospitalNetworkIds;

  HospitalNetworkEntityModel({this.hospitalNetworkIds});

  factory HospitalNetworkEntityModel.fromJson(Map<String, dynamic> json) {
    return HospitalNetworkEntityModel(
      hospitalNetworkIds: json['hospitalNetworkIds'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {'hospitalNetworkIds': hospitalNetworkIds};
}
