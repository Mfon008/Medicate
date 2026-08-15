import 'image.dart';
import 'volume_pricing.dart';

class CreateDistributorProductEntityModel {
  String? productName;
  String? description;
  String? categoryId;
  String? sku;
  int? packSize;
  String? unit;
  int? minimumOrderQuantity;
  int? pricePerUnit;
  int? stock;
  String? nafdacRegistrationNumber;
  String? batchNumber;
  String? manufacturedDate;
  String? expiryDate;
  List<Image>? images;
  List<VolumePricing>? volumePricing;
  String? serialNumber;

  CreateDistributorProductEntityModel({
    this.productName,
    this.description,
    this.categoryId,
    this.sku,
    this.packSize,
    this.unit,
    this.minimumOrderQuantity,
    this.pricePerUnit,
    this.stock,
    this.nafdacRegistrationNumber,
    this.batchNumber,
    this.manufacturedDate,
    this.expiryDate,
    this.images,
    this.volumePricing,
    this.serialNumber,
  });

  factory CreateDistributorProductEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateDistributorProductEntityModel(
      productName: json['productName'] as String?,
      description: json['description'] as String?,
      categoryId: json['categoryId'] as String?,
      sku: json['sku'] as String?,
      packSize: json['packSize'] as int?,
      unit: json['unit'] as String?,
      minimumOrderQuantity: json['minimumOrderQuantity'] as int?,
      pricePerUnit: json['pricePerUnit'] as int?,
      stock: json['stock'] as int?,
      nafdacRegistrationNumber: json['nafdacRegistrationNumber'] as String?,
      batchNumber: json['batchNumber'] as String?,
      manufacturedDate: json['manufacturedDate'] as String?,
      expiryDate: json['expiryDate'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumePricing: (json['volumePricing'] as List<dynamic>?)
          ?.map((e) => VolumePricing.fromJson(e as Map<String, dynamic>))
          .toList(),
      serialNumber: json['serialNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'productName': productName,
    'description': description,
    'categoryId': categoryId,
    'sku': sku,
    'packSize': packSize,
    'unit': unit,
    'minimumOrderQuantity': minimumOrderQuantity,
    'pricePerUnit': pricePerUnit,
    'stock': stock,
    'nafdacRegistrationNumber': nafdacRegistrationNumber,
    'batchNumber': batchNumber,
    'manufacturedDate': manufacturedDate,
    'expiryDate': expiryDate,
    'images': images?.map((e) => e.toJson()).toList(),
    'volumePricing': volumePricing?.map((e) => e.toJson()).toList(),
    'serialNumber': serialNumber,
  };
}
