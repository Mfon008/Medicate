class AdvanceFullfillmentEntityModel {
  String? requestId;
  int? expectedRevision;

  AdvanceFullfillmentEntityModel({this.requestId, this.expectedRevision});

  factory AdvanceFullfillmentEntityModel.fromJson(Map<String, dynamic> json) {
    return AdvanceFullfillmentEntityModel(
      requestId: json['requestId'] as String?,
      expectedRevision: json['expectedRevision'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'requestId': requestId,
    'expectedRevision': expectedRevision,
  };
}
