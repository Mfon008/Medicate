import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';

import '../widget/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Container(
            margin: EdgeInsets.all(1.6.w),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.inactive.withOpacity(.1),
              border: Border.all(color: AppColors.primaryLight),
            ),
            child: SvgPicture.asset(AppImage.burger),
          ),
        ),
        title: SvgPicture.asset(AppImage.applogoSvg),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 6.w),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.inactive.withOpacity(.1),
              border: Border.all(color: AppColors.primaryLight),
            ),
            child: SvgPicture.asset(AppImage.bell),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 14.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.yellow),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.yellow),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Complete Registration',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      TextView(
                        text: 'Please enter your new PIN.',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 12.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.infoGrey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(AppImage.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
