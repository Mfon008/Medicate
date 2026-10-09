import 'package:json_annotation/json_annotation.dart';

import 'business_details.dart';
import 'imp_documents.dart';

part 'importer.g.dart';

@JsonSerializable()
class Importer {
  BusinessDetails? businessDetails;
  ImpDocuments? documents;

  Importer({this.businessDetails, this.documents});

  factory Importer.fromJson(Map<String, dynamic> json) {
    return _$ImporterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImporterToJson(this);
}
