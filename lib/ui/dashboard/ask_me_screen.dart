// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/core_folder/brief.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../widget/ai_text_form_widget.dart';
import '../widget/text.dart';

// ignore: must_be_immutable
class AskMeScreen extends StatelessWidget {
  AskMeScreen({super.key, this.inText});
  String? inText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
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
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                          bottomLeft: Radius.circular(24.r),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
          Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                width: 130.w,
                padding: EdgeInsets.symmetric(vertical: 4.10.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: AppColors.primary, size: 26.sp),
                    SizedBox(width: 6.10.w),
                    TextView(
                      text: 'New Chat',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14.2.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 2.4.w,
                  bottom: 8.w,
                  left: 10.w,
                  right: 10.w,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.22.r),
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
            ],
          ),
          SizedBox(height: 25.20.h),
        ],
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
    if (text == 'Create Reminder') {
      return 'Hey medicate, create a medication reminder for me.';
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
