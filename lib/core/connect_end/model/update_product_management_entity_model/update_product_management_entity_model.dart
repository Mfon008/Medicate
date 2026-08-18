import 'image.dart';
import 'volume_pricing.dart';

class UpdateProductManagementEntityModel {
  String? productName;
  String? description;
  // String? distributorId;
  String? categoryId;
  String? sku;
  int? packSize;
  String? unit;
  int? minimumOrderQuantity;
  int? pricePerUnit;
  int? stock;
  String? nafdacRegistrationNumber;
  String? batchNumber;
  String? serialNumber;
  String? manufacturedDate;
  String? expiryDate;
  List<Image>? images;
  List<VolumePricing>? volumePricing;

  UpdateProductManagementEntityModel({
    this.productName,
    this.description,
    // this.distributorId,
    this.categoryId,
    this.sku,
    this.packSize,
    this.unit,
    this.minimumOrderQuantity,
    this.pricePerUnit,
    this.stock,
    this.nafdacRegistrationNumber,
    this.batchNumber,
    this.serialNumber,
    this.manufacturedDate,
    this.expiryDate,
    this.images,
    this.volumePricing,
  });

  factory UpdateProductManagementEntityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UpdateProductManagementEntityModel(
      productName: json['productName'] as String?,
      description: json['description'] as String?,
      // distributorId: json['distributorId'] as String?,
      categoryId: json['categoryId'] as String?,
      sku: json['sku'] as String?,
      packSize: json['packSize'] as int?,
      unit: json['unit'] as String?,
      minimumOrderQuantity: json['minimumOrderQuantity'] as int?,
      pricePerUnit: json['pricePerUnit'] as int?,
      stock: json['stock'] as int?,
      nafdacRegistrationNumber: json['nafdacRegistrationNumber'] as String?,
      batchNumber: json['batchNumber'] as String?,
      serialNumber: json['serialNumber'] as String?,
      manufacturedDate: json['manufacturedDate'] as String?,
      expiryDate: json['expiryDate'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumePricing: (json['volumePricing'] as List<dynamic>?)
          ?.map((e) => VolumePricing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'productName': productName,
    'description': description,
    // 'distributorId': distributorId,
    'categoryId': categoryId,
    'sku': sku,
    'packSize': packSize,
    'unit': unit,
    'minimumOrderQuantity': minimumOrderQuantity,
    'pricePerUnit': pricePerUnit,
    'stock': stock,
    'nafdacRegistrationNumber': nafdacRegistrationNumber,
    'batchNumber': batchNumber,
    'serialNumber': serialNumber,
    'manufacturedDate': manufacturedDate,
    'expiryDate': expiryDate,
    'images': images?.map((e) => e.toJson()).toList(),
    'volumePricing': volumePricing?.map((e) => e.toJson()).toList(),
  };
}
