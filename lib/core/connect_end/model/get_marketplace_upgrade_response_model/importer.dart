import 'package:json_annotation/json_annotation.dart';

import 'business_details.dart';
import 'market_documents.dart';

part 'importer.g.dart';

@JsonSerializable()
class Importer {
  BusinessDetails? businessDetails;
  MarketDocuments? documents;

  Importer({this.businessDetails, this.documents});

  factory Importer.fromJson(Map<String, dynamic> json) {
    return _$ImporterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImporterToJson(this);
}
