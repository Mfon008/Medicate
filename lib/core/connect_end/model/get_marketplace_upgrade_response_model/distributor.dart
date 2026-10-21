import 'package:json_annotation/json_annotation.dart';

import 'business_details.dart';
import 'coverage_area.dart';
import 'market_documents.dart';

part 'distributor.g.dart';

@JsonSerializable()
class Distributor {
  BusinessDetails? businessDetails;
  MarketDocuments? documents;
  List<CoverageArea>? coverageAreas;

  Distributor({this.businessDetails, this.documents, this.coverageAreas});

  factory Distributor.fromJson(Map<String, dynamic> json) {
    return _$DistributorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DistributorToJson(this);
}
