import 'business_details.dart';
import 'documents.dart';

class Importer {
  BusinessDetails? businessDetails;
  Documents? documents;

  Importer({this.businessDetails, this.documents});

  factory Importer.fromJson(Map<String, dynamic> json) => Importer(
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
