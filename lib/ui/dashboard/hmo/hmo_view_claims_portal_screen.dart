// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/colors.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class ViewHmoClaimsPortalScreen extends StatelessWidget {
  const ViewHmoClaimsPortalScreen({super.key});

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
              TextView(
                text: 'View Claims',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deep,
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
          padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 18.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: 'Subscriber',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Adebayo Okonkwo',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Subscriber ID',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'PRO-PEARL-001',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Unknown Hospital',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Lagos State University Teaching Hospital (LASUTH)',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Type',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Emergency',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Amount',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: '₦75,000',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Description',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Emergency room visit for accident',
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
                  vertical: 2.46.w,
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
              SizedBox(height: 40.h),

              ButtonWidget(
                border: 100.r,
                buttonColor: AppColors.primary,
                buttonText: 'Review Claim',
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
