// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/connect_end/model/distributor_wholesale_category_model/category.dart';
import 'package:medicate_app/core/connect_end/model/nafdac_registration_number_entity_model.dart';
import 'package:medicate_app/core/connect_end/model/update_product_management_entity_model/update_product_management_entity_model.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/manufacturer/product/custom_switch_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/model/create_distributor_product_entity_model/create_distributor_product_entity_model.dart';
import '../../../core/connect_end/model/create_distributor_product_entity_model/volume_pricing.dart';
import '../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';
import 'package:medicate_app/core/connect_end/model/create_distributor_product_entity_model/image.dart'
    as iml;
import 'package:medicate_app/core/connect_end/model/update_product_management_entity_model/image.dart'
    as up;
import 'package:medicate_app/core/connect_end/model/update_product_management_entity_model/volume_pricing.dart'
    as v;

class AddProductScreen extends StatefulWidget {
  AddProductScreen({super.key, this.isEdit, this.productId});
  bool? isEdit;
  String? productId;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<TextEditingController> vPriceController = [TextEditingController()];
  List<VolumePricing> volumnPricelist = [];

  List<TextEditingController> ppuController = [TextEditingController()];
  GlobalKey<FormState> formKeyAddProduct = GlobalKey<FormState>();

  bool isSwitched = false;
  TextEditingController productName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController sku = TextEditingController();
  TextEditingController packSize = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController moq = TextEditingController();
  TextEditingController priceUnit = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController batchNo = TextEditingController();
  TextEditingController serialNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<ManufacturerViewModel>.reactive(
      viewModelBuilder: () => ManufacturerViewModel(),
      onViewModelReady: (model) async {
        model.getWholesaleCategoryList(context);
        if (widget.isEdit!) {
          await model.getSingleProduct(context, productId: widget.productId);
          vPriceController.clear();
          ppuController.clear();
          isSwitched =
              model.getSingleProductResponseModel!.data!.product!.isPublished!;
          productName.text =
              model.getSingleProductResponseModel?.data?.product?.productName ??
              '';
          description.text =
              model.getSingleProductResponseModel?.data?.product?.description ??
              '';
          sku.text =
              model.getSingleProductResponseModel?.data?.product?.sku ?? '';
          packSize.text =
              model.getSingleProductResponseModel?.data?.product?.packSize
                  .toString() ??
              '';
          moq.text =
              model
                  .getSingleProductResponseModel
                  ?.data
                  ?.product
                  ?.minimumOrderQuantity
                  .toString() ??
              '';
          priceUnit.text =
              model.getSingleProductResponseModel?.data?.product?.pricePerUnit
                  .toString() ??
              '';
          stock.text =
              model.getSingleProductResponseModel?.data?.product?.stock
                  .toString() ??
              '';
          batchNo.text =
              model.getSingleProductResponseModel?.data?.product?.batchNumber ??
              '';
          serialNo.text =
              model
                  .getSingleProductResponseModel
                  ?.data
                  ?.product
                  ?.serialNumber ??
              '';
          unit.text =
              model.getSingleProductResponseModel?.data?.product?.unit ?? '';

          model.c = Category(
            id: model
                .getSingleProductResponseModel!
                .data!
                .product!
                .categoryDetails!
                .id,
            name: model
                .getSingleProductResponseModel!
                .data!
                .product!
                .categoryDetails!
                .name,
            slug: model
                .getSingleProductResponseModel!
                .data!
                .product!
                .categoryDetails!
                .slug,
            marginPercentage: model
                .getSingleProductResponseModel!
                .data!
                .product!
                .categoryDetails!
                .marginPercentage,
          );
          model.nafdacRegNoController.text =
              model
                  .getSingleProductResponseModel
                  ?.data
                  ?.product
                  ?.nafdacVerification
                  ?.registrationNumber ??
              '';
          model.manufacturerDateController.text =
              model
                  .getSingleProductResponseModel
                  ?.data
                  ?.product
                  ?.manufacturedDate
                  ?.toString() ??
              '';
          model.expiryDateController.text =
              model.getSingleProductResponseModel?.data?.product?.expiryDate
                  ?.toString() ??
              '';
          model.imagesProductList = model
              .getSingleProductResponseModel!
              .data!
              .product!
              .images!
              .map<iml.Image>((image) => iml.Image.fromJson(image.toJson()))
              .toList();
          for (
            int i = 0;
            i <
                model
                    .getSingleProductResponseModel!
                    .data!
                    .product!
                    .volumePricing!
                    .length;
            i++
          ) {
            ppuController.add(
              TextEditingController(
                text: model
                    .getSingleProductResponseModel!
                    .data!
                    .product!
                    .volumePricing![i]
                    .pricePerUnit
                    .toString(),
              ),
            );
            vPriceController.add(
              TextEditingController(
                text: model
                    .getSingleProductResponseModel!
                    .data!
                    .product!
                    .volumePricing![i]
                    .quantity
                    .toString(),
              ),
            );
          }
        }
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, ManufacturerViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.dashboard,
          appBar: AppBar(
            backgroundColor: AppColors.appWhite,
            surfaceTintColor: Colors.transparent, // removes Material3 tint
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(14.w),
              child: GlobalNavigator(),
            ),
            title: TextView(
              text: widget.isEdit! ? 'Edit Product' : 'Add New Product',
              textStyle: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.deep,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 13.20.w, vertical: 23.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 13.20.w,
                vertical: 23.0.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.appWhite,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Form(
                key: formKeyAddProduct,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormWidget(
                      hint: 'Product Name',
                      label: 'Enter product name',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: productName,
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'Description',
                      label: 'Enter product description',
                      maxline: 4,
                      alignLabelWithHint: true,
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.grey,
                      isFilled: true,
                      controller: description,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'Category',
                      label: '--Select--',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: model.c?.name == ''
                            ? AppColors.infoGrey
                            : AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      readOnly: true,
                      controller: TextEditingController(text: model.c?.name),
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                      suffixWidget: Theme(
                        data: Theme.of(context).copyWith(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.48.w),
                          child: GestureDetector(
                            onTap: () => model.showCategoryMenu(context),
                            child: SvgPicture.asset(AppImage.arrow_down),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'SKU',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: sku,
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'Pack size',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: packSize,
                      validator: AppValidator.validateString(),
                      keyboardType: TextInputType.number,
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'Unit',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: unit,
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'MOQ (Minimum Order Quantity)',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: moq,
                      validator: AppValidator.validateString(),
                      keyboardType: TextInputType.number,
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'Price / unit (₦)',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: priceUnit,
                      validator: AppValidator.validateString(),
                      keyboardType: TextInputType.number,
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'Stock',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: stock,
                      validator: AppValidator.validateString(),
                      keyboardType: TextInputType.number,
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 30.h),
                    TextView(
                      text: 'Batch & Registration Details',
                      textStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16.52.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.reminder,
                        letterSpacing: -0.12,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      color: AppColors.infoGrey,
                      height: 1.h,
                      thickness: 0.2,
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 21.w,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(11.0.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppImage.validate,
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 5.10.h),
                              TextView(
                                text: 'NAFDAC Registration Number',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 14.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
                                ),
                              ),
                              SizedBox(width: 5.10.h),
                              TextView(
                                text: '*',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 14.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14.68.h),
                          Padding(
                            padding: EdgeInsets.only(right: 13.0.w),
                            child: TextFormWidget(
                              label:
                                  model.nafdacRegistrationNumberResponseModel !=
                                          null &&
                                      model
                                          .nafdacRegistrationNumberResponseModel!
                                          .data!
                                          .nafdac!
                                          .isVerified!
                                  ? ''
                                  : 'e.g. 04-9214, 01-9981..',
                              borderColor:
                                  model.nafdacRegistrationNumberResponseModel !=
                                          null &&
                                      model
                                          .nafdacRegistrationNumberResponseModel!
                                          .data!
                                          .nafdac!
                                          .isVerified!
                                  ? AppColors.app_green
                                  : AppColors.transparent,
                              borderTopLeft: 22.r,
                              borderTopRight: 22.r,
                              borderBottomLeft: 22.r,
                              borderBottomRight: 22.r,
                              hintSize: isTablet(context) ? 16.82.sp : 14.60.sp,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'DMSans',
                                fontSize: 15.4.sp,
                                color: AppColors.infoGrey,
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'DMSans',
                                fontSize: 16.sp,
                                color: AppColors.reminder1,
                              ),
                              fillColor: AppColors.white,
                              isFilled: true,
                              readOnly:
                                  model.nafdacRegistrationNumberResponseModel !=
                                          null &&
                                      model
                                          .nafdacRegistrationNumberResponseModel!
                                          .data!
                                          .nafdac!
                                          .isVerified!
                                  ? true
                                  : false,
                              keyboardType: TextInputType.number,
                              controller: model.nafdacRegNoController,
                              validator: AppValidator.validateString(),
                              onChange: (p0) {},
                              suffixWidget:
                                  model.nafdacRegistrationNumberResponseModel !=
                                          null &&
                                      model
                                          .nafdacRegistrationNumberResponseModel!
                                          .data!
                                          .nafdac!
                                          .isVerified!
                                  ? Padding(
                                      padding: EdgeInsets.only(right: 8.w),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: AppColors.app_green,
                                            size: 18.22.sp,
                                          ),
                                          SizedBox(width: 4.w),
                                          TextView(
                                            text: 'Verified',
                                            textStyle: TextStyle(
                                              color: AppColors.app_green,
                                              fontSize: 14.sp,
                                              fontFamily: 'DMSans',
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap:
                                model.nafdacRegistrationNumberResponseModel !=
                                        null &&
                                    model
                                        .nafdacRegistrationNumberResponseModel!
                                        .data!
                                        .nafdac!
                                        .isVerified!
                                ? () {}
                                : () => model.nafdacRegNo(
                                    context,
                                    nafdacRegNoync:
                                        NafdacRegistrationNumberEntityModel(
                                          registrationNumber: model
                                              .nafdacRegNoController
                                              .text
                                              .trim(),
                                        ),
                                  ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 13.0.w,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: Center(
                                child: model.isLoadingNaf
                                    ? SpinKitFadingCircle(
                                        color: AppColors.white,
                                        size: 25.50.sp,
                                      )
                                    : TextView(
                                        text: 'Verify ID',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16.90.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'Batch Number',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      hintWeight: FontWeight.w500,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: batchNo,
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      hint: 'Serial Number',
                      label: '',
                      borderColor: AppColors.transparent,
                      borderTopLeft: 10.r,
                      borderTopRight: 10.r,
                      borderBottomLeft: 10.r,
                      borderBottomRight: 10.r,
                      hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        fontSize: 15.4.sp,
                        color: AppColors.infoGrey,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 16.sp,
                        color: AppColors.reminder1,
                      ),
                      fillColor: AppColors.dashboard,
                      isFilled: true,
                      controller: serialNo,
                      validator: AppValidator.validateString(),
                      onChange: (p0) {},
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: TextFormWidget(
                            hint: 'Manufactured Date',
                            label: '',
                            letterSpacing: -0.82,
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintWeight: FontWeight.w500,
                            hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'DMSans',
                              fontSize: 15.4.sp,
                              color: AppColors.infoGrey,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DMSans',
                              fontSize: 16.sp,
                              color: AppColors.reminder1,
                            ),
                            fillColor: AppColors.dashboard,
                            isFilled: true,
                            controller:
                                model.manufacturerDateController.text != ''
                                ? TextEditingController(
                                    text: DateFormat('dd/yyyy').format(
                                      DateTime.parse(
                                        model.manufacturerDateController.text,
                                      ),
                                    ),
                                  )
                                : model.manufacturerDateController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {},
                            suffixWidget: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: GestureDetector(
                                onTap: () => model.selectManDate(context),
                                child: SvgPicture.asset(AppImage.calendar),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.60.w),
                        Expanded(
                          flex: 6,
                          child: TextFormWidget(
                            hint: 'Expiry Date',
                            letterSpacing: -0.81,
                            label: '',
                            borderColor: AppColors.transparent,
                            borderTopLeft: 10.r,
                            borderTopRight: 10.r,
                            borderBottomLeft: 10.r,
                            borderBottomRight: 10.r,
                            hintSize: isTablet(context) ? 16.82.sp : 16.0.sp,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'DMSans',
                              fontSize: 15.4.sp,
                              color: AppColors.infoGrey,
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DMSans',
                              fontSize: 16.sp,
                              color: AppColors.reminder1,
                            ),
                            fillColor: AppColors.dashboard,
                            isFilled: true,
                            controller: model.expiryDateController.text != ''
                                ? TextEditingController(
                                    text: DateFormat('dd/yyyy').format(
                                      DateTime.parse(
                                        model.expiryDateController.text,
                                      ),
                                    ),
                                  )
                                : model.expiryDateController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {},
                            suffixWidget: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: GestureDetector(
                                onTap: () => model.selectExDate(context),
                                child: SvgPicture.asset(AppImage.calendar),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextView(
                          text: 'Product Image',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(width: 5.10.h),
                        TextView(
                          text: '*',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    model.imagesProductList!.isEmpty
                        ? SizedBox(
                            width: double.infinity,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [10, 10],
                                strokeWidth: .94,
                                radius: Radius.circular(10),
                                color: AppColors.primary,
                              ),
                              child: GestureDetector(
                                onTap: () => model.pickProductImage(context),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 19.30.w,
                                    horizontal: 20.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      model.isLoadingProductImage
                                          ? SpinKitCircle(
                                              color: AppColors.primary1,
                                              size: 20.sp,
                                            )
                                          : SvgPicture.asset(
                                              AppImage.upload_doc,
                                              height: 20.h,
                                              width: 20.h,
                                            ),
                                      SizedBox(width: 12.20.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Upload image',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                          SizedBox(
                                            width: 220.w,
                                            child: TextView(
                                              text:
                                                  'Max file size: 2MB (.jpg, .jpeg, .png, or .pdf supported)',
                                              maxLines: 2,
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 13.6.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.fineGrey,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2.0.h),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...model.imagesProductList!.map(
                                  (e) => Container(
                                    padding: EdgeInsets.all(12.w),
                                    margin: EdgeInsets.only(right: 12.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: const Color.fromARGB(
                                        91,
                                        62,
                                        62,
                                        62,
                                      ),
                                    ),
                                    child: Center(
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              4.r,
                                            ),
                                            child: Image.network(
                                              e.url!,
                                              height: 52.0.h,
                                              width: 52.0.w,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            right: -1,
                                            top: -6,
                                            child: Container(
                                              padding: EdgeInsets.all(1.42.w),
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  model.imagesProductList!
                                                      .remove(e);
                                                  model.notifyListeners();
                                                },
                                                child: SvgPicture.asset(
                                                  AppImage.remove_product,
                                                  height: 14.20.h,
                                                  width: 15.20.w,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                SizedBox(
                                  child: DottedBorder(
                                    options: RoundedRectDottedBorderOptions(
                                      dashPattern: [5, 5],
                                      strokeWidth: .94,
                                      radius: Radius.circular(12),
                                      color: AppColors.primary,
                                    ),
                                    child: GestureDetector(
                                      onTap: () =>
                                          model.pickProductImage(context),
                                      child: Container(
                                        width: 70.w,
                                        height: 70.h,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 22.0.w,
                                          horizontal: 22.0.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          color: AppColors.white,
                                        ),
                                        child: model.isLoadingProductImage
                                            ? SpinKitCircle(
                                                color: AppColors.primary,
                                                size: 20.sp,
                                              )
                                            : SvgPicture.asset(
                                                AppImage.upload_doc,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextView(
                          text: 'Volume Pricing',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(width: 5.10.h),
                        TextView(
                          text: '*',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.20.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 21.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(11.0.r),
                      ),
                      child: Column(
                        children: [
                          ...List.generate(
                            vPriceController.length,
                            (index) => Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: 20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.grey,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: TextFormWidget(
                                      hint: 'Volume Quantity',
                                      label: '',
                                      letterSpacing: -1.2,
                                      hintSize: 15.20.sp,
                                      hintWeight: FontWeight.lerp(
                                        FontWeight.w400,
                                        FontWeight.w500,
                                        0.005,
                                      ),
                                      borderColor: AppColors.transparent,
                                      borderTopLeft: 10.r,
                                      borderTopRight: 10.r,
                                      borderBottomLeft: 10.r,
                                      borderBottomRight: 10.r,
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'DMSans',
                                        fontSize: 14.sp,
                                        color: AppColors.infoGrey,
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'DMSans',
                                        fontSize: 16.sp,
                                        color: AppColors.reminder1,
                                      ),
                                      fillColor: AppColors.appWhite,
                                      isFilled: true,
                                      controller: vPriceController[index],
                                      validator: AppValidator.validateString(),
                                      onChange: (p0) {},
                                    ),
                                  ),
                                  SizedBox(width: 12.20.w),
                                  Expanded(
                                    child: TextFormWidget(
                                      hint: 'Price per Unit(₦)',
                                      label: '0.00',
                                      letterSpacing: -0.98,
                                      hintSize: 15.20.sp,
                                      hintWeight: FontWeight.lerp(
                                        FontWeight.w400,
                                        FontWeight.w500,
                                        0.005,
                                      ),
                                      borderColor: AppColors.transparent,
                                      borderTopLeft: 10.r,
                                      borderTopRight: 10.r,
                                      borderBottomLeft: 10.r,
                                      borderBottomRight: 10.r,
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'DMSans',
                                        fontSize: 15.4.sp,
                                        color: AppColors.infoGrey,
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'DMSans',
                                        fontSize: 16.sp,
                                        color: AppColors.reminder1,
                                      ),
                                      fillColor: AppColors.appWhite,
                                      isFilled: true,
                                      controller: ppuController[index],
                                      validator: AppValidator.validateString(),
                                      onChange: (p0) {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: ppuController.length > 1
                                        ? 10.h
                                        : 0.h,
                                  ),
                                  ppuController.length > 1
                                      ? Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 20.w,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  vPriceController.removeAt(
                                                    index,
                                                  );
                                                  ppuController.removeAt(index);
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                AppImage.delete,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              vPriceController.add(TextEditingController());
                              ppuController.add(TextEditingController());
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary1,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20.sp,
                                color: AppColors.white,
                                weight: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomSwitch(
                          value: isSwitched,
                          onChanged: (bool val) {
                            setState(() {
                              isSwitched = val;
                            });
                          },
                        ),
                        SizedBox(width: 6.10.h),
                        TextView(
                          text: 'Published (visible on markplace)',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 15.22.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.reminder,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    widget.isEdit!
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 4,
                                child: GestureDetector(
                                  onTap: () => navigate.back(),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.30.w,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.primary,
                                      ),
                                      borderRadius: BorderRadius.circular(52.r),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: 'Cancel',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 17.90.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    for (
                                      int i = 0;
                                      i < vPriceController.length;
                                      i++
                                    ) {
                                      volumnPricelist.add(
                                        VolumePricing(
                                          quantity: int.parse(
                                            vPriceController[i].text,
                                          ),
                                          pricePerUnit: int.parse(
                                            ppuController[i].text,
                                          ),
                                        ),
                                      );
                                    }
                                    model.updateProduct(
                                      context,
                                      productId: widget.productId,
                                      updateproduct:
                                          UpdateProductManagementEntityModel(
                                            productName: productName.text
                                                .trim(),
                                            description: description.text
                                                .trim(),
                                            categoryId: model.c!.id,
                                            sku: sku.text.trim(),
                                            packSize: int.parse(
                                              packSize.text.trim(),
                                            ),
                                            unit: unit.text.trim(),
                                            minimumOrderQuantity: int.parse(
                                              moq.text.trim(),
                                            ),
                                            pricePerUnit: int.parse(
                                              priceUnit.text.trim(),
                                            ),
                                            stock: int.parse(stock.text.trim()),
                                            batchNumber: batchNo.text.trim(),
                                            serialNumber: serialNo.text.trim(),
                                            manufacturedDate: model
                                                .manufacturerDateController
                                                .text,
                                            expiryDate:
                                                model.expiryDateController.text,
                                            nafdacRegistrationNumber: model
                                                .nafdacRegNoController
                                                .text,
                                            images: model.imagesProductList
                                                ?.map(
                                                  (image) => up.Image.fromJson(
                                                    image.toJson(),
                                                  ),
                                                )
                                                .toList(),
                                            volumePricing: volumnPricelist
                                                .map(
                                                  (vol) =>
                                                      v.VolumePricing.fromJson(
                                                        vol.toJson(),
                                                      ),
                                                )
                                                .toList(),
                                          ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.30.w,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(52.r),
                                    ),
                                    child: Center(
                                      child: model.isLoading
                                          ? SpinKitThreeBounce(
                                              color: AppColors.white,
                                              size: 22.0.sp,
                                            )
                                          : TextView(
                                              text: 'Save Changes',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 17.90.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.white,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              if (formKeyAddProduct.currentState!.validate()) {
                                volumnPricelist.clear();
                                for (
                                  int i = 0;
                                  i < vPriceController.length;
                                  i++
                                ) {
                                  volumnPricelist.add(
                                    VolumePricing(
                                      quantity: int.parse(
                                        vPriceController[i].text,
                                      ),
                                      pricePerUnit: int.parse(
                                        ppuController[i].text,
                                      ),
                                    ),
                                  );
                                }
                                model.createProduct(
                                  context,
                                  createproduct:
                                      CreateDistributorProductEntityModel(
                                        productName: productName.text.trim(),
                                        description: description.text.trim(),
                                        categoryId: model.c!.id,
                                        sku: sku.text.trim(),
                                        packSize: int.parse(
                                          packSize.text.trim(),
                                        ),
                                        unit: unit.text.trim(),
                                        minimumOrderQuantity: int.parse(
                                          moq.text.trim(),
                                        ),
                                        pricePerUnit: int.parse(
                                          priceUnit.text.trim(),
                                        ),
                                        stock: int.parse(stock.text.trim()),
                                        batchNumber: batchNo.text.trim(),
                                        serialNumber: serialNo.text.trim(),
                                        manufacturedDate: model
                                            .manufacturerDateController
                                            .text,
                                        expiryDate:
                                            model.expiryDateController.text,
                                        nafdacRegistrationNumber:
                                            model.nafdacRegNoController.text,
                                        images: model.imagesProductList,
                                        volumePricing: volumnPricelist,
                                      ),
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 14.30.w,
                                horizontal: 20.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(52.r),
                              ),
                              child: Center(
                                child: model.isLoading
                                    ? SpinKitThreeBounce(
                                        color: AppColors.white,
                                        size: 22.0.sp,
                                      )
                                    : TextView(
                                        text: 'Create Product',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 17.90.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                    SizedBox(height: 20.30.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
