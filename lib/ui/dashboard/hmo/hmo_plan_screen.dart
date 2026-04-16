// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class HmoPlanScreen extends StatefulWidget {
  const HmoPlanScreen({super.key});

  @override
  State<HmoPlanScreen> createState() => _HmoPlanScreenState();
}

// make value a class variable so you can pass the index of the plan to hide and unhide
bool isShow = false;

class _HmoPlanScreenState extends State<HmoPlanScreen> {
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
                text: 'HMO Plans',
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
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Your Plans',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 18.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.reminder,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: 210.w,
                      child: TextView(
                        text: 'Create and manage your HMO subscription plans',
                        maxLines: 2,
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 20.0.sp,
                        weight: 10,
                      ),
                      SizedBox(width: 3.6.w),
                      TextView(
                        text: 'Create Plan',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.82.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hmoPlanWidget(
                  count: '17',
                  svg: AppImage.hmo_shield,
                  text: 'All Plans',
                  svgColor: AppColors.lightBlue,
                ),
                SizedBox(width: 10.w),
                hmoPlanWidget(
                  count: '15',
                  svg: AppImage.hmo_shield,
                  text: 'Pending Review',
                  svgColor: AppColors.yellow,
                ),
              ],
            ),
            SizedBox(height: 14.20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hmoPlanWidget(
                  count: '10',
                  svg: AppImage.hmo_shield,
                  text: 'Active Plans',
                  svgColor: AppColors.app_green,
                ),
                SizedBox(width: 10.w),
                hmoPlanWidget(
                  count: '5',
                  svg: AppImage.hmo_shield,
                  text: 'Reject plans',
                  svgColor: AppColors.red,
                ),
              ],
            ),
            SizedBox(height: 16.h),
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
                    label: 'Search Plan',
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
                    padding: EdgeInsets.all(10.w),
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
                                border: Border.all(color: AppColors.app_green),
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
                            GestureDetector(
                              onTap: () => setState(() => isShow = !isShow),
                              child: TextView(
                                text: !isShow ? 'Show more' : 'Hide',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14.2.sp,
                                  fontWeight: FontWeight.w500,
                                  color: !isShow
                                      ? AppColors.fineGrey
                                      : AppColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: !isShow
                                      ? AppColors.fineGrey
                                      : AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        TextView(
                          text: 'Individual Basic Plan',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 16.52.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Renewal Price',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.fineGrey,
                                  ),
                                ),
                                SizedBox(height: 4.10.h),
                                TextView(
                                  text: '₦75,000',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.thickGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 40.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Renewal Price',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.fineGrey,
                                  ),
                                ),
                                SizedBox(height: 4.10.h),
                                TextView(
                                  text: '₦75,000',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.thickGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Duration',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.fineGrey,
                                  ),
                                ),
                                SizedBox(height: 4.10.h),
                                TextView(
                                  text: '₦65,000',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.thickGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 80.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Max Dependent',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.fineGrey,
                                  ),
                                ),
                                SizedBox(height: 4.10.h),
                                TextView(
                                  text: '1',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.thickGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: isShow ? 15.20.h : 0.h),
                        isShow
                            ? Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.w,
                                      horizontal: 12.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.skyBlue,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.cool_blue,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text:
                                              'Basic individual health coverage',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.52.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        SizedBox(height: 14.20.h),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.light_check,
                                            ),
                                            SizedBox(width: 8.10.w),
                                            TextView(
                                              text: 'General Consultation',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 14.52.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                            SizedBox(width: 6.90.w),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 2.2.h,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                                color: AppColors.white,
                                                border: Border.all(
                                                  color: AppColors.fineGrey
                                                      .withOpacity(.3),
                                                ),
                                              ),
                                              child: TextView(
                                                text: 'Unlimited',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 13.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 14.20.h),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.light_check,
                                            ),
                                            SizedBox(width: 8.10.w),
                                            TextView(
                                              text: 'Emergency Care',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 14.52.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.reminder,
                                              ),
                                            ),
                                            SizedBox(width: 3.90.w),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 8.w,
                                                vertical: 2.2.h,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                                color: AppColors.white,
                                                border: Border.all(
                                                  color: AppColors.fineGrey
                                                      .withOpacity(.3),
                                                ),
                                              ),
                                              child: TextView(
                                                text: 'Up to ₦500,000',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 13.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
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
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.w,
                                      horizontal: 12.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.skyBlue,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.cool_blue,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: 'Hospital Networks',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.52.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        SizedBox(height: 14.20.h),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 2.2.h,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                                border: Border.all(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              child: TextView(
                                                text: 'Abia',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primary,
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
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                                border: Border.all(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              child: TextView(
                                                text: 'Anambra',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primary,
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
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                                border: Border.all(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              child: TextView(
                                                text: 'Enugu',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                         SizedBox(height: 20.w),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
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

  Widget hmoPlanWidget({
    String? text,
    String? svg,
    String? count,
    Color? svgColor,
  }) => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 12.w),
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
          SizedBox(height: 10.w),
          Row(
            children: [
              SvgPicture.asset(
                svg!,
                width: 20.w,
                height: 20.h,
                color: svgColor,
              ),
              SizedBox(width: 6.10.w),
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
    ),
  );
}
