// ignore_for_file: strict_top_level_inference, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import '../../core/app_assets/app_validation.dart';
import '../../core/app_assets/constant.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../../main.dart';
import '../widget/auto_scroll_text.dart';
import '../widget/button.dart';
import '../widget/text.dart';
import '../widget/text_form_widget.dart';

class FulfilmentHomeScreen extends StatelessWidget {
  const FulfilmentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 80.0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppImage.applogoSvg, height: 28.h, width: 28.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withValues(alpha: .1),
                      border: Border.all(
                        color: AppColors.inactive.withValues(alpha: .4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.bell,
                        height: isTablet(context) ? 40.h : 20.h,
                        width: isTablet(context) ? 40.w : 20.w,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                      splashRadius: 24,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 2.4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withValues(alpha: .1),
                      border: Border.all(
                        color: AppColors.inactive.withValues(alpha: .4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.profile,
                        height: isTablet(context) ? 40.h : 20.h,
                        width: isTablet(context) ? 40.w : 20.w,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                      splashRadius: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            TextView(
              text: 'Dashboard',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18.20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: TextFormWidget(
                    label: 'Search products, manufacturers, SKU...',
                    labelStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.60.sp,
                      color: AppColors.fineGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    isFilled: true,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    fillColor: AppColors.white,
                    prefixWidget:
                        // model.isLoading
                        //     ? SizedBox(
                        //         width: 20.w,
                        //         height: 20.w,
                        //         child: Center(
                        //           child: SpinKitFadingCircle(
                        //             color: AppColors.primary1,
                        //             size: 18.sp,
                        //           ),
                        //         ),
                        //       )
                        //     :
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 12.6.w,
                          ),
                          child: SvgPicture.asset(AppImage.search),
                        ),
                    onChange: (value) {
                      // model.debouncer.run(() {
                      //   model.getListedMarketPlace(context);
                      // });
                      // model.searchProduct = value;
                    },
                  ),
                ),
                SizedBox(width: 22.40.w),
                GestureDetector(
                  onTap: () => modalBottomSheetMenu(context),
                  child: SvgPicture.asset(
                    AppImage.filter,
                    color: AppColors.grey1,
                    height: 15.20.h,
                    width: 15.20.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.infoGrey1),
                color: AppColors.appWhite,
              ),
              child: Row(
                children: [
                  SizedBox(width: 4.w),
                  TextView(
                    text: 'Status: ',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.22.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.reminder,
                    ),
                  ),
                  TextView(
                    text: 'All',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.22.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 20.0.sp,
                      color: AppColors.infoGrey,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () => navigate.navigateTo(Routes.viewOrderScreen),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 14.w),
                padding: EdgeInsets.symmetric(
                  vertical: 15.22.w,
                  horizontal: 13.0.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.infoGrey1),
                  color: AppColors.appWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'W0-2026-583',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.22.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        IntrinsicWidth(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.w,
                              horizontal: 12.0.w,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue.withOpacity(.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: TextView(
                                text: 'In Transit',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 12.2.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lightBlue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              
                    SizedBox(height: 8.2.h),
                    TextView(
                      text: 'Scheduled | Deadline on Jul 14, 2026, 11:22 AM',
                      textStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14.22.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.infoGrey,
                        letterSpacing: -0.52,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImage.add_locator,
                          height: 20.h,
                          width: 20.w,
                        ),
              
                        SizedBox(width: 10.w),
              
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoScrollingText(
                                text: 'Test Pharmacy',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 14.20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
              
                              SizedBox(height: 3.h),
              
                              AutoScrollingText(
                                text: capitalizeUnderscore(
                                  'Federal Capital Territory · AMAC',
                                ),
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
              
                        SizedBox(width: 10.w),
              
                        Container(
                          height: 30.h,
                          width: 30.0.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.inactive.withValues(alpha: .1),
                            border: Border.all(
                              color: AppColors.inactive.withValues(alpha: .4),
                            ),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              AppImage.van,
                              height: isTablet(context) ? 20.h : 14.0.h,
                              width: isTablet(context) ? 20.w : 14.0.w,
                              color: AppColors.primary,
                            ),
                            onPressed: () {},
                            // navigate.navigateTo(Routes.emptyNotification),
                            // splashRadius: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void modalBottomSheetMenu(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: AppColors.white,
      constraints: BoxConstraints(maxWidth: double.infinity),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false, // 👈 allows proper layout
          builder: (context, scrollController) {
            return SafeArea(
              child: SingleChildScrollView(
                controller: scrollController, // 👈 critical
                padding: EdgeInsets.symmetric(
                  vertical: 13.20.w,
                  horizontal: 20.w,
                ),
                child: Form(
                  // key: formKeyValidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- your content ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 50.w),
                          TextView(
                            text: 'Filter Search',
                            textStyle: TextStyle(
                              fontSize: 16.2.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () => navigate.back(),
                            icon: SvgPicture.asset(AppImage.cancel),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      TextFormWidget(
                        label: 'All',
                        hint: 'State',
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        borderColor: AppColors.infoGrey2,
                        hintWeight:  FontWeight.w400,
                        isFilled: true,
                        readOnly: true,
                        fillColor: AppColors.transparent,
                        validator: AppValidator.validateString(),
                        suffixWidget: Padding(
                          padding: EdgeInsets.all(14.20.w),
                          child: SvgPicture.asset(AppImage.arrow_down),
                        ),
                      ),
                      SizedBox(height: 16.0.h),
                      TextFormWidget(
                        label: 'All',
                        hint: 'LGA',
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        borderColor: AppColors.infoGrey2,
                        hintWeight: FontWeight.w400,
                        isFilled: true,
                        readOnly: true,
                        fillColor: AppColors.transparent,
                        validator: AppValidator.validateString(),
                        suffixWidget: Padding(
                          padding: EdgeInsets.all(14.20.w),
                          child: SvgPicture.asset(AppImage.arrow_down),
                        ),
                      ),
                      SizedBox(height: 16.0.h),

                      // --- Month & Year inputs ---
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Date Assigned',
                            textStyle: TextStyle(
                              fontSize: 16.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormWidget(
                                  label: 'From',
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  borderColor: AppColors.infoGrey2,
                                  labelStyle: TextStyle(
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  // fillColor: AppColors.dashboard,
                                  isFilled: true,
                                  // controller: monthController,
                                  fillColor: AppColors.transparent,
                                  validator: AppValidator.validateString(),
                                  // suffixWidget: Padding(
                                  //   padding: EdgeInsets.all(14.20.w),
                                  //   child: SvgPicture.asset(
                                  //     AppImage.arrow_down,
                                  //   ),
                                  // ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: TextFormWidget(
                                  label: 'To',
                                  borderTopLeft: 10.r,
                                  borderTopRight: 10.r,
                                  borderBottomLeft: 10.r,
                                  borderBottomRight: 10.r,
                                  borderColor: AppColors.infoGrey2,
                                  labelStyle: TextStyle(
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  isFilled: true,
                                  // controller: yearController,
                                  fillColor: AppColors.transparent,
                                  validator: AppValidator.validateString(),
                                  // suffixWidget: Padding(
                                  //   padding: EdgeInsets.all(14.20.w),
                                  //   child: SvgPicture.asset(
                                  //     AppImage.arrow_down,
                                  //   ),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                      // --- Reset link ---
                      TextView(
                        text: 'Reset filter',
                        textStyle: TextStyle(
                          fontSize: 14.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: ButtonWidget(
                              border: 100.r,
                              buttonColor: AppColors.dashboard,
                              buttonText: 'Cancel',
                              color: AppColors.black,
                              buttonBorderColor: AppColors.transparent,
                              onPressed: () => navigate.back(),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Flexible(
                            child: ButtonWidget(
                              border: 100.r,
                              buttonColor: AppColors.primary,
                              buttonText: 'Apply',
                              color: AppColors.white,
                              buttonBorderColor: AppColors.transparent,
                              onPressed: () {
                                // if (formKeyValidate.currentState!.validate()) {
                                //   navigate.navigateTo(Routes.setupPinScreen);
                                // }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
