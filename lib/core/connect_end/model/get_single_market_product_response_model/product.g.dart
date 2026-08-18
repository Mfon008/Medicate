// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as String?,
  productName: json['productName'] as String?,
  description: json['description'] as String?,
  creationSource: json['creationSource'] as String?,
  manufacturerDistributorId: json['manufacturerDistributorId'] as String?,
  manufacturerDistributorName: json['manufacturerDistributorName'] as String?,
  categoryId: json['categoryId'] as String?,
  category: json['category'] as String?,
  categorySlug: json['categorySlug'] as String?,
  sku: json['sku'] as String?,
  packSize: (json['packSize'] as num?)?.toInt(),
  unit: json['unit'] as String?,
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
  pricePerUnit: (json['pricePerUnit'] as num?)?.toInt(),
  stock: (json['stock'] as num?)?.toInt(),
  nafdacRegistrationNumber: json['nafdacRegistrationNumber'] as String?,
  nafdacVerified: json['nafdacVerified'] as bool?,
  nafdacVerification: json['nafdacVerification'] == null
      ? null
      : NafdacVerification.fromJson(
          json['nafdacVerification'] as Map<String, dynamic>,
        ),
  batchNumber: json['batchNumber'] as String?,
  serialNumber: json['serialNumber'] as String?,
  manufacturedDate: json['manufacturedDate'] == null
      ? null
      : DateTime.parse(json['manufacturedDate'] as String),
  expiryDate: json['expiryDate'] == null
      ? null
      : DateTime.parse(json['expiryDate'] as String),
  images: (json['images'] as List<dynamic>?)
      ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
      .toList(),
  isPublished: json['isPublished'] as bool?,
  isDeleted: json['isDeleted'] as bool?,
  volumePricing: json['volumePricing'] as List<dynamic>?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  updatedByAdminId: json['updatedByAdminId'] as String?,
  categoryDetails: json['categoryDetails'] == null
      ? null
      : CategoryDetails.fromJson(
          json['categoryDetails'] as Map<String, dynamic>,
        ),
  companyDetails: json['companyDetails'] == null
      ? null
      : CompanyDetails.fromJson(json['companyDetails'] as Map<String, dynamic>),
  categoryMarginPercentage: (json['categoryMarginPercentage'] as num?)?.toInt(),
  platformMarginPercentage: (json['platformMarginPercentage'] as num?)?.toInt(),
  basePricePerUnit: (json['basePricePerUnit'] as num?)?.toInt(),
  enlistedPricePerUnit: (json['enlistedPricePerUnit'] as num?)?.toInt(),
  displayPricePerUnit: (json['displayPricePerUnit'] as num?)?.toInt(),
  priceDetails: json['priceDetails'] == null
      ? null
      : PriceDetails.fromJson(json['priceDetails'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'productName': instance.productName,
  'description': instance.description,
  'creationSource': instance.creationSource,
  'manufacturerDistributorId': instance.manufacturerDistributorId,
  'manufacturerDistributorName': instance.manufacturerDistributorName,
  'categoryId': instance.categoryId,
  'category': instance.category,
  'categorySlug': instance.categorySlug,
  'sku': instance.sku,
  'packSize': instance.packSize,
  'unit': instance.unit,
  'minimumOrderQuantity': instance.minimumOrderQuantity,
  'pricePerUnit': instance.pricePerUnit,
  'stock': instance.stock,
  'nafdacRegistrationNumber': instance.nafdacRegistrationNumber,
  'nafdacVerified': instance.nafdacVerified,
  'nafdacVerification': instance.nafdacVerification,
  'batchNumber': instance.batchNumber,
  'serialNumber': instance.serialNumber,
  'manufacturedDate': instance.manufacturedDate?.toIso8601String(),
  'expiryDate': instance.expiryDate?.toIso8601String(),
  'images': instance.images,
  'isPublished': instance.isPublished,
  'isDeleted': instance.isDeleted,
  'volumePricing': instance.volumePricing,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'updatedByAdminId': instance.updatedByAdminId,
  'id': instance.id,
  'categoryDetails': instance.categoryDetails,
  'companyDetails': instance.companyDetails,
  'categoryMarginPercentage': instance.categoryMarginPercentage,
  'platformMarginPercentage': instance.platformMarginPercentage,
  'basePricePerUnit': instance.basePricePerUnit,
  'enlistedPricePerUnit': instance.enlistedPricePerUnit,
  'displayPricePerUnit': instance.displayPricePerUnit,
  'priceDetails': instance.priceDetails,
};
