// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/ui/widget/text.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

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
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withValues(alpha: .1),
                  border: Border.all(
                    color: AppColors.inactive.withValues(alpha: .4),
                  ),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.burger,
                    color: AppColors.primary,
                    height: isTablet(context) ? 32.h : 12.h,
                    width: isTablet(context) ? 32.w : 12.w,
                  ),
                  onPressed: () {},
                  // onPressed: () => navigate.navigateTo(
                  //   Routes.moreScreen,
                  // ), // makes ripple effect round
                ),
              ),
              SvgPicture.asset(AppImage.applogoSvg, height: 28.h, width: 28.w),
              Container(
                margin: EdgeInsets.only(right: 2.4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withValues(alpha: .1),
                  border: Border.all(
                    color: AppColors.inactive.withValues(alpha: .4),
                  ),
                ),
                child: Stack(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        AppImage.bell,
                        height: isTablet(context) ? 40.h : 20.h,
                        width: isTablet(context) ? 40.w : 20.w,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                      // onPressed: () =>
                      //     navigate.navigateTo(Routes.notificationScreen),
                      splashRadius: 28,
                    ),
                    // model.getUnreadNotificationCountModel != null &&
                    //         model
                    //                 .getUnreadNotificationCountModel!
                    //                 .data!
                    //                 .count! >
                    //             0
                    //     ? Positioned(
                    //         left: 28,
                    //         top: 8,
                    //         child: Container(
                    //           padding: EdgeInsets.all(3.14.w),
                    //           decoration: BoxDecoration(
                    //             color: AppColors.appRed.withOpacity(.88),
                    //             shape: BoxShape.circle,
                    //           ),
                    //         ),
                    //       )
                    //     : SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 12.24.w,
                vertical: 24.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color.fromARGB(255, 31, 151, 232),
                    const Color.fromARGB(255, 34, 95, 175),
                    const Color.fromARGB(255, 34, 95, 175),
                  ],
                ),
              ),
              child: Column(
                children: [
                  TextView(
                    text: 'WELCOME BACK',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15.36.sp,
                      color: const Color.fromARGB(178, 234, 236, 240),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 7.10.h),
                  Text(
                    'Emzor Pharmaceuticals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 22.30.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 4.2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: TextView(
                      text:
                          'Fulfil incoming orders and track earnings from your enlisted products.',
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14.8.sp,
                        color: AppColors.white.withOpacity(.95),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  TextView(
                    text: 'DELIVERED REVENUE',
                    textStyle: TextStyle(
                      fontSize: 14.76.sp,
                      color: const Color.fromARGB(159, 234, 236, 240),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  // SizedBox(height: 3.2.h),
                  TextView(
                    text: '₦200,00',
                    textStyle: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: 'DMSans',
                      height: 2,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 168.0.w,
                    height: 44.2.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: const Color.fromARGB(176, 107, 192, 248),
                      // gradient: LinearGradient(
                      //   colors: [
                      //     const Color.fromARGB(68, 255, 255, 255).withOpacity(.28),
                      //     const Color.fromARGB(83, 255, 255, 255).withOpacity(.15),
                      //   ],
                      // ),
                      border: Border.all(
                        color: AppColors.white.withOpacity(.25),
                      ),
                    ),
                    child: Center(
                      child: TextView(
                        text: 'Go to orders',
                        textStyle: TextStyle(
                          fontSize: 16.28.sp,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Enlisted products',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16.90.sp,
                      color: AppColors.reminder,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9.10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0.r),
                          color: AppColors.manu_color1,
                          border: Border.all(
                            color: AppColors.manu_color.withOpacity(.9),
                          ),
                        ),
                        child: SvgPicture.asset(
                          AppImage.box_cart,
                          color: AppColors.primary,
                          height: 20.h,
                          width: 20.w,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      TextView(
                        text: '0',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 22.90.sp,
                          color: AppColors.reminder,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9.10.h),
                  TextView(
                    text: '0 pending • 0 rejected',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.90.sp,
                      color: AppColors.infoGrey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.21,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Open orders',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16.90.sp,
                      color: AppColors.reminder,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9.10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0.r),
                          color: AppColors.manu_color1,
                          border: Border.all(
                            color: AppColors.manu_color.withOpacity(.9),
                          ),
                        ),
                        child: SvgPicture.asset(
                          AppImage.truck,
                          color: AppColors.primary,
                          height: 16.20.h,
                          width: 12.20.w,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      TextView(
                        text: '0',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 22.90.sp,
                          color: AppColors.reminder,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9.10.h),
                  TextView(
                    text: 'In-flight fulfilment',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.90.sp,
                      color: AppColors.infoGrey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.21,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Delivered revenue',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16.90.sp,
                      color: AppColors.reminder,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9.10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0.r),
                          color: AppColors.manu_color1,
                          border: Border.all(
                            color: AppColors.manu_color.withOpacity(.9),
                          ),
                        ),
                        child: SvgPicture.asset(
                          AppImage.naira,
                          color: AppColors.primary,
                          height: 17.20.h,
                          width: 17.20.w,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      TextView(
                        text: '₦0',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 22.90.sp,
                          color: AppColors.reminder,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9.10.h),
                  TextView(
                    text: 'Lifetime',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14.90.sp,
                      color: AppColors.infoGrey,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.21,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Total orders',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16.90.sp,
                      color: AppColors.reminder,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 9.10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0.r),
                          color: AppColors.manu_color1,
                          border: Border.all(
                            color: AppColors.manu_color.withOpacity(.9),
                          ),
                        ),
                        child: SvgPicture.asset(
                          AppImage.manu_order,
                          color: AppColors.primary,
                          height: 20.h,
                          width: 20.w,
                        ),
                      ),
                      SizedBox(width: 10.h),
                      TextView(
                        text: '0',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 22.90.sp,
                          color: AppColors.reminder,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Recent orders',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 18.90.sp,
                      color: AppColors.reminder,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 9.10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text:
                            'Latest customer purchases\ncontaining your products',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14.90.sp,
                          color: AppColors.reminder,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextView(
                        text: 'View all',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14.90.sp,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                          color: AppColors.primary1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: AppColors.infoGrey1,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            AppImage.manu_order,
                            color: AppColors.infoGrey,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextView(
                          text: 'No orders yet',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14.90.sp,
                            color: AppColors.infoGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Quick actions',
                    textStyle: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16.90.sp,
                      color: AppColors.reminder,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 13.10.h),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: AppColors.primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: AppColors.white, size: 20.w),
                        SizedBox(width: 7.10.w),
                        TextView(
                          text: 'Add Product',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14.90.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.50.h),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.infoGrey1,
                        width: 1.42,
                      ),
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImage.truck,
                          height: isTablet(context) ? 32.40.h : 18.20.h,
                          width: isTablet(context) ? 32.40.w : 18.20.w,
                          color: AppColors.reminder,
                        ),
                        SizedBox(width: 7.10.w),
                        TextView(
                          text: 'Fulfil open orders',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14.90.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.reminder,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
