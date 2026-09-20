import 'package:json_annotation/json_annotation.dart';

import 'business_details.dart';
import 'documents.dart';

part 'manufacturer.g.dart';

@JsonSerializable()
class Manufacturer {
  BusinessDetails? businessDetails;
  Documents? documents;

  Manufacturer({this.businessDetails, this.documents});

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return _$ManufacturerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ManufacturerToJson(this);
}
