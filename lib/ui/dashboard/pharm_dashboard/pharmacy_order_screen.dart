// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../core/app_assets/constant.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class PharmacyOrderScreen extends StatelessWidget {
  const PharmacyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {
        model.getWholesaleOrderList(context: context);
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, PharmViewModel model, _) {
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
              text: 'My Orders',
              textStyle: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.20.w, vertical: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 14.20,
                  runSpacing: 13.20,
                  children: [
                    ...model.myOrderListCategory.map(
                      (e) => GestureDetector(
                        onTap: () {
                          model.orderCategory = e;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.64.w,
                            vertical: 7.2.w,
                          ),
                          decoration: BoxDecoration(
                            color: model.orderCategory == e
                                ? AppColors.primary
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextView(
                            text: e,
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 13.12.sp,
                              fontWeight: FontWeight.w500,
                              color: model.orderCategory == e
                                  ? AppColors.white
                                  : AppColors.infoGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.2.w,
                    horizontal: 14.60.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.infoGrey1),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Filter by date',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.62.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: GestureDetector(
                          onTap: () => model.selectDateCheckout(
                            context: context,
                            model: model,
                          ),
                          child: SvgPicture.asset(
                            AppImage.calendar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                if (model.wholesaleOrderListResponseModel != null)
                  ...model.wholesaleOrderListResponseModel!.data!.orders!.map(
                    (e) =>
                        model.wholesaleOrder == e &&
                            model.getWholesaleOrderResponseModel != null &&
                            !model.isLoading
                        ? Container(
                            margin: EdgeInsets.only(bottom: 12.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 8),
                              ],
                            ),
                            clipBehavior: Clip
                                .antiAlias, // Keeps children inside the rounded corners
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Blue Header
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16.20.w),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF0057C2),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text:
                                                model
                                                    .getWholesaleOrderResponseModel!
                                                    .data!
                                                    .order!
                                                    .orderNumber ??
                                                '',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 17.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Container(
                                            width:
                                                model
                                                        .getWholesaleOrderResponseModel!
                                                        .data!
                                                        .order!
                                                        .badgeText!
                                                        .length >
                                                    8
                                                ? 130.w
                                                : 80.w,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.64.w,
                                              vertical: 3.42.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.appWhite,
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                            ),
                                            child: TextView(
                                              text:
                                                  model
                                                      .getWholesaleOrderResponseModel!
                                                      .data!
                                                      .order!
                                                      .badgeText ??
                                                  '',
                                              textOverflow: TextOverflow.fade,
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 14.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.lightBlue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.10.h),
                                      TextView(
                                        text:
                                            'Placed on ${formatDate(model.getWholesaleOrderResponseModel!.data!.order!.placedAt!.toString())}',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                            107,
                                            255,
                                            255,
                                            255,
                                          ),
                                          letterSpacing: -0.12,
                                        ),
                                      ),

                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: formatNaira(
                                                  model
                                                      .getWholesaleOrderResponseModel!
                                                      .data!
                                                      .order!
                                                      .total!,
                                                ),
                                                textStyle: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 17.2.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              SizedBox(height: 4.10.h),
                                              TextView(
                                                text:
                                                    model
                                                        .getWholesaleOrderResponseModel
                                                        ?.data
                                                        ?.order
                                                        ?.deliveryMethodLabel
                                                        ?.toUpperCase() ??
                                                    '',
                                                textStyle: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 13.44.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromARGB(
                                                    107,
                                                    255,
                                                    255,
                                                    255,
                                                  ),
                                                  letterSpacing: -0.1,
                                                ),
                                              ),
                                            ],
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              model.wholesaleOrder = null;
                                              model.getWholesaleOrderResponseModel !=
                                                  null;
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(8.10.w),
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.keyboard_arrow_up_sharp,
                                                size: 22.sp,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                model
                                            .getWholesaleOrderResponseModel!
                                            .data!
                                            .order!
                                            .items!
                                            .length >
                                        1
                                    ? SizedBox.shrink()
                                    : Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                          vertical: 16.w,
                                          horizontal: 16.20.w,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 18.w,
                                          vertical: 16.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                          border: Border.all(
                                            color: AppColors.infoGrey1,
                                            width: 1,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextView(
                                              text: 'Order Tracking',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.4.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                            SizedBox(height: 5.60.h),
                                            Row(
                                              children: [
                                                TextView(
                                                  text: 'Est. Delivery:',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 12.4.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                ),
                                                TextView(
                                                  text:
                                                      ' ${formatDateNoTime(model.getWholesaleOrderResponseModel?.data?.order?.items?[0].estimatedDeliveryDate?.toString() ?? '')}',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 13.4.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.reminder,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 14.h),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.64.w,
                                                    vertical: 3.42.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        model
                                                                    .getWholesaleOrderResponseModel
                                                                    ?.data
                                                                    ?.order
                                                                    ?.items?[0]
                                                                    .tracking?[0]
                                                                    .status
                                                                    ?.toLowerCase() ==
                                                                'confirmed' &&
                                                            model
                                                                    .getWholesaleOrderResponseModel
                                                                    ?.data
                                                                    ?.order
                                                                    ?.items?[0]
                                                                    .tracking?[0]
                                                                    .completed ==
                                                                true
                                                        ? AppColors.app_green
                                                        : AppColors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.check,
                                                        size: 15.80.sp,
                                                        color:
                                                            model
                                                                        .getWholesaleOrderResponseModel
                                                                        ?.data
                                                                        ?.order
                                                                        ?.items?[0]
                                                                        .tracking?[0]
                                                                        .status
                                                                        ?.toLowerCase() ==
                                                                    'confirmed' &&
                                                                model
                                                                        .getWholesaleOrderResponseModel
                                                                        ?.data
                                                                        ?.order
                                                                        ?.items?[0]
                                                                        .tracking?[0]
                                                                        .completed ==
                                                                    true
                                                            ? AppColors.white
                                                            : AppColors
                                                                  .infoGrey,
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      TextView(
                                                        text: 'Order Confirmed',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              model
                                                                          .getWholesaleOrderResponseModel
                                                                          ?.data
                                                                          ?.order
                                                                          ?.items?[0]
                                                                          .tracking?[0]
                                                                          .status
                                                                          ?.toLowerCase() ==
                                                                      'confirmed' &&
                                                                  model
                                                                          .getWholesaleOrderResponseModel
                                                                          ?.data
                                                                          ?.order
                                                                          ?.items?[0]
                                                                          .tracking?[0]
                                                                          .completed ==
                                                                      true
                                                              ? AppColors.white
                                                              : AppColors
                                                                    .infoGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 16.w),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.64.w,
                                                    vertical: 3.42.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        model
                                                                    .getWholesaleOrderResponseModel
                                                                    ?.data
                                                                    ?.order
                                                                    ?.items?[0]
                                                                    .tracking?[1]
                                                                    .status
                                                                    ?.toLowerCase() ==
                                                                'packaging' &&
                                                            model
                                                                    .getWholesaleOrderResponseModel
                                                                    ?.data
                                                                    ?.order
                                                                    ?.items?[0]
                                                                    .tracking?[1]
                                                                    .completed ==
                                                                true
                                                        ? AppColors.app_green
                                                        : AppColors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.check,
                                                        size: 15.80.sp,
                                                        color:
                                                            model
                                                                        .getWholesaleOrderResponseModel
                                                                        ?.data
                                                                        ?.order
                                                                        ?.items?[0]
                                                                        .tracking?[1]
                                                                        .status
                                                                        ?.toLowerCase() ==
                                                                    'packaging' &&
                                                                model
                                                                        .getWholesaleOrderResponseModel
                                                                        ?.data
                                                                        ?.order
                                                                        ?.items?[0]
                                                                        .tracking?[1]
                                                                        .completed ==
                                                                    true
                                                            ? AppColors.white
                                                            : AppColors
                                                                  .infoGrey,
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      TextView(
                                                        text: 'Packaging',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              model
                                                                          .getWholesaleOrderResponseModel
                                                                          ?.data
                                                                          ?.order
                                                                          ?.items?[0]
                                                                          .tracking?[1]
                                                                          .status
                                                                          ?.toLowerCase() ==
                                                                      'packaging' &&
                                                                  model
                                                                          .getWholesaleOrderResponseModel
                                                                          ?.data
                                                                          ?.order
                                                                          ?.items?[0]
                                                                          .tracking?[1]
                                                                          .completed ==
                                                                      true
                                                              ? AppColors.white
                                                              : AppColors
                                                                    .infoGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 14.h),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.64.w,
                                                    vertical: 3.42.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        model
                                                                    .getWholesaleOrderResponseModel
                                                                    ?.data
                                                                    ?.order
                                                                    ?.items?[0]
                                                                    .tracking?[2]
                                                                    .status
                                                                    ?.toLowerCase() ==
                                                                'in_transit' &&
                                                            model
                                                                    .getWholesaleOrderResponseModel
                                                                    ?.data
                                                                    ?.order
                                                                    ?.items?[0]
                                                                    .tracking?[2]
                                                                    .completed ==
                                                                true
                                                        ? AppColors.amber
                                                        : AppColors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.delivery,
                                                        color:
                                                            model
                                                                        .getWholesaleOrderResponseModel
                                                                        ?.data
                                                                        ?.order
                                                                        ?.items?[0]
                                                                        .tracking?[2]
                                                                        .status
                                                                        ?.toLowerCase() ==
                                                                    'in_transit' &&
                                                                model
                                                                        .getWholesaleOrderResponseModel
                                                                        ?.data
                                                                        ?.order
                                                                        ?.items?[0]
                                                                        .tracking?[2]
                                                                        .completed ==
                                                                    true
                                                            ? AppColors.appWhite
                                                            : AppColors
                                                                  .infoGrey,
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      TextView(
                                                        text: 'In Transit',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              model
                                                                          .getWholesaleOrderResponseModel
                                                                          ?.data
                                                                          ?.order
                                                                          ?.items?[0]
                                                                          .tracking?[2]
                                                                          .status
                                                                          ?.toLowerCase() ==
                                                                      'in_transit' &&
                                                                  model
                                                                          .getWholesaleOrderResponseModel
                                                                          ?.data
                                                                          ?.order
                                                                          ?.items?[0]
                                                                          .tracking?[2]
                                                                          .completed ==
                                                                      true
                                                              ? AppColors.white
                                                              : AppColors
                                                                    .infoGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 16.w),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.64.w,
                                                    vertical: 3.42.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        model
                                                                    .getWholesaleOrderResponseModel
                                                                    ?.data
                                                                    ?.order
                                                                    ?.items?[0]
                                                                    .tracking?[2]
                                                                    .status
                                                                    ?.toLowerCase() ==
                                                                'delivered' &&
                                                            model
                                                                    .getWholesaleOrderResponseModel
                                                                    ?.data
                                                                    ?.order
                                                                    ?.items?[0]
                                                                    .tracking?[2]
                                                                    .completed ==
                                                                true
                                                        ? AppColors.app_green
                                                        : AppColors.infoGrey1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          22,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .check_circle_outline_outlined,
                                                        size: 14.sp,
                                                        color:
                                                            model
                                                                        .getWholesaleOrderResponseModel
                                                                        ?.data
                                                                        ?.order
                                                                        ?.items?[0]
                                                                        .tracking?[2]
                                                                        .status
                                                                        ?.toLowerCase() ==
                                                                    'delivered' &&
                                                                model
                                                                        .getWholesaleOrderResponseModel
                                                                        ?.data
                                                                        ?.order
                                                                        ?.items?[0]
                                                                        .tracking?[2]
                                                                        .completed ==
                                                                    true
                                                            ? AppColors.white
                                                            : AppColors
                                                                  .infoGrey,
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      TextView(
                                                        text: 'Delivery',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              model
                                                                          .getWholesaleOrderResponseModel
                                                                          ?.data
                                                                          ?.order
                                                                          ?.items?[0]
                                                                          .tracking?[3]
                                                                          .status
                                                                          ?.toLowerCase() ==
                                                                      'delivered' &&
                                                                  model
                                                                          .getWholesaleOrderResponseModel
                                                                          ?.data
                                                                          ?.order
                                                                          ?.items?[0]
                                                                          .tracking?[3]
                                                                          .completed ==
                                                                      true
                                                              ? AppColors.white
                                                              : AppColors
                                                                    .infoGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                    vertical: 12.w,
                                    horizontal: 16.20.w,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18.w,
                                    vertical: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: AppColors.infoGrey1,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Delivery Details',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 15.4.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.w),
                                            child: SvgPicture.asset(
                                              AppImage.locator,
                                              height: 15.20.h,
                                              width: 15.20.w,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'Delivery Destination',
                                                textStyle: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 12.4.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.infoGrey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 230.w,
                                                child: TextView(
                                                  text:
                                                      '${model.getWholesaleOrderResponseModel!.data!.order!.deliveryDetails?.address?.capitalize()},${model.getWholesaleOrderResponseModel!.data!.order!.deliveryDetails?.lga ?? ''},${model.getWholesaleOrderResponseModel!.data!.order!.deliveryDetails?.state ?? ''}',
                                                  maxLines: 4,
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 12.4.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      Divider(color: AppColors.infoGrey1),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.w),
                                            child: SvgPicture.asset(
                                              AppImage.phone,
                                              height: 15.20.h,
                                              width: 15.20.w,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'Phone Number',
                                                textStyle: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 12.4.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.infoGrey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 230.w,
                                                child: TextView(
                                                  text:
                                                      model
                                                          .getWholesaleOrderResponseModel!
                                                          .data!
                                                          .order!
                                                          .deliveryDetails
                                                          ?.phoneNumber ??
                                                      '',
                                                  maxLines: 4,
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 12.4.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(color: AppColors.infoGrey1),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 12.w),
                                            child: SvgPicture.asset(
                                              AppImage.order_notes,
                                              height: 15.20.h,
                                              width: 15.20.w,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'Order Notes',
                                                textStyle: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 12.4.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.infoGrey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 230.w,
                                                child: TextView(
                                                  text:
                                                      model
                                                          .getWholesaleOrderResponseModel!
                                                          .data!
                                                          .order!
                                                          .orderNotes ??
                                                      '',
                                                  maxLines: 4,
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 12.4.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 7.10.w,
                                    horizontal: 16.20.w,
                                  ),
                                  child: Divider(color: AppColors.infoGrey1),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.20.w,
                                    vertical: 1.0.w,
                                  ),
                                  child: TextView(
                                    text:
                                        model
                                                .getWholesaleOrderResponseModel!
                                                .data!
                                                .order!
                                                .items!
                                                .length >
                                            1
                                        ? 'Items(${model.getWholesaleOrderResponseModel!.data!.order!.items!.length})'
                                        : 'Items(1)',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 13.4.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),

                                model
                                            .getWholesaleOrderResponseModel!
                                            .data!
                                            .order!
                                            .items!
                                            .length >
                                        1
                                    ? Column(
                                        children: [
                                          ...model.getWholesaleOrderResponseModel!.data!.order!.items!.map(
                                            (e) => Container(
                                              margin: EdgeInsets.only(
                                                top: 20,
                                                left: 16.20.w,
                                                right: 16.20.w,
                                              ),
                                              padding: EdgeInsets.all(17.20.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                border: Border.all(
                                                  color: AppColors.infoGrey1,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                          10.w,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              AppColors.grey2,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                5.62.w,
                                                              ),
                                                          decoration:
                                                              BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .infoGrey2,
                                                              ),
                                                          child: ClipOval(
                                                            child: CachedNetworkImage(
                                                              imageUrl:
                                                                  e.imageUrl ??
                                                                  '',
                                                              height:
                                                                  isTablet(
                                                                    context,
                                                                  )
                                                                  ? 38.0.h
                                                                  : 28.8.h,
                                                              width:
                                                                  isTablet(
                                                                    context,
                                                                  )
                                                                  ? 38.0.w
                                                                  : 28.8.w,
                                                              errorWidget:
                                                                  (
                                                                    context,
                                                                    url,
                                                                    error,
                                                                  ) => SvgPicture.asset(
                                                                    AppImage
                                                                        .box_cart,
                                                                    height:
                                                                        isTablet(
                                                                          context,
                                                                        )
                                                                        ? 28.0.h
                                                                        : 18.h,
                                                                    width:
                                                                        isTablet(
                                                                          context,
                                                                        )
                                                                        ? 28.0.w
                                                                        : 18.w,
                                                                    color: AppColors
                                                                        .infoGrey,
                                                                  ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12.w),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            TextView(
                                                              text:
                                                                  e.productName
                                                                      ?.capitalize() ??
                                                                  '',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize:
                                                                    16.20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: TextView(
                                                                    text:
                                                                        'Qty ${e.quantity} | ${formatNaira(e.unitPrice!)}',
                                                                    textStyle: TextStyle(
                                                                      fontFamily:
                                                                          'DMSans',
                                                                      fontSize:
                                                                          13.20
                                                                              .sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .infoGrey,
                                                                      letterSpacing:
                                                                          -0.1,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: TextView(
                                                                    text: formatNaira(
                                                                      e.unitPrice! *
                                                                          e.quantity!,
                                                                    ),
                                                                    textStyle: TextStyle(
                                                                      fontFamily:
                                                                          'DMSans',
                                                                      fontSize:
                                                                          15.20
                                                                              .sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColors
                                                                          .reminder,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 4.w,
                                                          horizontal: 14.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            22.r,
                                                          ),
                                                      color: AppColors.grey,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextView(
                                                          text:
                                                              'Manufacturer: ',
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 13.20.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .infoGrey,
                                                            letterSpacing:
                                                                -0.21,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: TextView(
                                                            text:
                                                                ' ${e.manufacturerDistributorName}',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize:
                                                                  13.20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .reminder,
                                                              letterSpacing:
                                                                  -0.21,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Divider(
                                                    color: AppColors.grey,
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  TextView(
                                                    text: 'Order Tracking',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15.4.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.reminder,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.60.h),
                                                  Row(
                                                    children: [
                                                      TextView(
                                                        text: 'Est. Delivery:',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 13.10.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                      ),
                                                      TextView(
                                                        text:
                                                            ' ${formatDateNoTime(e.estimatedDeliveryDate?.toString() ?? '')}',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(height: 14.h),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10.64.w,
                                                              vertical: 3.42.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              e.tracking?[0].status
                                                                          ?.toLowerCase() ==
                                                                      'confirmed' &&
                                                                  e.tracking?[0].completed ==
                                                                      true
                                                              ? AppColors
                                                                    .app_green
                                                              : AppColors.grey,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                22,
                                                              ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons.check,
                                                              size: 15.80.sp,
                                                              color:
                                                                  e.tracking?[0].status
                                                                              ?.toLowerCase() ==
                                                                          'confirmed' &&
                                                                      e.tracking?[0].completed ==
                                                                          true
                                                                  ? AppColors
                                                                        .white
                                                                  : AppColors
                                                                        .infoGrey,
                                                            ),
                                                            SizedBox(
                                                              width: 4.w,
                                                            ),
                                                            TextView(
                                                              text:
                                                                  'Order Confirmed',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    e.tracking?[0].status
                                                                                ?.toLowerCase() ==
                                                                            'confirmed' &&
                                                                        e.tracking?[0].completed ==
                                                                            true
                                                                    ? AppColors
                                                                          .white
                                                                    : AppColors
                                                                          .infoGrey,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.w),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10.64.w,
                                                              vertical: 3.42.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              e.tracking?[1].status
                                                                          ?.toLowerCase() ==
                                                                      'packaging' &&
                                                                  e.tracking?[1].completed ==
                                                                      true
                                                              ? AppColors
                                                                    .app_green
                                                              : AppColors.grey,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                22,
                                                              ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons.check,
                                                              size: 15.80.sp,
                                                              color:
                                                                  e.tracking?[1].status
                                                                              ?.toLowerCase() ==
                                                                          'packaging' &&
                                                                      e.tracking?[1].completed ==
                                                                          true
                                                                  ? AppColors
                                                                        .white
                                                                  : AppColors
                                                                        .infoGrey,
                                                            ),
                                                            SizedBox(
                                                              width: 4.w,
                                                            ),
                                                            TextView(
                                                              text: 'Packaging',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    e.tracking?[1].status
                                                                                ?.toLowerCase() ==
                                                                            'packaging' &&
                                                                        e.tracking?[1].completed ==
                                                                            true
                                                                    ? AppColors
                                                                          .white
                                                                    : AppColors
                                                                          .infoGrey,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(height: 14.h),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10.64.w,
                                                              vertical: 3.42.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              e.tracking?[2].status
                                                                          ?.toLowerCase() ==
                                                                      'in_transit' &&
                                                                  e.tracking?[2].completed ==
                                                                      true
                                                              ? AppColors
                                                                    .amber
                                                              : AppColors.grey,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                22,
                                                              ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            SvgPicture.asset(
                                                              AppImage.delivery,
                                                              color:
                                                                  e.tracking?[2].status
                                                                              ?.toLowerCase() ==
                                                                          'in_transit' &&
                                                                      e.tracking?[2].completed ==
                                                                          true
                                                                  ? AppColors
                                                                        .appWhite
                                                                  : AppColors
                                                                        .infoGrey,
                                                            ),
                                                            SizedBox(
                                                              width: 4.w,
                                                            ),
                                                            TextView(
                                                              text:
                                                                  'In Transit',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    e.tracking?[2].status
                                                                                ?.toLowerCase() ==
                                                                            'in_transit' &&
                                                                        e.tracking?[2].completed ==
                                                                            true
                                                                    ? AppColors
                                                                          .white
                                                                    : AppColors
                                                                          .infoGrey,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 16.w),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10.64.w,
                                                              vertical: 3.42.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              e.tracking?[2].status
                                                                          ?.toLowerCase() ==
                                                                      'delivered' &&
                                                                  e.tracking?[2].completed ==
                                                                      true
                                                              ? AppColors
                                                                    .app_green
                                                              : AppColors
                                                                    .infoGrey1,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                22,
                                                              ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_circle_outline_outlined,
                                                              size: 14.sp,
                                                              color:
                                                                  e.tracking?[2].status
                                                                              ?.toLowerCase() ==
                                                                          'delivered' &&
                                                                      e.tracking?[2].completed ==
                                                                          true
                                                                  ? AppColors
                                                                        .white
                                                                  : AppColors
                                                                        .infoGrey,
                                                            ),
                                                            SizedBox(
                                                              width: 4.w,
                                                            ),
                                                            TextView(
                                                              text: 'Delivery',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    e.tracking?[3].status
                                                                                ?.toLowerCase() ==
                                                                            'delivered' &&
                                                                        e.tracking?[3].completed ==
                                                                            true
                                                                    ? AppColors
                                                                          .white
                                                                    : AppColors
                                                                          .infoGrey,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                          top: 20,
                                          left: 16.20.w,
                                          right: 16.20.w,
                                        ),
                                        padding: EdgeInsets.all(17.20.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                          border: Border.all(
                                            color: AppColors.infoGrey1,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(10.w),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.grey2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.r,
                                                        ),
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      5.62.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          AppColors.infoGrey2,
                                                    ),
                                                    child: ClipOval(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            model
                                                                .getWholesaleOrderResponseModel!
                                                                .data!
                                                                .order!
                                                                .items![0]
                                                                .imageUrl ??
                                                            '',
                                                        height:
                                                            isTablet(context)
                                                            ? 38.0.h
                                                            : 28.8.h,
                                                        width: isTablet(context)
                                                            ? 38.0.w
                                                            : 28.8.w,
                                                        errorWidget:
                                                            (
                                                              context,
                                                              url,
                                                              error,
                                                            ) => SvgPicture.asset(
                                                              AppImage.box_cart,
                                                              height:
                                                                  isTablet(
                                                                    context,
                                                                  )
                                                                  ? 28.0.h
                                                                  : 18.h,
                                                              width:
                                                                  isTablet(
                                                                    context,
                                                                  )
                                                                  ? 28.0.w
                                                                  : 18.w,
                                                              color: AppColors
                                                                  .infoGrey,
                                                            ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12.w),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      TextView(
                                                        text:
                                                            model
                                                                .getWholesaleOrderResponseModel!
                                                                .data!
                                                                .order!
                                                                .items![0]
                                                                .productName
                                                                ?.capitalize() ??
                                                            '',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 16.20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: TextView(
                                                              text:
                                                                  'Qty ${model.getWholesaleOrderResponseModel!.data!.order!.items![0].quantity} | ${formatNaira(model.getWholesaleOrderResponseModel!.data!.order!.items![0].unitPrice!)}',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize:
                                                                    13.20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .infoGrey,
                                                                letterSpacing:
                                                                    -0.1,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: TextView(
                                                              text: formatNaira(
                                                                model
                                                                        .getWholesaleOrderResponseModel!
                                                                        .data!
                                                                        .order!
                                                                        .items![0]
                                                                        .unitPrice! *
                                                                    model
                                                                        .getWholesaleOrderResponseModel!
                                                                        .data!
                                                                        .order!
                                                                        .items![0]
                                                                        .quantity!,
                                                              ),
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'DMSans',
                                                                fontSize:
                                                                    15.20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 4.w,
                                                horizontal: 14.w,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                                color: AppColors.grey,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text: 'Manufacturer: ',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 13.20.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.infoGrey,
                                                      letterSpacing: -0.21,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: TextView(
                                                      text:
                                                          ' ${model.getWholesaleOrderResponseModel!.data!.order!.items![0].manufacturerDistributorName ?? ''}',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 13.20.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                        letterSpacing: -0.21,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                          ],
                                        ),
                                      ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 16.20.w,
                                    vertical: 20.w,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 20.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.white,
                                    border: Border.all(
                                      color: AppColors.infoGrey1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextView(
                                            text: 'Subtotal',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          TextView(
                                            text: formatNaira(
                                              model
                                                  .getWholesaleOrderResponseModel!
                                                  .data!
                                                  .order!
                                                  .subtotal!,
                                            ),
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.42.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.reminder1,
                                              letterSpacing: -0.1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextView(
                                            text: 'Delivery',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          TextView(
                                            text: formatNaira(
                                              model
                                                  .getWholesaleOrderResponseModel!
                                                  .data!
                                                  .order!
                                                  .deliveryFee!,
                                            ),
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.42.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.reminder1,
                                              letterSpacing: -0.1,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Divider(color: AppColors.infoGrey1),
                                      SizedBox(height: 4.10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextView(
                                            text: 'Total:',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          TextView(
                                            text: formatNaira(
                                              model
                                                  .getWholesaleOrderResponseModel!
                                                  .data!
                                                  .order!
                                                  .total!,
                                            ),
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.42.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.reminder1,
                                              letterSpacing: -0.1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(14.w),
                            margin: EdgeInsets.only(bottom: 12.68.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: Colors.grey.shade200),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.03),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Order Number
                                TextView(
                                  text: e.orderNumber ?? '',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 18.20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.reminder1,
                                  ),
                                ),

                                SizedBox(height: 12.h),

                                /// Status Badge
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color:model.getOrderBadgeTextColorCont(e.badgeText!),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: TextView(
                                    text: e.badgeText ?? '',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 13.2.sp,
                                      fontWeight: FontWeight.w600,
                                      color:model.getOrderBadgeTextColor(e.badgeText!)
                                    ),
                                  ),
                                ),

                                SizedBox(height: 12.h),
                                TextView(
                                  text:
                                      "Placed on ${formatDate(e.placedAt!.toString())}",
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoGrey,
                                  ),
                                ),
                                SizedBox(height: 12.h),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    /// Amount & Delivery
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: formatNaira(e.total!),
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xff3A3A3A),
                                            ),
                                          ),

                                          SizedBox(height: 4.h),

                                          TextView(
                                            text:
                                                e.deliveryMethodLabel
                                                    ?.toUpperCase() ??
                                                '',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                              letterSpacing: .1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// Expand Button
                                    GestureDetector(
                                      onTap: () {
                                        model.wholesaleOrder = e;
                                        model.getWholesaleOrder(
                                          context: context,
                                          wholesaleOrderId:
                                              model.wholesaleOrder!.id!,
                                        );
                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        height: 44.w,
                                        width: 44.w,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF3F7FC),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xffD9E7FF),
                                          ),
                                        ),
                                        child:
                                            model.wholesaleOrder == e &&
                                                model.isLoading
                                            ? SpinKitRing(
                                                color: AppColors.primary,
                                                size: 16.30.sp,
                                                lineWidth: 2,
                                              )
                                            : const Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: Color(0xff0F56C3),
                                                size: 28,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                SizedBox(height: 20.h),
                model.wholesaleOrderListResponseModel == null
                    ? SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed:
                                model
                                        .wholesaleOrderListResponseModel!
                                        .data!
                                        .meta!
                                        .page ==
                                    1
                                ? () {}
                                : () async {
                                    model.pageAll--;
                                    model.getWholesaleOrderList(
                                      context: context,
                                    );
                                  },
                            icon: Icon(
                              Icons.arrow_back,
                              color:
                                  model
                                          .wholesaleOrderListResponseModel!
                                          .data!
                                          .meta!
                                          .page ==
                                      1
                                  ? AppColors.primary1.withOpacity(.4)
                                  : AppColors.primary1,
                              size: 20.sp,
                            ),
                          ),

                          model.isLoading
                              ? SpinKitFadingCircle(
                                  size: 20.sp,
                                  color: AppColors.fineGrey,
                                )
                              : TextView(
                                  text:
                                      'Page ${model.wholesaleOrderListResponseModel!.data!.meta!.page} of ${model.wholesaleOrderListResponseModel!.data!.meta!.totalPages}',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                          IconButton(
                            onPressed:
                                model
                                            .wholesaleOrderListResponseModel!
                                            .data!
                                            .meta!
                                            .page ==
                                        model
                                            .wholesaleOrderListResponseModel!
                                            .data!
                                            .meta!
                                            .totalPages ||
                                    model
                                            .wholesaleOrderListResponseModel!
                                            .data!
                                            .meta!
                                            .totalPages ==
                                        0
                                ? () {}
                                : () async {
                                    model.pageAll++;
                                    model.getWholesaleOrderList(
                                      context: context,
                                    );
                                  },
                            icon: Icon(
                              Icons.arrow_forward,
                              color:
                                  model
                                              .wholesaleOrderListResponseModel!
                                              .data!
                                              .meta!
                                              .page ==
                                          model
                                              .wholesaleOrderListResponseModel!
                                              .data!
                                              .meta!
                                              .totalPages ||
                                      model
                                              .wholesaleOrderListResponseModel!
                                              .data!
                                              .meta!
                                              .totalPages ==
                                          0
                                  ? AppColors.primary1.withOpacity(.4)
                                  : AppColors.primary1,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
