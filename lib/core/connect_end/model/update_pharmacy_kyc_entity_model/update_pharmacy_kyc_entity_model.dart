import 'document.dart';

class UpdatePharmacyKycEntityModel {
  List<Document>? documents;

  UpdatePharmacyKycEntityModel({this.documents});

  factory UpdatePharmacyKycEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdatePharmacyKycEntityModel(
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'documents': documents?.map((e) => e.toJson()).toList(),
  };
}
