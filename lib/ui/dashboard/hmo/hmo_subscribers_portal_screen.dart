// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/main.dart';

import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class HmoSubscribersPortalScreen extends StatelessWidget {
  const HmoSubscribersPortalScreen({super.key});

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
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.burger,
                    color: AppColors.primary,
                    height: isTablet(context) ? 32.h : 12.h,
                    width: isTablet(context) ? 32.w : 12.w,
                  ),
                  onPressed: () => navigate.navigateTo(
                    Routes.hMOMoreScreen,
                  ), // makes ripple effect round
                ),
              ),
              TextView(
                text: 'HMO Portal',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deep,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 2.4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.bell,
                    height: isTablet(context) ? 40.h : 20.h,
                    width: isTablet(context) ? 40.w : 20.w,
                    color: AppColors.primary,
                  ),
                  onPressed: () {},
                  splashRadius: 28,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => navigate.back(),
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.reminder1),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 12.sp,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Subscribers',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 18.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.deep,
                      ),
                    ),
                    SizedBox(
                      width: 280.h,
                      child: TextView(
                        text: 'Manage your active subscribers and renewals',
                        maxLines: 2,
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: hmoPlanWidget(
                    text: 'All Subscribers',
                    svg: AppImage.sub_members,
                    count: '15',
                    color: AppColors.lightBlue,
                  ),
                ),
                SizedBox(width: 7.10.w),
                Expanded(
                  child: hmoPlanWidget(
                    text: 'Active Plans',
                    svg: AppImage.sub_members,
                    count: '10',
                    color: AppColors.app_green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.20.h),
            FractionallySizedBox(
              widthFactor: 0.5, // 50% of screen
              alignment: Alignment.centerLeft,
              child: hmoPlanWidget(
                text: 'Expired Plans',
                svg: AppImage.sub_members,
                count: '5',
                color: AppColors.red,
              ),
            ),
            SizedBox(height: 20.h),
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFormWidget(
                          label: 'Search by name, phone number, email',
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
                      ),
                      SizedBox(width: 14.w),
                      SvgPicture.asset(
                        AppImage.earth,
                        color: AppColors.lightBlue,
                        height: 14.50.h,
                        width: 22.50.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  TextView(
                                    text: 'Type: ',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14.82.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  TextView(
                                    text: 'All',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14.60.sp,
                                      color: AppColors.infoGrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 40.w),
                              SvgPicture.asset(AppImage.arrow_down),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  TextView(
                                    text: 'Tier: ',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14.82.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  TextView(
                                    text: 'All',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 14.60.sp,
                                      color: AppColors.infoGrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 40.w),
                              SvgPicture.asset(AppImage.arrow_down),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            TextView(
                              text: 'Date: ',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.82.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.black,
                              ),
                            ),
                            TextView(
                              text: 'Time All',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.60.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(AppImage.arrow_down),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  GestureDetector(
                    onTap: () => navigate.navigateTo(
                      Routes.viewHmoSubscribersPortalScreen,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(18.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 2.2.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.r),
                                  border: Border.all(
                                    color: AppColors.app_green,
                                  ),
                                ),
                                child: TextView(
                                  text: 'Active',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.app_green,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 2.2.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.r),
                                  border: Border.all(
                                    color: AppColors.red.withOpacity(.18),
                                  ),
                                  color: AppColors.faintedRed,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.star,
                                      color: AppColors.appRed,
                                    ),
                                    SizedBox(width: 6.w),
                                    TextView(
                                      text: 'Ruby',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 14.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              TextView(
                                text: '131 days left',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 16.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.10.h),
                          TextView(
                            text: 'Adebayo Okonkwo',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 16.52.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Subscription ID',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  TextView(
                                    text: 'PRO-PEARL-001',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.thickGrey,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Expiry Date',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  TextView(
                                    text: 'Jun 1, 2026',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.thickGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 13.20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Email',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.infoGrey,
                                ),
                              ),
                              TextView(
                                text: 'emeka@titantech.com',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.reminder,
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
          ],
        ),
      ),
    );
  }

  Widget hmoPlanWidget({
    String? text,
    String? svg,
    String? count,
    Color? color,
  }) => Container(
    padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 20.w),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColors.infoGrey1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: text!,
          textStyle: TextStyle(
            fontFamily: 'Arial',
            fontSize: 15.2.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.reminder,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            SvgPicture.asset(
              svg!,
              width: 16.20.w,
              height: 16.20.h,
              color: color,
            ),
            SizedBox(width: 7.10.w),
            TextView(
              text: count!,
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 20.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
