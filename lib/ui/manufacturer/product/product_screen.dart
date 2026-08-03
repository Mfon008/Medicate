// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 14.88.w, vertical: 24.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Products',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 18.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      TextView(
                        text: isTablet(context)
                            ? 'Manage wholesale products'
                            : 'Manage wholesale\nproducts',
                        maxLines: 2,
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet(context) ? 16.w : 13.0.w,
                      vertical: isTablet(context) ? 12.w : 9.2.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 20.0.sp,
                          weight: 10,
                        ),
                        SizedBox(width: 2.6.w),
                        TextView(
                          text: 'Add Product',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14.22.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.infoGrey1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormWidget(
                    label: 'Search by products',
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
                    fillColor: AppColors.grey,
                    prefixWidget: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 12.6.w,
                      ),
                      child: SvgPicture.asset(
                        AppImage.search,
                        color: AppColors.infoGrey,
                      ),
                    ),
                    onChange: (value) {},
                  ),
                  SizedBox(height: 14.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
