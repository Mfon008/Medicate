// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../core/connect_end/model/checkout_delivery_option_entity_model.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../widget/auto_scroll_text.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

// ignore: must_be_immutable
class PharmacyWholeSaleCheckout extends StatelessWidget {
  PharmacyWholeSaleCheckout({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) async {
        await model.getTenant(context);
        model.getWholesaleProductAddedToCart(context);
        if (model.getTetantResponseModel != null &&
            model.getTetantResponseModel!.data!.businessAddresses!.isNotEmpty) {
          final primaryAddresses = model
              .getTetantResponseModel!
              .data!
              .businessAddresses!
              .where((test) => test.isPrimary!);
          if (primaryAddresses.isNotEmpty) {
            model.mapLocationAddressSelected = primaryAddresses.first;
            await Future.delayed(Duration(microseconds: 10));
            await model.getCheckoutDeliveryOption(
              context: context,
              checkoutDeliveryOption: CheckoutDeliveryOptionEntityModel(
                deliveryAddressId: model.mapLocationAddressSelected!.id,
              ),
            );
            if (model.getCheckoutDeliveryOptionResponseModel != null &&
                model
                    .getCheckoutDeliveryOptionResponseModel!
                    .data!
                    .methods!
                    .isNotEmpty &&
                model
                        .getCheckoutDeliveryOptionResponseModel!
                        .data!
                        .methods![0]
                        .deliveryFee !=
                    null) {
              if (model.delivery == Delivery.instance) {
                model.deliveryFeeAmount = model
                    .getCheckoutDeliveryOptionResponseModel!
                    .data!
                    .methods![0]
                    .deliveryFee!;
              }
              model.notifyListeners();
            }
          }
        }
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
              text: 'Wholesale Checkout',
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
            padding: EdgeInsets.symmetric(horizontal: 17.2.w, vertical: 24.w),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppImage.order_summary),
                          SizedBox(width: 12.w),
                          TextView(
                            text: 'Order Summary',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15.42.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      if (model.wholesaleGetProductAddedToCartResponseModel !=
                          null)
                        ...model
                            .wholesaleGetProductAddedToCartResponseModel!
                            .data!
                            .cart!
                            .items!
                            .map(
                              (c) => Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 210.w,
                                            child: TextView(
                                              maxLines: 1,
                                              text:
                                                  c.product?.productName ?? '',
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              textStyle: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 15.42.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black,
                                                letterSpacing: -0.1,
                                              ),
                                            ),
                                          ),
                                          TextView(
                                            text:
                                                'Qty: ${c.quantity} | ${formatNaira(c.product?.priceDetails?.displayPricePerUnit ?? 0)}',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 12.42.sp,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.infoGrey,
                                              letterSpacing: -0.1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextView(
                                        text: formatNairaNoDecimal(
                                          c.lineTotal!,
                                        ),
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
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
                                ],
                              ),
                            ),

                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          model.isLoading
                              ? SpinKitRing(
                                  color: AppColors.primary,
                                  lineWidth: 2,
                                  size: 20.sp,
                                )
                              : TextView(
                                  text: formatNairaDouble(
                                    model
                                        .wholesaleGetProductAddedToCartResponseModel!
                                        .data!
                                        .cart!
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            text: formatNaira(model.deliveryFeeAmount),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          model.isLoading
                              ? SpinKitRing(
                                  color: AppColors.primary,
                                  lineWidth: 2,
                                  size: 20.sp,
                                )
                              : TextView(
                                  text: formatNairaDouble(
                                    model
                                            .wholesaleGetProductAddedToCartResponseModel!
                                            .data!
                                            .cart!
                                            .subtotal! +
                                        model.deliveryFeeAmount,
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
                // : SizedBox.shrink(),
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppImage.delivery),
                          SizedBox(width: 12.w),
                          TextView(
                            text: 'Delivery method',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15.42.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () async {
                          model.delivery = Delivery.instance;
                          model.dateTimeController.clear();
                          await Future.delayed(Duration(microseconds: 10));
                          if (model
                              .getCheckoutDeliveryOptionResponseModel!
                              .data!
                              .methods!
                              .isNotEmpty) {
                            model.deliveryFeeAmount = model
                                .getCheckoutDeliveryOptionResponseModel!
                                .data!
                                .methods![0]
                                .deliveryFee!;
                          } else {
                            model.deliveryFeeAmount = 0;
                          }
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 24.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.delivery == Delivery.instance
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<Delivery>(
                                    value: Delivery.instance,
                                    groupValue: model.delivery,
                                    activeColor: AppColors.primary,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.delivery = value!;
                                      model.notifyListeners();
                                    },
                                  ),
                                  SizedBox(width: 6.12.w),
                                  SvgPicture.asset(
                                    AppImage.delivery,
                                    color: AppColors.reminder,
                                  ),
                                  SizedBox(width: 6.12.w),
                                  TextView(
                                    text: 'Instant delivery',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 13.62.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              TextView(
                                text: 'Same-day express dispatch. ',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 13.42.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () async {
                          model.delivery = Delivery.schedule;
                          if (model
                                  .getCheckoutDeliveryOptionResponseModel!
                                  .data!
                                  .methods!
                                  .isNotEmpty &&
                              model
                                      .getCheckoutDeliveryOptionResponseModel!
                                      .data!
                                      .methods![1]
                                      .deliveryFee !=
                                  null) {
                            model.deliveryFeeAmount = model
                                .getCheckoutDeliveryOptionResponseModel!
                                .data!
                                .methods![1]
                                .deliveryFee!;
                          } else {
                            model.deliveryFeeAmount = 0;
                          }
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 24.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.delivery == Delivery.schedule
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<Delivery>(
                                    value: Delivery.schedule,
                                    groupValue: model.delivery,
                                    activeColor: AppColors.primary,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.delivery = value!;
                                      model.notifyListeners();
                                    },
                                  ),
                                  SizedBox(width: 6.12.w),
                                  SvgPicture.asset(
                                    AppImage.time,
                                    color: AppColors.reminder,
                                  ),
                                  SizedBox(width: 6.12.w),
                                  TextView(
                                    text: 'Scheduled block',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 13.62.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              TextView(
                                text:
                                    'Pick a reliable date and time window over the next week to fit your schedule.',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 13.42.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppImage.locator,
                              height: 12.h,
                              width: 12.w,
                            ),
                            SizedBox(width: 12.w),
                            TextView(
                              text: 'Delivery Address',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 15.42.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0.h),
                        if (model.getTetantResponseModel != null &&
                            model
                                .getTetantResponseModel!
                                .data!
                                .businessAddresses!
                                .isNotEmpty)
                          ...model.getTetantResponseModel!.data!.businessAddresses!.map(
                            (e) => GestureDetector(
                              onTap: () async {
                                model.mapLocationAddressSelected = e;
                                await Future.delayed(
                                  Duration(microseconds: 10),
                                );
                                await model.updatePrimaryBusinessAddress(
                                  context: context,
                                  id: model.mapLocationAddressSelected!.id!,
                                  isCheckout: true,
                                );
                                await model.getCheckoutDeliveryOption(
                                  context: context,
                                  checkoutDeliveryOption:
                                      CheckoutDeliveryOptionEntityModel(
                                        deliveryAddressId: model
                                            .mapLocationAddressSelected!
                                            .id,
                                      ),
                                );
                                if (model.getCheckoutDeliveryOptionResponseModel !=
                                        null &&
                                    model
                                        .getCheckoutDeliveryOptionResponseModel!
                                        .data!
                                        .methods!
                                        .isNotEmpty) {
                                  if (model.delivery == Delivery.instance &&
                                      model
                                              .getCheckoutDeliveryOptionResponseModel!
                                              .data!
                                              .methods![0]
                                              .deliveryFee !=
                                          null) {
                                    model.deliveryFeeAmount = model
                                        .getCheckoutDeliveryOptionResponseModel!
                                        .data!
                                        .methods![0]
                                        .deliveryFee!;
                                  }
                                  else if (model.delivery == Delivery.schedule &&
                                      model
                                              .getCheckoutDeliveryOptionResponseModel!
                                              .data!
                                              .methods![1]
                                              .deliveryFee !=
                                          null) {
                                    model.deliveryFeeAmount = model
                                        .getCheckoutDeliveryOptionResponseModel!
                                        .data!
                                        .methods![1]
                                        .deliveryFee!;
                                  } else {
                                    model.deliveryFeeAmount = 0;
                                  }
                                }
                                // if (model.delivery == Delivery.instance) {
                                //   model.quoteInstantDelivery(
                                //     context: context,
                                //     instantDelivery:
                                //         QuoteInstantDeliveryEntityModel(
                                //           deliveryMethod: 'INSTANT',
                                //           deliveryAddressId: model
                                //               .mapLocationAddressSelected!
                                //               .id,
                                //         ),
                                //   );
                                // }
                                // if (model.delivery == Delivery.schedule) {
                                //   await model.quoteScheduleDelivery(
                                //     context: context,
                                //     scheduleDelivery:
                                //         QuoteScheduleDeliveryEneityModel(
                                //           deliveryMethod: 'SCHEDULED_BLOCK',
                                //           deliveryAddressId: model
                                //               .mapLocationAddressSelected!
                                //               .id,
                                //           deliveryDate: convertDate(
                                //             model.dateTimeController.text,
                                //           ),
                                //           timeBlockStart:
                                //               model.time!.startTime,
                                //           timeBlockEnd: model.time!.endTime,
                                //         ),
                                //   );
                                // } else {}

                                model.notifyListeners();
                              },
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 14.w),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.w,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: model.mapLocationAddressSelected == e
                                        ? AppColors.primary
                                        : AppColors.infoGrey1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    model.mapLocationAddressSelected == e
                                        ? Container(
                                            padding: EdgeInsets.all(2.6.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColors.primary,
                                                width: 2,
                                              ),
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(3.2.w),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(6.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColors.infoGrey1,
                                                width: 2,
                                              ),
                                            ),
                                          ),

                                    SizedBox(width: 10.w),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoScrollingText(
                                            text: e.businessAddress ?? '',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14.20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),

                                          SizedBox(height: 3.h),

                                          AutoScrollingText(
                                            text:
                                                '${e.lga}, ${e.state}, ${e.country}',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 13.20.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.infoGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          model.delivery == Delivery.schedule
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 12.h),
                                  TextFormWidget(
                                    hint: 'Select Delivery Date',
                                    label: 'Pick a date',
                                    hintWeight: FontWeight.w400,
                                    hintColor: AppColors.reminder,
                                    hintSize: Platform.isAndroid
                                        ? 14.sp
                                        : 12.sp,
                                    borderColor: AppColors.infoGrey1,
                                    borderTopLeft: 10.r,
                                    borderTopRight: 10.r,
                                    borderBottomLeft: 10.r,
                                    borderBottomRight: 10.r,
                                    readOnly: true,
                                    fillColor: AppColors.white,
                                    isFilled: true,
                                    controller: model.dateTimeController,
                                    suffixWidget: Padding(
                                      padding: EdgeInsets.all(8.w),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await model.selectDateCheckout(
                                            context: context,
                                            model: model,
                                          );
                                          model.notifyListeners();
                                        },
                                        child: SvgPicture.asset(
                                          AppImage.calendar,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    validator: AppValidator.validateString(),
                                    style: TextStyle(
                                      fontSize: 16.20.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'DMSans',
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 15.20.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'DMSans',
                                      color: AppColors.faintedGrey,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              )
                            : SizedBox.shrink(),
                        model.dateTimeController.text != ''
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (model
                                          .getCheckoutDeliveryOptionResponseModel !=
                                      null)
                                    ...model
                                        .getCheckoutDeliveryOptionResponseModel!
                                        .data!
                                        .methods!
                                        .where(
                                          (test) =>
                                              test.method!.toLowerCase() ==
                                              "SCHEDULED_BLOCK".toLowerCase(),
                                        )
                                        .map(
                                          (e) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text: 'Select Time Window',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 13.78.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors.reminder,
                                                    ),
                                                  ),
                                                  TextView(
                                                    text: '*',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15.54.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              if (e.timeBlocks!.isNotEmpty)
                                                ...e.timeBlocks!.map(
                                                  (time) => GestureDetector(
                                                    onTap: () async {
                                                      model.time = time;
                                                      model.notifyListeners();
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 12.4.w,
                                                          ),
                                                      margin: EdgeInsets.only(
                                                        bottom: 12.w,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              model.time == time
                                                              ? AppColors
                                                                    .primary
                                                              : AppColors
                                                                    .infoGrey1,
                                                          width: 1.22,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10.r,
                                                            ),
                                                      ),
                                                      child: Center(
                                                        child: TextView(
                                                          text:
                                                              '${time.name} (${formatTime(time.startTime!)} - ${formatTime(time.endTime!)})',
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 14.82.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                model.time ==
                                                                    time
                                                                ? AppColors
                                                                      .primary
                                                                : AppColors
                                                                      .infoGrey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),],
                                          ),
                                        ),

                                  SizedBox(height: 10.w),
                                  model.time != null
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12.w,
                                            horizontal: 16.w,
                                          ),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColors.cooool,
                                            borderRadius: BorderRadius.circular(
                                              8.0.r,
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
                                                    AppImage.calendar,
                                                    fit: BoxFit.cover,
                                                    color: AppColors.primary,
                                                  ),
                                                  SizedBox(width: 12.w),
                                                  TextView(
                                                    text: 'Select Window',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors.reminder,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 14.w),
                                              TextView(
                                                text:
                                                    '${model.dateTimeController.text} . ${model.time?.name ?? ''} (${formatTime(model.time?.startTime ?? '')} - ${formatTime(model.time?.endTime ?? '')})',
                                                textStyle: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.reminder,
                                                  letterSpacing: -0.1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'Contact phone',
                          label: '+234',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.white,
                          isFilled: true,
                          controller: model.phoneController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          prefixWidget: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: SvgPicture.asset(
                              AppImage.phone,
                              color: AppColors.infoGrey,
                            ),
                          ),
                          validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),
                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormWidget(
                          hint: 'Order notes (Optional)',
                          isShowHint: true,
                          label: 'E.g. Call central storage clerk upon arrival',
                          hintWeight: FontWeight.w400,
                          hintColor: AppColors.reminder,
                          hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                          borderColor: AppColors.infoGrey1,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          fillColor: AppColors.white,
                          isFilled: true,
                          controller: model.orderNotesController,
                          maxline: 4,
                          // validator: AppValidator.validateString(),
                          style: TextStyle(
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                          ),
                          labelStyle: TextStyle(
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.faintedGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20.w, top: 10.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Payment Method',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.56.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          model.payMethod = PayMethod.accelerate;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.6.w,
                            vertical: 16.20.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.payMethod == PayMethod.accelerate
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<PayMethod>(
                                    value: PayMethod.accelerate,
                                    groupValue: model.payMethod,
                                    fillColor: WidgetStateProperty.all(
                                      model.payMethod == PayMethod.accelerate
                                          ? AppColors.primary
                                          : AppColors.infoGrey,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.payMethod = value!;
                                      model.notifyListeners();
                                    },
                                  ),

                                  SizedBox(width: 6.12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          AppImage.accelerate,
                                          height: 16.h,
                                          width: 90.w,
                                        ),
                                        SizedBox(height: 8.10.h),
                                        TextView(
                                          text:
                                              'Direct gateway payment with card, transfer or USSD..',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 13.62.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.faintedGrey,
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

                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          model.payMethod = PayMethod.wallet;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.6.w,
                            vertical: 16.20.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: model.payMethod == PayMethod.wallet
                                  ? AppColors.primary
                                  : AppColors.infoGrey1,
                              width: 1.22,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio<PayMethod>(
                                    value: PayMethod.wallet,
                                    groupValue: model.payMethod,
                                    fillColor: WidgetStateProperty.all(
                                      model.payMethod == PayMethod.wallet
                                          ? AppColors.primary
                                          : AppColors.infoGrey,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                      horizontal: -4,
                                      vertical: -4,
                                    ),
                                    onChanged: (value) {
                                      model.payMethod = value!;
                                      model.notifyListeners();
                                    },
                                  ),

                                  SizedBox(width: 6.12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: 'Wallet Balance',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14.56.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        SizedBox(height: 8.10.h),
                                        TextView(
                                          text:
                                              'Pay instantly from your Medicate wallet.',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 13.62.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.faintedGrey,
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
                      SizedBox(height: 30.h),
                      Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    model.paymentMethodFlowWholesale(
                                      context,
                                      amount:model
                                            .wholesaleGetProductAddedToCartResponseModel!
                                            .data!
                                            .cart!
                                            .subtotal! +
                                        model.deliveryFeeAmount);
                                    model.notifyListeners();
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.w,
                                    horizontal: 12.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(40.r),
                                  ),
                                  child: Center(
                                    child: model.isLoadingWallet
                                        ? SpinKitFadingCircle(
                                            color: AppColors.appWhite,
                                            size: 40.sp,
                                          )
                                        : TextView(
                                            text: 'Place Order',
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.20.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          
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

enum Delivery { instance, schedule }

enum PayMethod { accelerate, wallet, flutterwave }

enum CartAddedTime { morning, afternoon, evening }
