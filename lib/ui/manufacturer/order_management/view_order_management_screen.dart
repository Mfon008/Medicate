// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class ViewOrderManagementScreen extends StatelessWidget {
  const ViewOrderManagementScreen({super.key});

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
          text: 'View order',
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
                  TextView(
                    text: 'Customer Information',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16.82.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.cooool,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.infoGrey2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Apex Medical Clinic',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16.32.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                    'Apex Medical Clinic, 42 Broad Street, Lagos',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 14.2.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.reminder,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppImage.phone,
                              height: 14.h,
                              width: 10.w,
                              color: AppColors.primary,
                            ),
                            SizedBox(width: 10.h),
                            TextView(
                              text: '+234 80 4256789',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14.2.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextView(
                    text: 'Order Notes',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16.82.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 13.20.h),
                  TextView(
                    text: 'Call this number +234 80 4256789 for pick up ',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.82.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.reminder,
                      letterSpacing: -0.98,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'items (2)',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.82.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.reminder,
                        ),
                      ),
                      TextView(
                        text: 'Subtotal: ₦50,000 ',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.82.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.30.h),
                  ...[1, 1].map(
                    (e) => Container(
                      margin: EdgeInsets.only(bottom: 13.10.w),
                      padding: EdgeInsets.all(12.20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.infoGrey1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 52.w,
                            height: 52.h,
                            padding: EdgeInsets.all(2.0.w),
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: const Color.fromARGB(255, 236, 237, 237),
                              ),
                            ),
                            child: Image.asset(
                              AppImage.med_image,
                              height: 24.0.h,
                              width: 24.0.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextView(
                                  text: 'Antacid Tablets',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 16.20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.reminder,
                                  ),
                                ),

                                SizedBox(height: 2.10.h),
                                TextView(
                                  text: 'Qty 4 | ₦18,500',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 13.20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoGrey,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextView(
                            text: '₦25,000',
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
                  ),
                  SizedBox(height: 15.30.h),
                  TextView(
                    text: 'Fulfilment timeline',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.80.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.reminder,
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 3.72,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.app_green,
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
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      TextView(
                        text: 'Pending',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.app_green,
                          letterSpacing: -0.21,
                        ),
                      ),
                      SvgPicture.asset(
                        AppImage.arrow_right,
                        color: AppColors.app_green,
                        height: 12.h,
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.app_green,
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
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      TextView(
                        text: 'Confirm',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.app_green,
                          letterSpacing: -0.21,
                        ),
                      ),
                      SvgPicture.asset(
                        AppImage.arrow_right,
                        color: AppColors.app_green,
                        height: 12.h,
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
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
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      TextView(
                        text: 'Processing',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                          letterSpacing: -0.21,
                        ),
                      ),
                      SvgPicture.asset(
                        AppImage.arrow_right,
                        color: AppColors.infoGrey1,
                        height: 12.h,
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.infoGrey1,
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
                              color: AppColors.infoGrey,
                            ),
                          ),
                        ),
                      ),
                      TextView(
                        text: 'Out for delivery',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                          letterSpacing: -0.21,
                        ),
                      ),
                      SvgPicture.asset(
                        AppImage.arrow_right,
                        color: AppColors.infoGrey1,
                        height: 12.h,
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.infoGrey1,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: TextView(
                            text: '5',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14.20.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.infoGrey,
                            ),
                          ),
                        ),
                      ),
                      TextView(
                        text: 'Delivery',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                          letterSpacing: -0.21,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.w,
                            horizontal: 22.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primary,
                              width: 1.42,
                            ),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: TextView(
                            text: 'Cancel Order',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 15.20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.w,
                            horizontal: 28.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppImage.van,
                                height: isTablet(context) ? 28.40.h : 14.20.h,
                                width: isTablet(context) ? 28.40.w : 14.20.w,
                                color: AppColors.white,
                              ),
                              SizedBox(width: 7.10.w),
                              TextView(
                                text: 'Advance',
                                textStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 15.60.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
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
  }
}
