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
class AskMeScreen extends StatefulWidget {
  AskMeScreen({super.key, this.inText, this.isDashboard = false});
  String? inText;
  bool? isDashboard;

  @override
  State<AskMeScreen> createState() => _AskMeScreenState();
}

class _AskMeScreenState extends State<AskMeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;

    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: !widget.isDashboard!
          ? AppBar(
              backgroundColor: AppColors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: 80.0,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.inactive.withOpacity(.1),
                        border: Border.all(
                          color: AppColors.inactive.withOpacity(.4),
                        ),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          AppImage.burger,
                          color: AppColors.primary,
                          height: isTablet(context) ? 32.h : 12.h,
                          width: isTablet(context) ? 32.w : 12.w,
                        ),
                        onPressed: () => navigate.navigateTo(
                          Routes.moreScreen,
                        ), // makes ripple effect round
                      ),
                    ),
                    SvgPicture.asset(
                      AppImage.applogoSvg,
                      height: 28.h,
                      width: 28.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 2.4.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.inactive.withOpacity(.1),
                        border: Border.all(
                          color: AppColors.inactive.withOpacity(.4),
                        ),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          AppImage.bell,
                          height: isTablet(context) ? 40.h : 20.h,
                          width: isTablet(context) ? 40.w : 20.w,
                          color: AppColors.primary,
                        ),
                        onPressed: () =>
                            navigate.navigateTo(Routes.emptyNotification),
                        splashRadius: 28,
                      ),
                    ),
                  ],
                ),
              ),
              // centerTitle: true,
              // actions: [
              //   // Padding(
              //   //   padding: EdgeInsets.all(isTablet(context) ? 2.0.w : 6.8.w),
              //   //   child: ),
              // ],
            )
          : null,

      body: SafeArea(
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
                          text: returnTextBot(widget.inText),
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
                              text: returnTextAiBot(widget.inText),
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
      ),
    );
  }

  String returnTextBot(String? text) {
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
    if (text != null || text != '' || text!.isNotEmpty) {
      return text ?? 'Hey medicate, create a medication reminder for me.';
    }

    return 'Hey medicate, create a medication reminder for me.';
  }

  String returnTextAiBot(String? text) {
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
