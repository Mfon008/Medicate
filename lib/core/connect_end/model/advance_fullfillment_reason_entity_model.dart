class AdvanceFullfillmentReasonEntityModel {
  String? requestId;
  int? expectedRevision;
  String? reason;

  AdvanceFullfillmentReasonEntityModel({
    this.requestId,
    this.expectedRevision,
    this.reason,
  });

  factory AdvanceFullfillmentReasonEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AdvanceFullfillmentReasonEntityModel(
      requestId: json['requestId'] as String?,
      expectedRevision: json['expectedRevision'] as int?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'requestId': requestId,
    'expectedRevision': expectedRevision,
    'reason': reason,
  };
}
