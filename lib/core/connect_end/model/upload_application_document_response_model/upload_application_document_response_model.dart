import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'upload_application_document_response_model.g.dart';

@JsonSerializable()
class UploadApplicationDocumentResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  UploadApplicationDocumentResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory UploadApplicationDocumentResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$UploadApplicationDocumentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UploadApplicationDocumentResponseModelToJson(this);
  }
}
