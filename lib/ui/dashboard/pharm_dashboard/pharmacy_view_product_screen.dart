// ignore_for_file: deprecated_member_use, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medicate_app/core/connect_end/view_model/pharm_auth_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/constant.dart';
import '../../../core/connect_end/model/wholesale_add_to_cart_entity_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class PharmacyViewProductScreen extends StatelessWidget {
  PharmacyViewProductScreen({super.key, this.wholeSaleProductId});
  String? wholeSaleProductId;

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
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
            fontFamily: 'GoogleSans',
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ViewModelBuilder<PharmViewModel>.reactive(
        viewModelBuilder: () => PharmViewModel(),
        onViewModelReady: (model) async {
          await model.getSingleMarketPlaceProduct(
            context,
            productId: wholeSaleProductId,
          );
          model.images = model
              .getSingleMarketProductResponseModel!
              .data!
              .product!
              .images![0];
          model.productSinglequantity = model
              .getSingleMarketProductResponseModel!
              .data!
              .product!
              .minimumOrderQuantity!;
        },
        disposeViewModel: false,
        onDispose: (viewModel) {},
        builder: (_, PharmViewModel model, _) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.20.w, vertical: 20.0),
            child: Column(
              children: [
                if (model.getSingleMarketProductResponseModel != null)
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
                                            .getSingleMarketProductResponseModel!
                                            .data!
                                            .product!
                                            .images!
                                            .length
                                    ? () {}
                                    : () {
                                        model.inImage = model.inImage + 1;
                                        model.images = model
                                            .getSingleMarketProductResponseModel!
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
                                            .getSingleMarketProductResponseModel!
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
                                        .getSingleMarketProductResponseModel!
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
                                        .getSingleMarketProductResponseModel
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
                                    'SKU: ${model.getSingleMarketProductResponseModel?.data?.product?.sku?.toUpperCase() ?? ''}',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 14.20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.reminder,
                                ),
                              ),
                            ),
                            model
                                    .getSingleMarketProductResponseModel!
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
                                      borderRadius: BorderRadius.circular(20.r),
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
                                      .getSingleMarketProductResponseModel
                                      ?.data
                                      ?.product
                                      ?.productName
                                      ?.capitalize() ??
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
                                          .getSingleMarketProductResponseModel
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
                              children: [
                                TextView(
                                  text: formatNaira(
                                    model
                                            .getSingleMarketProductResponseModel
                                            ?.data
                                            ?.product
                                            ?.displayPricePerUnit ??
                                        0,
                                  ),
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 19.80.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                                TextView(
                                  text: '/carton',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14.80.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.infoGrey,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Container(
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
                                          'Min. Order:  ${model.getSingleMarketProductResponseModel?.data?.product?.minimumOrderQuantity} Cartons',
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 12.90.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.reminder,
                                      ),
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
                                      .getSingleMarketProductResponseModel
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
                                border: Border.all(color: AppColors.infoGrey1),
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
                                          fontFamily: 'GoogleSans',
                                          fontSize: 14.80.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      TextView(
                                        text:
                                            '${model.getSingleMarketProductResponseModel?.data?.product?.packSize ?? 0} / carton',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
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
                                border: Border.all(color: AppColors.infoGrey1),
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
                                          fontFamily: 'GoogleSans',
                                          fontSize: 14.80.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                      TextView(
                                        text:
                                            '${model.getSingleMarketProductResponseModel?.data?.product?.stock ?? 0} available',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
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
                            model.getSingleMarketProductResponseModel != null &&
                                    model
                                        .getSingleMarketProductResponseModel!
                                        .data!
                                        .product!
                                        .volumePricing!
                                        .isNotEmpty
                                ? Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(
                                        8.0.r,
                                      ),
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
                                            fontFamily: 'GoogleSans',
                                            fontSize: 14.90.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),

                                        ...model
                                            .getSingleMarketProductResponseModel!
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
                                                      BorderRadius.circular(
                                                        20.r,
                                                      ),
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
                                                      text:
                                                          '≥ ${o['quantity']}:',
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
                                                        o['pricePerUnit']
                                                            .toInt(),
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
                                        SizedBox(height: 5.10.w),
                                      ],
                                    ),
                                  )
                                : SizedBox.shrink(),
                            SizedBox(height: 16.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6.2.w,
                                horizontal: 5.68.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: AppColors.infoGrey1),
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
                                        fontFamily: 'GoogleSans',
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
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.90.sp,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        TextView(
                                          text:
                                              model
                                                  .getSingleMarketProductResponseModel
                                                  ?.data
                                                  ?.product
                                                  ?.nafdacVerification
                                                  ?.registrationNumber ??
                                              '',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 15.90.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        TextView(
                                          text: 'Batch Number:',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.90.sp,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        TextView(
                                          text:
                                              model
                                                  .getSingleMarketProductResponseModel
                                                  ?.data
                                                  ?.product
                                                  ?.batchNumber ??
                                              '',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 15.90.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        TextView(
                                          text: 'Manufacturer',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.90.sp,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        TextView(
                                          text:
                                              model
                                                  .getSingleMarketProductResponseModel
                                                  ?.data
                                                  ?.product
                                                  ?.nafdacVerification
                                                  ?.manufacturer ??
                                              '',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 15.90.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        TextView(
                                          text: 'Serial Number:',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.90.sp,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        TextView(
                                          text:
                                              model
                                                  .getSingleMarketProductResponseModel
                                                  ?.data
                                                  ?.product
                                                  ?.serialNumber ??
                                              '',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 15.90.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        TextView(
                                          text: 'Manufactured Date',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.90.sp,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        TextView(
                                          text: DateFormat('MM/yyyy').format(
                                            model
                                                .getSingleMarketProductResponseModel!
                                                .data!
                                                .product!
                                                .manufacturedDate!,
                                          ),
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 15.90.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        TextView(
                                          text: 'Expiry Date:',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.90.sp,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        TextView(
                                          text: DateFormat('MM/yyyy').format(
                                            model
                                                .getSingleMarketProductResponseModel!
                                                .data!
                                                .product!
                                                .expiryDate!,
                                          ),
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 15.90.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.red,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        TextView(
                                          text: 'Status:',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 12.90.sp,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.infoGrey,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3.4.w),
                                              decoration: BoxDecoration(
                                                color: AppColors.app_green,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                size: 12.sp,
                                                color: AppColors.white,
                                                weight: 2,
                                              ),
                                            ),
                                            SizedBox(width: 5.0.w),
                                            TextView(
                                              text: 'Approved',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 14.90.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.app_green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Divider(color: AppColors.infoGrey1),
                            SizedBox(height: 5.10.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Quantity',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 19.80.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 44.0.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.92.r),
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
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed:
                                            model
                                                    .getSingleMarketProductResponseModel!
                                                    .data!
                                                    .product!
                                                    .minimumOrderQuantity! <=
                                                model.productSinglequantity!
                                            ? () {}
                                            : () {
                                                model
                                                        .getSingleMarketProductResponseModel!
                                                        .data!
                                                        .product!
                                                        .minimumOrderQuantity =
                                                    model
                                                        .getSingleMarketProductResponseModel!
                                                        .data!
                                                        .product!
                                                        .minimumOrderQuantity! -
                                                    1;
                                                model.notifyListeners();
                                              },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 14.0.sp,
                                          color:
                                              model
                                                      .getSingleMarketProductResponseModel!
                                                      .data!
                                                      .product!
                                                      .minimumOrderQuantity! <=
                                                  model.productSinglequantity!
                                              ? AppColors.infoGrey
                                              : AppColors.reminder,
                                        ),
                                      ),
                                      SizedBox(
                                        width: model.isQuantityTapp == true
                                            ? 10.w
                                            : 20.w,
                                      ),
                                      model.isQuantityTapp == true
                                          ? SizedBox(
                                              width: 45.w,
                                              height: 45.h,
                                              child: Center(
                                                child: Form(
                                                  key: model
                                                      .quantityValueFormKey,
                                                  child: TextFormField(
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              5.r,
                                                            ),
                                                      ),
                                                    ),
                                                    controller: model
                                                        .quantityValueController,
                                                    showCursor: false,
                                                    validator:
                                                        AppValidator.validateIntProductQuantity(),
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        model
                                                                .getSingleMarketProductResponseModel!
                                                                .data!
                                                                .product!
                                                                .minimumOrderQuantity =
                                                            int.parse(value);

                                                        model.notifyListeners();
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                model.isQuantityTapp = true;
                                                model.notifyListeners();
                                              },
                                              child: TextView(
                                                text:
                                                    '${model.getSingleMarketProductResponseModel!.data!.product!.minimumOrderQuantity ?? 0}',
                                                textStyle: TextStyle(
                                                  fontFamily: 'GoogleSans',
                                                  fontSize: 14.80.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                            ),
                                      SizedBox(
                                        width: model.isQuantityTapp == true
                                            ? 10.w
                                            : 20.w,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          model
                                                  .getSingleMarketProductResponseModel!
                                                  .data!
                                                  .product!
                                                  .minimumOrderQuantity =
                                              model
                                                  .getSingleMarketProductResponseModel!
                                                  .data!
                                                  .product!
                                                  .minimumOrderQuantity! +
                                              1;
                                          model.notifyListeners();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 14.0.sp,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 10.w,
                                horizontal: 12.40.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                border: Border.all(color: AppColors.infoGrey1),
                                borderRadius: BorderRadius.circular(8.0.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Line total',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 14.90.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  TextView(
                                    text: formatNaira(
                                      model
                                              .getSingleMarketProductResponseModel!
                                              .data!
                                              .product!
                                              .displayPricePerUnit! *
                                          model
                                              .getSingleMarketProductResponseModel!
                                              .data!
                                              .product!
                                              .minimumOrderQuantity!,
                                    ),
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 22.40.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (model.isQuantityTapp == true) {
                                        final value = model
                                            .quantityValueController
                                            .text
                                            .trim();
                                        if (value.isEmpty) {
                                          return;
                                        }
                                        // Validate the field
                                        if (!(model
                                                .quantityValueFormKey
                                                .currentState
                                                ?.validate() ??
                                            false)) {
                                          return;
                                        }

                                        model
                                                .getSingleMarketProductResponseModel!
                                                .data!
                                                .product!
                                                .minimumOrderQuantity =
                                            int.tryParse(value) ?? 0;

                                        // Do nothing if the parsed quantity is invalid/zero
                                        if (model
                                                .getSingleMarketProductResponseModel!
                                                .data!
                                                .product!
                                                .minimumOrderQuantity! <=
                                            0) {
                                          return;
                                        }
                                      }
                                      model.addWholesaleProductToCart(
                                        context,
                                        wholesaleAddToCart:
                                            WholesaleAddToCartEntityModel(
                                              productId: model
                                                  .getSingleMarketProductResponseModel!
                                                  .data!
                                                  .product!
                                                  .id,
                                              quantity: model
                                                  .getSingleMarketProductResponseModel!
                                                  .data!
                                                  .product!
                                                  .minimumOrderQuantity,
                                            ),
                                      );
                                      model.notifyListeners();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.42,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          40.r,
                                        ),
                                      ),
                                      child: model.isLoading
                                          ? SpinKitRing(
                                              color: AppColors.primary1,
                                              size: 22.0.sp,
                                              lineWidth: 2,
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.cart,
                                                  height: isTablet(context)
                                                      ? 38.40.h
                                                      : 20.h,
                                                  width: isTablet(context)
                                                      ? 38.40.w
                                                      : 20.w,
                                                  color: AppColors.primary,
                                                ),
                                                SizedBox(width: 7.10.w),
                                                TextView(
                                                  text: 'Add to Cart',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'GoogleSans',
                                                    fontSize: 16.90.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.primary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                Expanded(
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
                                      text: 'Buy Now',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.90.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
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
