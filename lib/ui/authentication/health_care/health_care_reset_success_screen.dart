import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class HealthCareResetSuccessScreen extends StatelessWidget {
  const HealthCareResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(vertical: 60.w, horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImage.applogoSvg, width: 116.w, height: 28.h),
            SizedBox(height: 100.0.h),
            SvgPicture.asset(AppImage.success, width: 56.w, height: 56.h),
            SizedBox(height: 10.h),
            TextView(
              text: 'PIN Reset Successful!',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 30.h),
            TextView(
              text:
                  'You have successfully reset your PIN and can now log in with your new PIN.',
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14.42.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(height: 270.h),
            ButtonWidget(
              border: 100.r,
              buttonColor: AppColors.primary,
              fontSize: 16.sp,
              buttonText: 'Go to Dashboard',
              color: AppColors.white,
              buttonBorderColor: AppColors.transparent,
              onPressed: () {
                navigate.navigateTo(Routes.healthCareLoginScreen);
              },
            ),
            SizedBox(height: 20.30.h),
          ],
        ),
      ),
    );
  }
}
