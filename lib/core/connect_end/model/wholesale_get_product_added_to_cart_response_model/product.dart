import 'package:json_annotation/json_annotation.dart';

import 'category_details.dart';
import 'company_details.dart';
import 'image.dart';
import 'nafdac_verification.dart';
import 'price_details.dart';
import 'volume_pricing.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  String? id;
  String? productName;
  String? manufacturerName;
  String? description;
  String? creationSource;
  String? manufacturerDistributorId;
  String? manufacturerDistributorName;
  String? categoryId;
  String? category;
  String? categorySlug;
  String? sku;
  int? packSize;
  String? unit;
  int? minimumOrderQuantity;
  int? pricePerUnit;
  int? stock;
  String? nafdacRegistrationNumber;
  bool? nafdacVerified;
  NafdacVerification? nafdacVerification;
  String? batchNumber;
  String? serialNumber;
  DateTime? manufacturedDate;
  DateTime? expiryDate;
  List<Image>? images;
  List<VolumePricing>? volumePricing;
  bool? isPublished;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByAdminId;
  CategoryDetails? categoryDetails;
  CompanyDetails? companyDetails;
  int? categoryMarginPercentage;
  int? platformMarginPercentage;
  int? basePricePerUnit;
  int? enlistedPricePerUnit;
  int? displayPricePerUnit;
  PriceDetails? priceDetails;

  Product({
    this.id,
    this.productName,
    this.description,
    this.manufacturerName,
    this.creationSource,
    this.manufacturerDistributorId,
    this.manufacturerDistributorName,
    this.categoryId,
    this.category,
    this.categorySlug,
    this.sku,
    this.packSize,
    this.unit,
    this.minimumOrderQuantity,
    this.pricePerUnit,
    this.stock,
    this.nafdacRegistrationNumber,
    this.nafdacVerified,
    this.nafdacVerification,
    this.batchNumber,
    this.serialNumber,
    this.manufacturedDate,
    this.expiryDate,
    this.images,
    this.volumePricing,
    this.isPublished,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.updatedByAdminId,
    this.categoryDetails,
    this.companyDetails,
    this.categoryMarginPercentage,
    this.platformMarginPercentage,
    this.basePricePerUnit,
    this.enlistedPricePerUnit,
    this.displayPricePerUnit,
    this.priceDetails,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
