import 'package:json_annotation/json_annotation.dart';

part 'category_details.g.dart';

@JsonSerializable()
class CategoryDetails {
  String? id;
  String? name;
  String? slug;
  int? marginPercentage;

  CategoryDetails({this.id, this.name, this.slug, this.marginPercentage});

  factory CategoryDetails.fromJson(Map<String, dynamic> json) {
    return _$CategoryDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryDetailsToJson(this);
}
