import 'business_details.dart';
import 'documents.dart';

class Manufacturer {
  BusinessDetails? businessDetails;
  Documents? documents;

  Manufacturer({this.businessDetails, this.documents});

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
    businessDetails: json['businessDetails'] == null
        ? null
        : BusinessDetails.fromJson(
            json['businessDetails'] as Map<String, dynamic>,
          ),
    documents: json['documents'] == null
        ? null
        : Documents.fromJson(json['documents'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'businessDetails': businessDetails?.toJson(),
    'documents': documents?.toJson(),
  };
}
