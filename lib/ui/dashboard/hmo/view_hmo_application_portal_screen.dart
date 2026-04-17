// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/ui/widget/button.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../widget/text.dart';

class ViewHmoApplicationPortalScreen extends StatelessWidget {
  const ViewHmoApplicationPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isTablet(BuildContext context) =>
    //   MediaQuery.of(context).size.shortestSide >= 600;
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
              Column(
                children: [
                  TextView(
                    text: 'View Application',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 18.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.deep,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextView(
                    text: 'Date Applied: Jan 17, 2026',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                ],
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
              SizedBox(height: 17.8.h),
              TextView(
                text: 'Personal Information',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 17.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.reminder,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(color: AppColors.infoGrey1, thickness: 1.0.h),
              SizedBox(height: 10.h),
              TextView(
                text: 'Full Name',
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
                text: 'Date of Birth',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Jan 17, 2026',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Gender',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Male',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Email Address',
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
                text: 'Residential Address',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'No. 12 Aminu Kano Crescent,Wuse II,Abuja, FCT, Nigeria',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Preferred Hospital',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'Zankli Medical Centre, Abuja',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 24.h),
              TextView(
                text: 'Medical History',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.reminder,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(color: AppColors.infoGrey1, thickness: 1.0.h),
              SizedBox(height: 10.h),
              TextView(
                text: 'Medical History',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'No significant medical history',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text: 'Chronic Ailment',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 4.h),
              TextView(
                text: 'No',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder1,
                ),
              ),
              SizedBox(height: 24.h),
              TextView(
                text: 'Documents',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.reminder,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(color: AppColors.infoGrey1, thickness: 1.0.h),
              SizedBox(height: 10.h),
              TextView(
                text: 'Birth Certificate or Age Declaration',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.4.w,
                  vertical: 10.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.fineGrey),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.kyc_file),
                    SizedBox(width: 14.w),
                    Expanded(
                      flex: 3,
                      child: TextView(
                        text: 'Name of uploaded file.jpg',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textStyle: TextStyle(
                          fontSize: 14.22.sp,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(AppImage.kyc_eye),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              TextView(
                text:
                    "Valid ID (National ID, International Passport, Driver's License, Voter's Card)",
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.4.w,
                  vertical: 10.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.fineGrey),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.kyc_file),
                    SizedBox(width: 14.w),
                    Expanded(
                      flex: 3,
                      child: TextView(
                        text: 'Name of uploaded file.jpg',
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textStyle: TextStyle(
                          fontSize: 14.22.sp,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(AppImage.kyc_eye),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 42.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      border: 100.r,
                      buttonColor: AppColors.white,
                      buttonText: 'Reject',
                      color: AppColors.primary,
                      buttonBorderColor: AppColors.primary,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: ButtonWidget(
                      border: 100.r,
                      buttonColor: AppColors.primary,
                      buttonText: 'Approve',
                      color: AppColors.white,
                      buttonBorderColor: AppColors.transparent,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.60.h),
            ],
          ),
        ),
      ),
    );
  }
}
