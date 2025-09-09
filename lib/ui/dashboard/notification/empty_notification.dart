import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';

import '../../../core/config/colors.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

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
          text: 'Notifications',
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
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 180.h),
              SvgPicture.asset(AppImage.not_sym),
              SizedBox(height: 20.30.h),
              TextView(
                text: 'No Notifications at the moment',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 5.10.h),
              TextView(
                text: 'You’ll be notified when you get one',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
