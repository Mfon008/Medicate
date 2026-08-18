// ignore_for_file: must_be_immutable, strict_top_level_inference, deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/ui/widget/text.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../core/core_folder/app/app.router.dart';
import '../../main.dart';

class OverviewScreen extends StatelessWidget {
  OverviewScreen({super.key});

  GlobalKey<FormState> formKeyBulkUploads = GlobalKey<FormState>();

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
                  GestureDetector(
                    onTap: () => _showModalBottomSheet(context),
                    child: Container(
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

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(22.6.w),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Keeps sheet height minimal
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextView(
                      text: 'Select Option',
                      color: AppColors.deep,
                      fontWeight: FontWeight.w700,
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 15.60.sp,
                        color: AppColors.deep,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context), // Closes the sheet
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0.w),
                        child: SvgPicture.asset(
                          AppImage.cancel,
                          height: 14.20.h,
                          width: 14.20.w,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  navigate.navigateTo(Routes.addProductScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.30.w,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AppColors.white, size: 24.sp),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'Add Manually',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.90.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  bulkUploadShowDialog(
                    context: context,
                    model: ManufacturerViewModel(),
                  );
                  // Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.30.w,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImage.upload_icon,
                        width: 20.w,
                        height: 17.20.h,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'Bulk upload',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.90.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.30.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImage.download_icon,
                            width: 12.20.w,
                            height: 14.20.h,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10.w),
                          TextView(
                            text: 'CSV Template',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14.90.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 14.46.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.30.w,
                        horizontal: 5.10.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImage.download_icon,
                            width: 12.20.w,
                            height: 14.20.h,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10.w),
                          TextView(
                            text: 'Export Products',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14.90.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }

  void bulkUploadShowDialog({context, ManufacturerViewModel? model}) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        return ListenableBuilder(
          listenable: model!,
          builder: (_, _) {
            return Container(
              color: AppColors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: Colors.white, size: 18),
                      label: Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.10.h),
                  Dialog(
                    insetPadding: EdgeInsets.all(16.20.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.all(14.w),
                      child: Form(
                        key: formKeyBulkUploads,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextView(
                              text: 'Bulk Upload Products',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                color: AppColors.reminder,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            TextView(
                              text:
                                  'Upload a CSV file containing your product roster.',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                color: AppColors.reminder,
                                fontSize: 15.10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            SizedBox(
                              width: double.infinity,
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  dashPattern: [20, 20],
                                  strokeWidth: .94,
                                  radius: Radius.circular(10),
                                  color: AppColors.grey,
                                ),
                                child: GestureDetector(
                                  // onTap: () => model.pickImageMeansIdPractitioner(context),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 24.30.w,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.grey,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppImage.upload_doc,
                                          height: 24.0.h,
                                          width: 24.0.h,
                                        ),
                                        SizedBox(height: 10.h),
                                        TextView(
                                          text:
                                              'Click to upload or drag and drop CSV file',
                                          textAlign: TextAlign.center,
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
                                            text: 'Support format: CSV',
                                            textAlign: TextAlign.center,
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
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.50.h),
                            TextView(
                              text:
                                  'Note: Use our downloadable CSV Template to structure columns.',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                color: AppColors.reminder,
                                fontSize: 15.10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 25.h),
                            // 🔹 Save button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  // width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.grey,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: model.isLoading
                                        ? SpinKitCircle(
                                            color: AppColors.deep,
                                            size: 22.sp,
                                          )
                                        : Text(
                                            "Cancel",
                                            style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.sp,
                                              color: AppColors.deep,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: model.isLoading
                                        ? SpinKitCircle(
                                            color: AppColors.white,
                                            size: 22.sp,
                                          )
                                        : Text(
                                            "Upload",
                                            style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.sp,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
