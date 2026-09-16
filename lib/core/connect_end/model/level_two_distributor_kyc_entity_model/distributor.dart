import 'business_details.dart';
import 'documents.dart';

class Distributor {
  BusinessDetails? businessDetails;
  Documents? documents;

  Distributor({this.businessDetails, this.documents});

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor(
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
