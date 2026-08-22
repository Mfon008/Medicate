// ignore_for_file: deprecated_member_use, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../widget/button.dart';
import '../widget/text.dart';

class ManufacturerViewProductScreen extends StatelessWidget {
  ManufacturerViewProductScreen({super.key, required this.productId});
  int currentPage = 0;
  String? productId;

  @override
  Widget build(BuildContext context) {
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
          text: 'View product',
          textStyle: TextStyle(
            fontFamily: 'DMSans',
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ViewModelBuilder<ManufacturerViewModel>.reactive(
        viewModelBuilder: () => ManufacturerViewModel(),
        onViewModelReady: (model) async {
          await model.getSingleProduct(context, productId: productId);
          model.images =
              model.getSingleProductResponseModel!.data!.product!.images![0];
        },
        disposeViewModel: false,
        onDispose: (viewModel) {},
        builder: (_, ManufacturerViewModel model, _) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.20.w, vertical: 20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14.20.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (model.getSingleProductResponseModel != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 262.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        236,
                                        237,
                                        237,
                                      ),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: CachedNetworkImage(
                                      imageUrl: model.images?.url ?? '',
                                      height: 262.h,
                                      width: 242.w,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: SpinKitRipple(
                                          color: AppColors.primary,
                                          size: 50.sp,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 130,
                                  right: 6.0,
                                  child: GestureDetector(
                                    onTap:
                                        model.inImage + 1 ==
                                            model
                                                .getSingleProductResponseModel!
                                                .data!
                                                .product!
                                                .images!
                                                .length
                                        ? () {}
                                        : () {
                                            model.inImage = model.inImage + 1;
                                            model.images = model
                                                .getSingleProductResponseModel!
                                                .data!
                                                .product!
                                                .images![model.inImage];
                                            model.notifyListeners();
                                          },
                                    child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primary,
                                      ),
                                      child: SvgPicture.asset(
                                        AppImage.arrow_right,
                                        color: AppColors.white,
                                        height: 12.h,
                                        width: 12.h,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 130,
                                  left: 10,
                                  child: GestureDetector(
                                    onTap: model.inImage < 1
                                        ? () {}
                                        : () async {
                                            model.inImage = model.inImage - 1;
                                            await Future.delayed(
                                              Duration(milliseconds: 50),
                                            );
                                            model.images = model
                                                .getSingleProductResponseModel!
                                                .data!
                                                .product!
                                                .images![model.inImage];
                                            model.notifyListeners();
                                          },
                                    child: Container(
                                      padding: EdgeInsets.all(8.0.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.6,
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        AppImage.arrow_left,
                                        color: AppColors.primary,
                                        height: 12.h,
                                        width: 11.2.h,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 1,
                                  bottom: 1,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.80.w,
                                      vertical: 6.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(6.r),
                                        bottomLeft: Radius.circular(4.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        model
                                            .getSingleProductResponseModel!
                                            .data!
                                            .product!
                                            .images!
                                            .length,
                                        (index) => AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 3.2.w,
                                          ),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: model.inImage == index
                                                ? AppColors.primary
                                                : AppColors.infoGrey,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.60.w,
                                    horizontal: 12.8.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.skyBlue,
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color: AppColors.cool_blue,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextView(
                                    text:
                                        model
                                            .getSingleProductResponseModel
                                            ?.data
                                            ?.product
                                            ?.category
                                            ?.toUpperCase() ??
                                        '',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.60.w,
                                    horizontal: 12.8.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                      color: AppColors.infoGrey1,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextView(
                                    text:
                                        'SKU: ${model.getSingleProductResponseModel?.data?.product?.category?.toUpperCase() ?? ''}',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                ),
                                model
                                        .getSingleProductResponseModel!
                                        .data!
                                        .product!
                                        .nafdacVerification!
                                        .isVerified!
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 2.60.w,
                                          horizontal: 12.8.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                          border: Border.all(
                                            color: AppColors.app_green,
                                            width: 1.2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.validate,
                                              height: 14.6.h,
                                              width: 12.w,
                                            ),
                                            SizedBox(width: 6.2.w),
                                            TextView(
                                              text: 'Validated',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.20.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.app_green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text:
                                      model
                                          .getSingleProductResponseModel
                                          ?.data
                                          ?.product
                                          ?.productName ??
                                      '',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 18.20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder,
                                    letterSpacing: -0.21,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Manufacturer: ',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 14.20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    TextView(
                                      text:
                                          model
                                              .getSingleProductResponseModel
                                              ?.data
                                              ?.product
                                              ?.nafdacVerification
                                              ?.manufacturer ??
                                          '',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 14.20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.reminder,
                                        decorationThickness: 0.60,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 13.0.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        TextView(
                                          text: formatNaira(
                                            model
                                                    .getSingleProductResponseModel
                                                    ?.data
                                                    ?.product
                                                    ?.pricePerUnit ??
                                                0,
                                          ),
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 19.80.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                            letterSpacing: -2,
                                          ),
                                        ),
                                        TextView(
                                          text: '/carton',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14.80.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.infoGrey,
                                            letterSpacing: -1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.60.w,
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                        border: Border.all(
                                          color: AppColors.infoGrey1,
                                          width: 1.2,
                                        ),
                                      ),
                                      child: TextView(
                                        text:
                                            'Min. Order: ${model.getSingleProductResponseModel?.data?.product?.minimumOrderQuantity} Cartons',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 12.90.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Divider(color: AppColors.infoGrey1),
                                SizedBox(height: 10.h),
                                TextView(
                                  text:
                                      model
                                          .getSingleProductResponseModel
                                          ?.data
                                          ?.product
                                          ?.description ??
                                      '',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 15.80.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.reminder,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.w),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.w,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.infoGrey1,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          AppImage.stack_pack,
                                          color: AppColors.grey1,
                                          height: 20.h,
                                          width: 20.6.w,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Pack Size',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.80.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.infoGrey,
                                            ),
                                          ),
                                          TextView(
                                            text:
                                                '${model.getSingleProductResponseModel?.data?.product?.packSize ?? 0} / carton',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.reminder1,
                                              letterSpacing: -0.21,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.w),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 8.w,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.infoGrey1,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          AppImage.validate,
                                          color: AppColors.grey1,
                                          height: 17.20.h,
                                          width: 17.6.w,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Stock Status',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.80.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.infoGrey,
                                            ),
                                          ),
                                          TextView(
                                            text:
                                                '${model.getSingleProductResponseModel?.data?.product?.stock ?? 0} available',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.app_green,
                                              letterSpacing: -0.21,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(8.0.r),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        236,
                                        237,
                                        237,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Volume Pricing',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.90.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      ...model
                                          .getSingleProductResponseModel!
                                          .data!
                                          .product!
                                          .volumePricing!
                                          .map(
                                            (o) => Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 6.60.w,
                                                horizontal: 12.w,
                                              ),

                                              margin: EdgeInsets.only(
                                                bottom: 10.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.appWhite,
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                    255,
                                                    236,
                                                    237,
                                                    237,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextView(
                                                    text: '≥ ${o.quantity}:',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15.60.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                  TextView(
                                                    text: formatNaira(
                                                      o.pricePerUnit!.toInt(),
                                                    ),
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15.80.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      SizedBox(height: 10.w),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.2.w,
                                    horizontal: 5.68.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: AppColors.infoGrey1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(14.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.grey,
                                          borderRadius: BorderRadius.circular(
                                            8.0.r,
                                          ),
                                        ),
                                        child: TextView(
                                          text: 'Batch & Registration Details',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14.90.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5.68.w,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Divider(color: AppColors.infoGrey1),
                                            SizedBox(height: 5.10.h),
                                            TextView(
                                              text: 'NAFDAC Reg No:',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 12.90.sp,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.infoGrey,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            TextView(
                                              text:
                                                  model
                                                      .getSingleProductResponseModel
                                                      ?.data
                                                      ?.product
                                                      ?.nafdacVerification
                                                      ?.registrationNumber ??
                                                  '',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.90.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            TextView(
                                              text: 'Batch Number:',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 12.90.sp,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.infoGrey,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            TextView(
                                              text:
                                                  model
                                                      .getSingleProductResponseModel
                                                      ?.data
                                                      ?.product
                                                      ?.batchNumber ??
                                                  '',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.90.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            TextView(
                                              text: 'Manufacturer',
                                              textStyle: TextStyle(
                                                fontFamily: 'DmSans',
                                                fontSize: 12.90.sp,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.infoGrey,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            TextView(
                                              text:
                                                  model
                                                      .getSingleProductResponseModel
                                                      ?.data
                                                      ?.product
                                                      ?.nafdacVerification
                                                      ?.manufacturer ??
                                                  '',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.90.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            TextView(
                                              text: 'Serial Number:',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 12.90.sp,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.infoGrey,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            TextView(
                                              text:
                                                  model
                                                      .getSingleProductResponseModel
                                                      ?.data
                                                      ?.product
                                                      ?.serialNumber ??
                                                  '',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.90.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            TextView(
                                              text: 'Manufactured Date',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 12.90.sp,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.infoGrey,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            TextView(
                                              text: DateFormat('MM/yyyy').format(
                                                model
                                                    .getSingleProductResponseModel!
                                                    .data!
                                                    .product!
                                                    .manufacturedDate!,
                                              ),
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.90.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            TextView(
                                              text: 'Expiry Date:',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 12.90.sp,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.infoGrey,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            TextView(
                                              text: DateFormat('MM/yyyy').format(
                                                model
                                                    .getSingleProductResponseModel!
                                                    .data!
                                                    .product!
                                                    .expiryDate!,
                                              ),
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.90.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.red,
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            // TextView(
                                            //   text: 'Status:',
                                            //   textStyle: TextStyle(
                                            //     fontFamily: 'GoogleSans',
                                            //     fontSize: 12.90.sp,
                                            //     fontWeight: FontWeight.w300,
                                            //     color: AppColors.infoGrey,
                                            //   ),
                                            // ),
                                            // SizedBox(height: 2.h),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.start,
                                            //   children: [
                                            //     Container(
                                            //       padding: EdgeInsets.all(
                                            //         3.4.w,
                                            //       ),
                                            //       decoration: BoxDecoration(
                                            //         color:
                                            //             AppColors.app_green,
                                            //         shape: BoxShape.circle,
                                            //       ),
                                            //       child: Icon(
                                            //         Icons.check,
                                            //         size: 12.sp,
                                            //         color: AppColors.white,
                                            //         weight: 2,
                                            //       ),
                                            //     ),
                                            //     SizedBox(width: 5.0.w),
                                            //     TextView(
                                            //       text: 'Approved',
                                            //       textStyle: TextStyle(
                                            //         fontFamily: 'GoogleSans',
                                            //         fontSize: 14.90.sp,
                                            //         fontWeight:
                                            //             FontWeight.w500,
                                            //         color:
                                            //             AppColors.app_green,
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            // SizedBox(height: 12.h),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                GestureDetector(
                                  onTap: () => navigate.navigateTo(
                                    Routes.addProductScreen,
                                    arguments: AddProductScreenArguments(
                                      isEdit: true,
                                      productId: productId,
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(40.r),
                                    ),
                                    child: TextView(
                                      text: 'Make Update',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16.90.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
