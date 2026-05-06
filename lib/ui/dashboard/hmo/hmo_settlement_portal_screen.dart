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

class HmoSettlementPortalScreen extends StatelessWidget {
  const HmoSettlementPortalScreen({super.key});

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
                      text: 'Hospital Settlements',
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 18.2.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.deep,
                      ),
                    ),
                    SizedBox(
                      width: 260.h,
                      child: TextView(
                        text: 'Manage payments to hospital partners',
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
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 16.20.sp,
                          color: AppColors.white,
                          weight: 10,
                        ),
                        onPressed: () => navigate.navigateTo(
                          Routes.createSettlementsPortalScreen,
                        ),
                        splashRadius: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: hmoPlanWidget(
                    text: 'Pending Claims',
                    svg: AppImage.settlements,
                    count: '15',
                    color: AppColors.yellow,
                  ),
                ),
                SizedBox(width: 7.10.w),
                Expanded(
                  child: hmoPlanWidget(
                    text: 'Paid Claims',
                    svg: AppImage.settings,
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
                text: 'Rejected Claims',
                svg: AppImage.renewal_request,
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
                          label: 'Search by subscriber, claim number',
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.infoGrey1),
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
                      Routes.viewHmoSettlementsPortalScreen,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 16.w,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.infoGrey1),
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 2.2.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.r),
                              border: Border.all(color: AppColors.yellow),
                            ),
                            child: TextView(
                              text: 'Pending',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.yellow,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.10.h),
                          TextView(
                            text:
                                'Lagos State University Teaching Hospital (LASUTH)',
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 16.52.sp,
                              fontWeight: FontWeight.w700,
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
                                    text: 'Settlement No',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  TextView(
                                    text: 'SLE-2025-001',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 16.42.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.thickGrey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 30.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Total Claims',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextView(
                                        text: '2 ',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 17.2.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.thickGrey,
                                        ),
                                      ),
                                      TextView(
                                        text: '(₦200,000)',
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
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Period Start',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  TextView(
                                    text: 'Jun 1, 2025',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.42.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.thickGrey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50.0.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Period End',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.infoGrey,
                                    ),
                                  ),
                                  TextView(
                                    text: 'Jun 1, 2026 ',
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Divider(color: AppColors.infoGrey1),
                  ),
                  SizedBox(height: 12.20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          size: 22.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 36.0.w),
                      TextView(
                        text: 'Page 1 of 10',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),

                      SizedBox(width: 36.0.w),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 22.sp,
                          color: AppColors.primary1,
                        ),
                      ),
                    ],
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
            fontSize: 13.82.sp,
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
