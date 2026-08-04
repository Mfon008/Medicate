// ignore_for_file: deprecated_member_use
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/app_validation.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class PharmacyWholeSaleCheckout extends StatelessWidget {
  const PharmacyWholeSaleCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {},
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
                fontFamily: 'GoogleSans',
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
                          SvgPicture.asset(AppImage.delivery),
                          SizedBox(width: 12.w),
                          TextView(
                            text: 'Delivery method',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 15.42.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          model.delivery = Delivery.instance;
                          model.dateTimeController.clear();
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
                                      fontFamily: 'GoogleSans',
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
                                  fontFamily: 'Arial',
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
                        onTap: () {
                          model.delivery = Delivery.schedule;
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
                                      fontFamily: 'GoogleSans',
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
                                  fontFamily: 'Arial',
                                  fontSize: 13.42.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      model.delivery == Delivery.schedule
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(color: AppColors.infoGrey1),
                                SizedBox(height: 12.h),
                                TextFormWidget(
                                  hint: 'Select Delivery Date',
                                  label: 'Pick a date',
                                  hintWeight: FontWeight.w400,
                                  hintColor: AppColors.reminder,
                                  hintSize: Platform.isAndroid ? 14.sp : 12.sp,
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
                                  validator: AppValidator.validateString(),
                                  style: TextStyle(
                                    fontSize: 16.20.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'GoogleSans',
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.20.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'GoogleSans',
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Select Time Window',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    TextView(
                                      text: '*',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 15.54.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),

                                GestureDetector(
                                  onTap: () {
                                    model.cartTimeAdded = CartAddedTime.morning;
                                    model.notifyListeners();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 12.4.w,
                                    ),
                                    margin: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            model.cartTimeAdded ==
                                                CartAddedTime.morning
                                            ? AppColors.primary
                                            : AppColors.infoGrey1,
                                        width: 1.22,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: 'Morning (8AM - 12PM)',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.82.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              model.cartTimeAdded ==
                                                  CartAddedTime.morning
                                              ? AppColors.primary
                                              : AppColors.infoGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.cartTimeAdded =
                                        CartAddedTime.afternoon;
                                    model.notifyListeners();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 12.4.w,
                                    ),
                                    margin: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            model.cartTimeAdded ==
                                                CartAddedTime.afternoon
                                            ? AppColors.primary
                                            : AppColors.infoGrey1,
                                        width: 1.22,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: 'Afternoon (12PM - 4PM)',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.82.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              model.cartTimeAdded ==
                                                  CartAddedTime.afternoon
                                              ? AppColors.primary
                                              : AppColors.infoGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.cartTimeAdded = CartAddedTime.evening;
                                    model.notifyListeners();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 12.4.w,
                                    ),
                                    margin: EdgeInsets.only(bottom: 12.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            model.cartTimeAdded ==
                                                CartAddedTime.evening
                                            ? AppColors.primary
                                            : AppColors.infoGrey1,
                                        width: 1.22,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: 'Evening (4PM - 8PM)',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.82.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              model.cartTimeAdded ==
                                                  CartAddedTime.evening
                                              ? AppColors.primary
                                              : AppColors.infoGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.w,
                                    horizontal: 16.w,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.cooool,
                                    borderRadius: BorderRadius.circular(8.0.r),
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
                                              fontFamily: 'GoogleSans',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 14.w),
                                      TextView(
                                        text:
                                            '${model.dateTimeController.text} . ${model.returnCartAddedTime(model.cartTimeAdded)}',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                          letterSpacing: -0.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : SizedBox.shrink(),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppImage.locator),
                          SizedBox(width: 12.w),
                          TextView(
                            text: 'Delivery details',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 15.42.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      TextFormWidget(
                        hint: 'State',
                        label: 'Select State',
                        hintWeight: FontWeight.w400,
                        hintColor: AppColors.reminder,
                        hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                        borderColor: AppColors.infoGrey1,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        readOnly: true,
                        fillColor: AppColors.white,
                        isFilled: true,
                        controller: model.stateController,
                        suffixWidget: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.infoGrey,
                            ),
                          ),
                        ),
                        validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                          color: AppColors.faintedGrey,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextFormWidget(
                        hint: 'LGA',
                        label: '--',
                        hintWeight: FontWeight.w400,
                        hintColor: AppColors.reminder,
                        hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                        borderColor: AppColors.infoGrey1,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        readOnly: true,
                        fillColor: AppColors.white,
                        isFilled: true,
                        controller: model.stateController,
                        suffixWidget: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.infoGrey,
                            ),
                          ),
                        ),
                        validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                          color: AppColors.faintedGrey,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextFormWidget(
                        hint: 'Delivery address',
                        label: 'Facility address, city, state',
                        hintWeight: FontWeight.w400,
                        hintColor: AppColors.reminder,
                        hintSize: Platform.isAndroid ? 14.sp : 12.sp,
                        borderColor: AppColors.infoGrey1,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        readOnly: true,
                        fillColor: AppColors.white,
                        isFilled: true,
                        controller: model.stateController,
                        maxline: 4,
                        validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                          color: AppColors.faintedGrey,
                        ),
                      ),
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
                        readOnly: true,
                        fillColor: AppColors.white,
                        isFilled: true,
                        controller: model.stateController,
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
                          fontFamily: 'GoogleSans',
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
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
                        readOnly: true,
                        fillColor: AppColors.white,
                        isFilled: true,
                        controller: model.stateController,
                        maxline: 4,
                        validator: AppValidator.validateString(),
                        style: TextStyle(
                          fontSize: 16.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GoogleSans',
                          color: AppColors.faintedGrey,
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
                              fontFamily: 'GoogleSans',
                              fontSize: 15.42.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 210.w,
                                child: TextView(
                                  maxLines: 1,
                                  text:
                                      'Amoxicillin 500mg (Carton of 100 packs)',
                                  textOverflow: TextOverflow.ellipsis,
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 15.42.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ),
                              TextView(
                                text: 'Qty: 4 | ₦18,500',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 12.42.sp,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.infoGrey,
                                  letterSpacing: -0.1,
                                ),
                              ),
                            ],
                          ),
                          TextView(
                            text: '₦37,000',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 14.42.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.reminder1,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: AppColors.infoGrey1),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Subtotal',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          TextView(
                            text: '₦37,000',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
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
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          TextView(
                            text: '₦5,000',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
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
                              fontFamily: 'Arial',
                              fontSize: 16.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          TextView(
                            text: '₦42,000',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
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
                          SvgPicture.asset(AppImage.wallet),
                          SizedBox(width: 12.w),
                          TextView(
                            text: 'Wallet payment',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 14.52.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.w,
                          horizontal: 16.w,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.cooool,
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Wallet Balance',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 4.10.h),
                                    TextView(
                                      text: '₦120,000',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                        letterSpacing: -0.1,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 18.30.w,
                                    vertical: 8.2.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.r),
                                    color: AppColors.primary,
                                  ),
                                  child: TextView(
                                    text: '+  Top up',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () =>navigate.navigateTo(Routes.pharmacyOrderScreen),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.w,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Center(
                            child: TextView(
                              text: 'Pay ₦42,000 & Place Order',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.90.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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

enum CartAddedTime { morning, afternoon, evening }
