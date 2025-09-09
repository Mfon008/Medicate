// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/widget/button.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../widget/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          text: 'Profile',
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
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.20.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset(AppImage.profile_image)),
              Center(
                child: TextView(
                  text: 'Change Photo',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14.2.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Center(
                child: TextView(
                  text:
                      '${SharedPreferencesService.instance.usersData['displayName'] ?? ''}',
                  textStyle: TextStyle(
                    fontSize: 18.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: 2.10.h),
              Center(
                child: TextView(
                  text:
                      '${SharedPreferencesService.instance.usersData['email'] ?? ''}',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.infoGrey,
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              profileContainer(
                icon: AppImage.profile,
                text: 'Profile Information',
                topLeft: 12,
                topRight: 12,
                onTap: () => navigate.navigateTo(Routes.profileInfoScreen),
              ),
              SizedBox(height: 1.0.h),
              profileContainer(
                icon: AppImage.key,
                text: 'Login & Security',
                onTap: () => navigate.navigateTo(Routes.resetPinPadScreen),
              ),
              SizedBox(height: 30.h),
              TextView(
                text: 'WALLET & PAYMENT',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 10.h),
              profileContainer(
                icon: AppImage.wallet,
                text: 'Wallet',
                topLeft: 12,
                topRight: 12,
              ),
              SizedBox(height: 30.h),
              TextView(
                text: 'SUPPORT & HELP',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
              SizedBox(height: 10.h),
              profileContainer(
                icon: AppImage.chat_support,
                text: 'Contact Support',
                topLeft: 12,
                topRight: 12,
                onTap: () => navigate.navigateTo(Routes.supportScreen),
              ),
              SizedBox(height: 1.0.h),
              profileContainer(
                icon: AppImage.faq,
                text: 'FAQ',
                onTap: () => navigate.navigateTo(Routes.faqScreen),
              ),
              SizedBox(height: 1.0.h),
              profileContainer(
                icon: AppImage.terms,
                text: 'Terms & Conditions',
              ),
              SizedBox(height: 1.0.h),
              profileContainer(
                icon: AppImage.policy,
                text: 'Privacy Policy',
                bottomLeft: 12,
                bottomRight: 12,
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0.w),
                      decoration: BoxDecoration(
                        color: AppColors.red.withOpacity(.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        AppImage.logout,
                        height: 20.2.h,
                        width: 20.2.w,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    TextView(
                      text: 'Log Out',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.2.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  profileContainer({
    String? icon,
    String? text,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    Function()? onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft.r),
          topRight: Radius.circular(topRight.r),
          bottomLeft: Radius.circular(bottomLeft.r),
          bottomRight: Radius.circular(bottomRight.r),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.0.w),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withOpacity(.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: SvgPicture.asset(icon!, height: 20.2.h, width: 20.2.w),
          ),
          SizedBox(width: 20.w),
          TextView(
            text: text ?? '',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 16.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          Spacer(),
          SvgPicture.asset(AppImage.arrow_forward, color: AppColors.infoGrey),
        ],
      ),
    ),
  );
}
