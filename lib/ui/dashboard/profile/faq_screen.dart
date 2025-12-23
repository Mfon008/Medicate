import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';

import '../../../core/config/colors.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

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
          text: 'Frequently Asked Questions',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 19.20.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 22.w,
                horizontal: 18.20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Everything you need to know about our Medicate.',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      letterSpacing: .6,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  conContainer(
                    text1: 'Is there a free trial available?',
                    text2:
                        'Yes, you can try us for free for 30 days. If you want, we’ll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible.',
                    isCancel: true,
                  ),
                  conContainer(
                    text1: 'Can I change my plan later?',
                    text2: '',
                    isCancel: false,
                  ),
                  conContainer(
                    text1: 'What is your cancellation policy?',
                    text2: '',
                    isCancel: false,
                  ),
                  conContainer(
                    text1: 'Can other info be added to an invoice?',
                    text2: '',
                    isCancel: false,
                  ),
                  conContainer(
                    text1: 'How does billing work?',
                    text2: '',
                    isCancel: false,
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Container conContainer({
    String? text1,
    String? text2,
    bool isCancel = false,
  }) => Container(
    margin: EdgeInsets.symmetric(vertical: 8.12.w),
    padding: EdgeInsets.symmetric(
      horizontal: 10.w,
      vertical: text2 == '' ? 12.6.w : 14.w,
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: AppColors.reminder.withOpacity(.2)),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.w),
              child: TextView(
                text: text1 ?? '',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 12.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: text2 == '' ? 0 : 5.10.h),
            text2 == ''
                ? SizedBox.shrink()
                : SizedBox(
                    width: 220.w,
                    child: TextView(
                      text: text2 ?? '',
                      maxLines: 6,
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.2.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ),
          ],
        ),

        SizedBox(width: 13.20.w),
        Container(
          padding: EdgeInsets.all(isCancel ? 8 : 5.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.dashboard,
          ),
          child: isCancel
              ? SvgPicture.asset(
                  AppImage.cancel,
                  color: AppColors.red,
                  width: 10.w,
                  height: 10.w,
                )
              : Icon(Icons.add, color: AppColors.black, size: 18.20.sp),
        ),
      ],
    ),
  );
}
