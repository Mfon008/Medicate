// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/ui/widget/button.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../widget/text.dart';

class ViewHmoSubscribersPortalScreen extends StatelessWidget {
  const ViewHmoSubscribersPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: GlobalNavigator(),
              ),
              SizedBox(width: 20.w),
              Center(
                child: TextView(
                  text: 'View Application',
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 18.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.deep,
                  ),
                ),
              ),
              SizedBox(height: 50.h, width: 50.w),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Individual Basic Plan',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.deep,
                          ),
                        ),
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
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        TextView(
                          text: '₦75,000',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.deep,
                          ),
                        ),
                        TextView(
                          text: ' /12 Months',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.infoGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.0.h),
              TextView(
                text: 'Subscriber',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Adebayo Okonkwo',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Subscriber ID',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'PRO-RUBY-001',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Status',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 7.20.h),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.6.w,
                  horizontal: 12.w,
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
              SizedBox(height: 20.h),
              TextView(
                text: 'Email',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Adebayo@gmail.com',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Phone Number',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: '08123456789',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Start Date',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'June 1, 2025',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'End Date',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'June 1, 2026',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 40.h),

              ButtonWidget(
                border: 100.r,
                buttonColor: AppColors.primary,
                buttonText: 'Cancel Subscription',
                color: AppColors.white,
                buttonBorderColor: AppColors.primary,
                onPressed: () {},
              ),
              SizedBox(height: 20.60.h),
            ],
          ),
        ),
      ),
    );
  }
}
