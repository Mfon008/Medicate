import 'package:json_annotation/json_annotation.dart';

import 'business_details.dart';
import 'documents.dart';

part 'distributor.g.dart';

@JsonSerializable()
class Distributor {
  BusinessDetails? businessDetails;
  Documents? documents;

  Distributor({this.businessDetails, this.documents});

  factory Distributor.fromJson(Map<String, dynamic> json) {
    return _$DistributorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DistributorToJson(this);
}
