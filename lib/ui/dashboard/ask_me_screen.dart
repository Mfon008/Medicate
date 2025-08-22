// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/core_folder/brief.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../../core/core_folder/app/app.router.dart';
import '../../main.dart';
import '../widget/ai_text_form_widget.dart';
import '../widget/text.dart';

// ignore: must_be_immutable
class AskMeScreen extends StatelessWidget {
  AskMeScreen({super.key, this.inText});
  String? inText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      resizeToAvoidBottomInset: true, // 👈 ensures keyboard pushes content
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 7.8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.inactive.withOpacity(.1),
            border: Border.all(color: AppColors.inactive),
          ),
          child: IconButton(
            icon: SvgPicture.asset(AppImage.burger, color: AppColors.primary),
            onPressed: () => navigate.navigateTo(Routes.moreScreen),
          ),
        ),
        title: SvgPicture.asset(AppImage.applogoSvg, height: 28.h, width: 28.w),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(4.4.w),
            child: Container(
              margin: EdgeInsets.only(right: 4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.inactive.withOpacity(.1),
                border: Border.all(color: AppColors.inactive),
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  AppImage.bell,
                  width: 26,
                  height: 26,
                  color: AppColors.primary,
                ),
                onPressed: () {},
                splashRadius: 28,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 👇 scrollable messages
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.22.w,
                  vertical: 22.w,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 220.w,
                        margin: EdgeInsets.only(top: 6.10.w),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.w,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                            bottomLeft: Radius.circular(12.r),
                          ),
                          color: AppColors.skyBlue,
                          border: Border.all(
                            color: AppColors.primaryLight.withOpacity(.4),
                          ),
                        ),
                        child: TextView(
                          text: returnTextBot(inText),
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.20.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(14.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              border: Border.all(color: AppColors.primary),
                            ),
                            child: SvgPicture.asset(
                              AppImage.big_logo,
                              height: 24.0.h,
                              width: 16.20.w,
                            ),
                          ),
                          SizedBox(width: 12.20.w),
                          SizedBox(
                            width: 220.w,
                            child: TextView(
                              text: returnTextAiBot(inText),
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 👇 fixed input at bottom
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.r),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AiTextFormWidget(
                    label: 'Chat with Medicate AI....',
                    labelStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 18.20.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImage.audio,
                        width: 22.w,
                        height: 22.h,
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        AppImage.clipper,
                        color: AppColors.black,
                        width: 22.w,
                        height: 22.h,
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: SvgPicture.asset(
                          AppImage.arrow_up,
                          width: 20.w,
                          height: 17.20.h,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.20.h),
          ],
        ),
      ),
    );
  }

  String returnTextBot(text) {
    if (text == 'Today’s Med') {
      return 'What medication do I need to take today?';
    }
    if (text == 'Tomorrow’s Med') {
      return 'What medication do I need to take tomorrow?';
    }
    if (text == 'Appointment') {
      return 'Do I have any appointments today?';
    }
    if (text != null || text != '' || text.isNotEmpty) {
      return text ?? 'Hey medicate, create a medication reminder for me.';
    }

    return 'Hey medicate, create a medication reminder for me.';
  }

  String returnTextAiBot(text) {
    if (text == 'Today’s Med') {
      return BriefText().chatAiTodayText;
    }
    if (text == 'Tomorrow’s Med') {
      return BriefText().chatAiTodayText;
    }
    if (text == 'Appointment') {
      return BriefText().chatAiAppText;
    }

    return 'I can help with that! Let’s go step by step. What’s the name of the medication?';
  }
}
