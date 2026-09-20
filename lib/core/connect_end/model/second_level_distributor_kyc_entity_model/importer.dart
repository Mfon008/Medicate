import 'package:json_annotation/json_annotation.dart';

import 'business_details.dart';
import 'documents.dart';

part 'importer.g.dart';

@JsonSerializable()
class Importer {
  BusinessDetails? businessDetails;
  Documents? documents;

  Importer({this.businessDetails, this.documents});

  factory Importer.fromJson(Map<String, dynamic> json) {
    return _$ImporterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImporterToJson(this);
}
