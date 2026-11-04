// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:stacked/stacked.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class ViewOrderManagementScreen extends StatelessWidget {
  ViewOrderManagementScreen({super.key, required this.id});
  String? id;

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<ManufacturerViewModel>.reactive(
      viewModelBuilder: () => ManufacturerViewModel(),
      onViewModelReady: (model) async {
        await model.getIncomingOrderDetail(context, id: id);
        model.dDetailOrder =
            model.getIncomingOrderDdetailResponseModel!.data!.order;
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
              text: 'View Order',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.20.w, vertical: 20.0),
            child: Column(
              children: [
                if (model.getIncomingOrderDdetailResponseModel != null &&
                    model.getIncomingOrderDdetailResponseModel!.data != null &&
                    model.getIncomingOrderDdetailResponseModel!.data!.order !=
                        null)
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            model
                                            .getIncomingOrderDdetailResponseModel!
                                            .data!
                                            .order!
                                            .status!
                                            .toLowerCase() ==
                                        'cancelled' ||
                                    model
                                            .getIncomingOrderDdetailResponseModel!
                                            .data!
                                            .order!
                                            .status!
                                            .toLowerCase() ==
                                        'rejected'
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.r),
                                      color: AppColors.red_bar.withOpacity(.1),
                                      border: Border.all(
                                        color: AppColors.red_bar,
                                      ),
                                    ),
                                    child: TextView(
                                      text:
                                          model
                                              .getIncomingOrderDdetailResponseModel!
                                              .data!
                                              .order!
                                              .statusLabel ??
                                          '',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 11.82.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.red_bar,
                                      ),
                                    ),
                                  )
                                : model
                                          .getIncomingOrderDdetailResponseModel!
                                          .data!
                                          .order!
                                          .status!
                                          .toLowerCase() ==
                                      'returned'
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.r),
                                      color: AppColors.amber.withOpacity(.1),
                                      border: Border.all(
                                        color: AppColors.amber,
                                      ),
                                    ),
                                    child: TextView(
                                      text:
                                          model
                                              .getIncomingOrderDdetailResponseModel!
                                              .data!
                                              .order!
                                              .statusLabel ??
                                          '',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 11.82.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.amber,
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        SizedBox(height: 14.h),

                        TextView(
                          text:
                              'Order ${model.getIncomingOrderDdetailResponseModel!.data!.order!.orderNumber}',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 15.82.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(height: 2.0.h),
                        TextView(
                          text:
                              'Placed ${formatDate(model.dDetailOrder!.placedAt!.toString())}'
                              '${model.dDetailOrder!.splitOrder == true ? ' | ${model.dDetailOrder!.deliveries!.length} deliveries | Subtotal: ${formatNaira(model.dDetailOrder!.subtotal!)}' : ''}',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 13.02.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.infoGrey,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        model.dDetailOrder!.splitOrder == true
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text:
                                        'Delivery ${model.deliveryIndexSplit} of ${model.dDetailOrder?.deliveries?.length}',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 15.82.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: model.prevOrderSplitInfo,
                                        child: Container(
                                          padding: EdgeInsets.all(2.0.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              2.r,
                                            ),
                                            border: Border.all(
                                              color: AppColors.reminder1,
                                              width: 1.4,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            size: 12.sp,
                                            color: AppColors.reminder1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 14.0.w),
                                      GestureDetector(
                                        onTap: model.nextOrderSplitInfo,
                                        child: Container(
                                          padding: EdgeInsets.all(2.0.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              2.r,
                                            ),
                                            border: Border.all(
                                              color: AppColors.reminder1,
                                              width: 1.4,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 12.sp,
                                            color: AppColors.reminder1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text:
                                  'Items (${model.getIncomingOrderDdetailResponseModel!.data!.order!.items?.length ?? 0})',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 15.82.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                            TextView(
                              text:
                                  'Subtotal: ${formatNairaDouble(model.getIncomingOrderDdetailResponseModel!.data!.order!.subtotal!.toDouble())}',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16.82.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.reminder,
                                letterSpacing: -0.98,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.30.h),
                        model.dDetailOrder!.splitOrder == true
                            ? Column(
                                children: [
                                  if (model
                                      .getIncomingOrderDdetailResponseModel!
                                      .data!
                                      .order!
                                      .deliveries![model.deliveryIndexSplit - 1]
                                      .items!
                                      .isNotEmpty)
                                    ...model
                                        .getIncomingOrderDdetailResponseModel!
                                        .data!
                                        .order!
                                        .deliveries![model.deliveryIndexSplit -
                                            1]
                                        .items!
                                        .asMap()
                                        .entries
                                        .map((e) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  bottom: 13.10.w,
                                                ),
                                                padding: EdgeInsets.all(
                                                  12.20.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        12.r,
                                                      ),
                                                  border: Border.all(
                                                    color: AppColors.infoGrey1,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 52.w,
                                                      height: 52.h,
                                                      padding: EdgeInsets.all(
                                                        2.0.w,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.grey,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10.r,
                                                            ),
                                                        border: Border.all(
                                                          color:
                                                              const Color.fromARGB(
                                                                255,
                                                                236,
                                                                237,
                                                                237,
                                                              ),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                          4.0.w,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          border: Border.all(
                                                            color:
                                                                AppColors.grey2,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .grey2,
                                                              ),
                                                          child: ClipOval(
                                                            child: CachedNetworkImage(
                                                              imageUrl:
                                                                  e
                                                                      .value
                                                                      .imageUrl ??
                                                                  '',
                                                              height:
                                                                  isTablet(
                                                                    context,
                                                                  )
                                                                  ? 58.0.h
                                                                  : 38.8.h,
                                                              width:
                                                                  isTablet(
                                                                    context,
                                                                  )
                                                                  ? 58.0.w
                                                                  : 38.8.w,
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
                                                                        ? 48.0.h
                                                                        : 38.h,
                                                                    width:
                                                                        isTablet(
                                                                          context,
                                                                        )
                                                                        ? 48.0.w
                                                                        : 38.w,
                                                                    color: AppColors
                                                                        .infoGrey,
                                                                  ),
                                                              fit: BoxFit.cover,
                                                            ),
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
                                                                e
                                                                    .value
                                                                    .productName ??
                                                                '',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'GoogleSans',
                                                              fontSize:
                                                                  16.20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),

                                                          SizedBox(
                                                            height: 2.10.h,
                                                          ),
                                                          TextView(
                                                            text:
                                                                'Qty ${e.value.quantity} of ${e.value.minimumOrderQuantity}',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'GoogleSans',
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
                                                        ],
                                                      ),
                                                    ),
                                                    TextView(
                                                      text: formatNairaDouble(
                                                        e.value.lineTotal!
                                                            .toDouble(),
                                                      ),
                                                      textStyle: TextStyle(
                                                        fontFamily:
                                                            'GoogleSans',
                                                        fontSize: 15.20.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 14.0.h),
                                            ],
                                          );
                                        }),
                                ],
                              )
                            : Column(
                                children: [
                                  if (model
                                      .getIncomingOrderDdetailResponseModel!
                                      .data!
                                      .order!
                                      .items!
                                      .isNotEmpty)
                                    ...model.getIncomingOrderDdetailResponseModel!.data!.order!.items!.asMap().entries.map(
                                      (e) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 13.10.w,
                                            ),
                                            padding: EdgeInsets.all(12.20.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                color: AppColors.infoGrey1,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 52.w,
                                                  height: 52.h,
                                                  padding: EdgeInsets.all(
                                                    2.0.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10.r,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            236,
                                                            237,
                                                            237,
                                                          ),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      4.0.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10.r,
                                                          ),
                                                      border: Border.all(
                                                        color: AppColors.grey2,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors.grey2,
                                                      ),
                                                      child: ClipOval(
                                                        child: CachedNetworkImage(
                                                          imageUrl:
                                                              e
                                                                  .value
                                                                  .imageUrl ??
                                                              '',
                                                          height:
                                                              isTablet(context)
                                                              ? 58.0.h
                                                              : 38.8.h,
                                                          width:
                                                              isTablet(context)
                                                              ? 58.0.w
                                                              : 38.8.w,
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
                                                                    ? 48.0.h
                                                                    : 38.h,
                                                                width:
                                                                    isTablet(
                                                                      context,
                                                                    )
                                                                    ? 48.0.w
                                                                    : 38.w,
                                                                color: AppColors
                                                                    .infoGrey,
                                                              ),
                                                          fit: BoxFit.cover,
                                                        ),
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
                                                            e
                                                                .value
                                                                .productName ??
                                                            '',
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 16.20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),

                                                      SizedBox(height: 2.10.h),
                                                      TextView(
                                                        text:
                                                            'Qty  ${e.value.quantity ?? 0} | ${formatNairaDouble(e.value.unitPrice!.toDouble())}',
                                                        textStyle: TextStyle(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          fontSize: 13.20.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .infoGrey,
                                                          letterSpacing: -0.1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                TextView(
                                                  text: formatNairaDouble(
                                                    e.value.lineTotal!
                                                        .toDouble(),
                                                  ),
                                                  textStyle: TextStyle(
                                                    fontFamily: 'GoogleSans',
                                                    fontSize: 15.20.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 14.0.h),
                                        ],
                                      ),
                                    ),
                                ],
                              ),

                        if (model.getIncomingOrderDdetailResponseModel !=
                                null &&
                            model
                                .getIncomingOrderDdetailResponseModel!
                                .data!
                                .order!
                                .items!
                                .isNotEmpty)
                          model
                                          .getIncomingOrderDdetailResponseModel!
                                          .data!
                                          .order!
                                          .status!
                                          .toLowerCase() ==
                                      'cancelled' ||
                                  model
                                          .getIncomingOrderDdetailResponseModel!
                                          .data!
                                          .order!
                                          .status!
                                          .toLowerCase() ==
                                      'rejected'
                              ? Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 10.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.red_bar.withOpacity(.1),
                                    border: Border.all(
                                      color: AppColors.red_bar,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'Comment',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.red_bar,
                                        ),
                                      ),
                                      SizedBox(height: 6.10.h),
                                      TextView(
                                        text:
                                            model
                                                .getIncomingOrderDdetailResponseModel!
                                                .data!
                                                .order!
                                                .items?[0]
                                                .fulfillmentTimeline?[5]
                                                .status ??
                                            '',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 15.0.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Contact Person Information',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16.20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 14.20.h),
                                    model.dDetailOrder!.splitOrder == true
                                        ? Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(16.w),
                                            decoration: BoxDecoration(
                                              color: AppColors.cooool,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                color: AppColors.infoGrey2,
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
                                                    SvgPicture.asset(
                                                      AppImage.profile,
                                                      height: 14.h,
                                                      width: 10.w,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(width: 10.h),
                                                    TextView(
                                                      text:
                                                          model
                                                              .dDetailOrder!
                                                              .deliveries![model
                                                                      .deliveryIndexSplit -
                                                                  1]
                                                              .contactPerson
                                                              ?.name
                                                              ?.capitalize() ??
                                                          '',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 16.32.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 10.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.phone,
                                                      height: 14.h,
                                                      width: 10.w,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(width: 10.h),
                                                    TextView(
                                                      text:
                                                          model
                                                              .dDetailOrder!
                                                              .deliveries![model
                                                                      .deliveryIndexSplit -
                                                                  1]
                                                              .contactPerson
                                                              ?.phoneNumber ??
                                                          '',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 10.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.person_frame,
                                                      height: 14.h,
                                                      width: 10.w,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(width: 10.h),
                                                    TextView(
                                                      text:
                                                          model
                                                              .dDetailOrder!
                                                              .deliveries![model
                                                                      .deliveryIndexSplit -
                                                                  1]
                                                              .contactPerson
                                                              ?.idType ??
                                                          '',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 16.2.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 10.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.locator,
                                                      height: 14.h,
                                                      width: 10.w,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(width: 10.h),
                                                    Expanded(
                                                      child: TextView(
                                                        text:
                                                            model
                                                                .dDetailOrder!
                                                                .deliveries![model
                                                                        .deliveryIndexSplit -
                                                                    1]
                                                                .contactPerson
                                                                ?.address ??
                                                            '',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(16.w),
                                            decoration: BoxDecoration(
                                              color: AppColors.cooool,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              border: Border.all(
                                                color: AppColors.infoGrey2,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                  AppImage.profile,
                                                  height: 14.h,
                                                  width: 10.w,
                                                  color: AppColors.primary,
                                                ),
                                                SizedBox(width: 10.h),
                                                TextView(
                                                  text:
                                                      model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .customer
                                                          ?.name
                                                          ?.capitalize() ??
                                                      '',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 16.32.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.reminder,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.phone,
                                                      height: 14.h,
                                                      width: 10.w,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(width: 10.h),
                                                    TextView(
                                                      text:
                                                          model
                                                              .getIncomingOrderDdetailResponseModel!
                                                              .data!
                                                              .order!
                                                              .customer
                                                              ?.phoneNumber ??
                                                          '',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 14.2.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.person_frame,
                                                      height: 14.h,
                                                      width: 10.w,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(width: 10.h),
                                                    TextView(
                                                      text:
                                                          model
                                                              .getIncomingOrderDdetailResponseModel!
                                                              .data!
                                                              .order!
                                                              .customer
                                                              ?.address ??
                                                          '',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 14.2.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.reminder,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.locator,
                                                      height: 14.h,
                                                      width: 10.w,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(width: 10.h),
                                                    Expanded(
                                                      child: TextView(
                                                        text:
                                                            model
                                                                .getIncomingOrderDdetailResponseModel!
                                                                .data!
                                                                .order!
                                                                .customer
                                                                ?.address ??
                                                            '',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'DMSans',
                                                          fontSize: 16.2.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
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

                                    SizedBox(height: 20.h),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: 'Order Notes',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 15.82.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        model.dDetailOrder!.splitOrder == true
                                            ? TextView(
                                                text:
                                                    model
                                                            .getIncomingOrderDdetailResponseModel!
                                                            .data!
                                                            .order!
                                                            .deliveries![model
                                                                    .deliveryIndexSplit -
                                                                1]
                                                            .orderNotes !=
                                                        ''
                                                    ? model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .deliveries![model
                                                                  .deliveryIndexSplit -
                                                              1]
                                                          .orderNotes
                                                          .toString()
                                                    : 'No note',

                                                textStyle: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 14.02.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.reminder,
                                                ),
                                              )
                                            : TextView(
                                                text:
                                                    model
                                                            .getIncomingOrderDdetailResponseModel!
                                                            .data!
                                                            .order!
                                                            .orderNotes !=
                                                        ''
                                                    ? model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .orderNotes
                                                          .toString()
                                                    : 'No note',
                                                textStyle: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 14.02.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                        SizedBox(height: 15.30.h),
                                        TextView(
                                          text: 'Fulfilment Timeline',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 15.80.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: 10,
                                          runSpacing: 3.72,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: model.getFulfillmentOrderColor(
                                                  completed: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![0]
                                                      .completed,
                                                  current: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![0]
                                                      .current,
                                                  completed2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .completed,
                                                  current2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .current,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.w),
                                                child: TextView(
                                                  text: '1',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 14.20.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: model.getFulfillmentOrderTextColor(
                                                      completed: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![0]
                                                          .completed,
                                                      current: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![0]
                                                          .current,
                                                      completed2: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![1]
                                                          .completed,
                                                      current2: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![1]
                                                          .current,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .label ??
                                                  '',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.20.sp,
                                                fontWeight: FontWeight.w400,
                                                color: model.getFulfillmentOrderTextStatusColor(
                                                  completed: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![0]
                                                      .completed,
                                                  current: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![0]
                                                      .current,
                                                  completed2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .completed,
                                                  current2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .current,
                                                ),
                                                letterSpacing: -0.21,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              AppImage.arrow_right,
                                              color: model.getFulfillmentOrderColorArrow(
                                                completed: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![0]
                                                    .completed,
                                                current: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![0]
                                                    .current,
                                                completed2: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![1]
                                                    .completed,
                                                current2: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![1]
                                                    .current,
                                              ),
                                              height: 12.h,
                                              width: 10.w,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: model.getFulfillmentOrderColor(
                                                  completed: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .completed,
                                                  current: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .current,
                                                  completed2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .completed,
                                                  current2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .current,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.w),
                                                child: TextView(
                                                  text: '2',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 14.20.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: model.getFulfillmentOrderTextColor(
                                                      completed: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![1]
                                                          .completed,
                                                      current: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![1]
                                                          .current,
                                                      completed2: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![2]
                                                          .completed,
                                                      current2: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![2]
                                                          .current,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .label ??
                                                  '',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.20.sp,
                                                fontWeight: FontWeight.w400,
                                                color: model.getFulfillmentOrderTextStatusColor(
                                                  completed: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .completed,
                                                  current: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![1]
                                                      .current,
                                                  completed2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .completed,
                                                  current2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .current,
                                                ),
                                                letterSpacing: -0.21,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              AppImage.arrow_right,
                                              color: model.getFulfillmentOrderColorArrow(
                                                completed: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![1]
                                                    .completed,
                                                current: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![1]
                                                    .current,
                                                completed2: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![2]
                                                    .completed,
                                                current2: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![2]
                                                    .current,
                                              ),
                                              height: 12.h,
                                              width: 10.w,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: model.getFulfillmentOrderColor(
                                                  completed: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .completed,
                                                  current: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .current,
                                                  completed2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![3]
                                                      .completed,
                                                  current2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![3]
                                                      .current,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.w),
                                                child: TextView(
                                                  text: '3',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 14.20.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: model.getFulfillmentOrderTextColor(
                                                      completed: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![2]
                                                          .completed,
                                                      current: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![2]
                                                          .current,
                                                      completed2: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![3]
                                                          .completed,
                                                      current2: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![3]
                                                          .current,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextView(
                                              text: 'Out for Delivery',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.20.sp,
                                                fontWeight: FontWeight.w400,
                                                color: model.getFulfillmentOrderTextStatusColor(
                                                  completed: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .completed,
                                                  current: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![2]
                                                      .current,
                                                  completed2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![3]
                                                      .completed,
                                                  current2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![3]
                                                      .current,
                                                ),
                                                letterSpacing: -0.21,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              AppImage.arrow_right,
                                              color: model.getFulfillmentOrderColorArrow(
                                                completed: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![2]
                                                    .completed,
                                                current: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![2]
                                                    .current,
                                                completed2: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![3]
                                                    .completed,
                                                current2: model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .items![0]
                                                    .fulfillmentTimeline![3]
                                                    .current,
                                              ),
                                              height: 12.h,
                                              width: 10.w,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: model.getFulfillmentOrderColor(
                                                  completed: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![3]
                                                      .completed,
                                                  current: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![3]
                                                      .current,
                                                  completed2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![4]
                                                      .completed,
                                                  current2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![4]
                                                      .current,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.w),
                                                child: TextView(
                                                  text: '4',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 14.20.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: model.getFulfillmentOrderTextColor(
                                                      completed: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![3]
                                                          .completed,
                                                      current: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![3]
                                                          .current,
                                                      completed2: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![4]
                                                          .completed,
                                                      current2: model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .items![0]
                                                          .fulfillmentTimeline![4]
                                                          .current,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![4]
                                                      .label ??
                                                  '',
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.20.sp,
                                                fontWeight: FontWeight.w400,
                                                color: model.getFulfillmentOrderTextStatusColor(
                                                  completed: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![3]
                                                      .completed,
                                                  current: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![3]
                                                      .current,
                                                  completed2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![4]
                                                      .completed,
                                                  current2: model
                                                      .getIncomingOrderDdetailResponseModel!
                                                      .data!
                                                      .order!
                                                      .items![0]
                                                      .fulfillmentTimeline![4]
                                                      .current,
                                                ),
                                                letterSpacing: -0.21,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .status
                                                          ?.toLowerCase() ==
                                                      'delivered' ||
                                                  model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .status
                                                          ?.toLowerCase() ==
                                                      'returned' ||
                                                  model
                                                          .getIncomingOrderDdetailResponseModel!
                                                          .data!
                                                          .order!
                                                          .paymentStatus!
                                                          .toLowerCase() ==
                                                      'pending'
                                              ? 0.h
                                              : 22.0.h,
                                        ),
                                      ],
                                    ),
                                    model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .status
                                                    ?.toLowerCase() ==
                                                'delivered' ||
                                            model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .status
                                                    ?.toLowerCase() ==
                                                'returned' ||
                                            model
                                                    .getIncomingOrderDdetailResponseModel!
                                                    .data!
                                                    .order!
                                                    .paymentStatus!
                                                    .toLowerCase() ==
                                                'pending'
                                        ? SizedBox.shrink()
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IntrinsicWidth(
                                                child: GestureDetector(
                                                  onTap: () => model
                                                      .cancelIncomingOrderDialog(
                                                        context: context,
                                                        model: model,
                                                        orderId: id,
                                                      ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 12.w,
                                                          horizontal: 22.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            AppColors.primary,
                                                        width: 1.42,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            40.r,
                                                          ),
                                                    ),
                                                    child: TextView(
                                                      text: 'Cancel Order',
                                                      textStyle: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 15.20.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: GestureDetector(
                                                  onTap: () => model
                                                      .advanceDetailedIncomingOrderDialog(
                                                        context: context,
                                                        orderId: id,
                                                        text: model
                                                            .returnFulfillmentIncomingOrderText(
                                                              model
                                                                  .getIncomingOrderDdetailResponseModel!
                                                                  .data!
                                                                  .order!
                                                                  .status!,
                                                            ),
                                                        model: model,
                                                      ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 14.w,
                                                          horizontal: 28.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            40.r,
                                                          ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppImage.van,
                                                          height:
                                                              isTablet(context)
                                                              ? 28.40.h
                                                              : 14.20.h,
                                                          width:
                                                              isTablet(context)
                                                              ? 28.40.w
                                                              : 14.20.w,
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        SizedBox(width: 7.10.w),
                                                        TextView(
                                                          text: 'Advance',
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 15.60.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),

                        SizedBox(height: 42.0.h),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
