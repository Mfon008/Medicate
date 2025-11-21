// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/ui/dashboard/ask_me_screen.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../core/core_folder/manager/shared_preference.dart';
import '../../../main.dart';
import '../../widget/ai_text_form_widget.dart';
import '../../widget/text.dart';

class PharmacyHomeScreen extends StatefulWidget {
  const PharmacyHomeScreen({super.key});

  @override
  State<PharmacyHomeScreen> createState() => _PharmacyHomeScreenState();
}

class _PharmacyHomeScreenState extends State<PharmacyHomeScreen> {
  bool isTappToChat = false;
  bool isTapOnScreenOrChatButt = false;
  String chatText = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
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
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.burger,
                    color: AppColors.primary,
                    height: isTablet(context) ? 32.h : 12.h,
                    width: isTablet(context) ? 32.w : 12.w,
                  ),
                  onPressed: () => navigate.navigateTo(
                    Routes.pharmMoreScreen,
                  ), // makes ripple effect round
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => isTappToChat = false),
                child: SvgPicture.asset(
                  AppImage.applogoSvg,
                  height: 28.h,
                  width: 28.w,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 2.4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.bell,
                    height: isTablet(context) ? 40.h : 20.h,
                    width: isTablet(context) ? 40.w : 20.w,
                    color: AppColors.primary,
                  ),
                  onPressed: () {},
                  // navigate.navigateTo(Routes.emptyNotification),
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
      ),
      body: isTappToChat
          ? AskMeScreen(inText: chatText, isDashboard: true)
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.8.w,
                      vertical: 22.w,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              navigate.navigateTo(Routes.profileScreen),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                            padding: EdgeInsets.symmetric(
                              vertical: 12.w,
                              horizontal: 11.4.w,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color:
                                    SharedPreferencesService
                                                .instance
                                                .usersData['memberships'] !=
                                            null &&
                                        SharedPreferencesService
                                                .instance
                                                .usersData['memberships'][0]['profileCompletionPercentage'] ==
                                            100
                                    ? AppColors.app_green
                                    : AppColors.yellow,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color:
                                      SharedPreferencesService
                                                  .instance
                                                  .usersData['memberships'] !=
                                              null &&
                                          SharedPreferencesService
                                                  .instance
                                                  .usersData['memberships'][0]['profileCompletionPercentage'] ==
                                              100
                                      ? AppColors.app_green
                                      : AppColors.yellow,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 10.12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text:
                                          SharedPreferencesService
                                                      .instance
                                                      .usersData['memberships'] !=
                                                  null &&
                                              SharedPreferencesService
                                                      .instance
                                                      .usersData['memberships'][0] ==
                                                  100
                                          ? 'Completed'
                                          : 'Complete Registration',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 15.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    TextView(
                                      text:
                                          SharedPreferencesService
                                                      .instance
                                                      .usersData['memberships'] !=
                                                  null &&
                                              SharedPreferencesService
                                                      .instance
                                                      .usersData['memberships'][0]['profileCompletionPercentage'] !=
                                                  null
                                          ? 'Your registration is ${SharedPreferencesService.instance.usersData['memberships'][0]['profileCompletionPercentage']}% completed'
                                          : 'Please enter your new PIN.',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 13.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  AppImage.arrow_forward,
                                  width: 14.20.w,
                                  height: 14.20.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 4.0.w),
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: SvgPicture.asset(
                                AppImage.big_logo,
                                width: 20.w,
                                height: 20.w,
                              ),
                            ),
                            SizedBox(width: 22.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Good Morning, Ben!',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 15.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoGrey,
                                  ),
                                ),
                                TextView(
                                  text: 'How can i help you?',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 18.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 5.10.h),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 36.10.h),
                        Row(
                          children: [
                            Expanded(
                              child: conContainer(
                                icon: AppImage.purchase,
                                text: 'Purchase Meds',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: conContainer(
                                icon: AppImage.bell_small,
                                text: 'Create Reminder',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 22.10.h),
                        Row(
                          children: [
                            Expanded(
                              child: conContainer(
                                icon: AppImage.level,
                                text: 'Stock Levels',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: conContainer(
                                icon: AppImage.cart,
                                text: 'Orders',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 22.10.h),
                        Row(
                          children: [
                            Expanded(
                              child: conContainer(
                                icon: AppImage.track_reminder,
                                text: 'Track Reminders',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: conContainer(
                                icon: AppImage.appointment,
                                text: 'Appointment',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60.10.h),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity.w,
                            padding: EdgeInsets.only(
                              top: 2.4.w,
                              bottom: 8.w,
                              left: 10.w,
                              right: 10.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.22.r),
                              color: AppColors.white,
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AiTextFormWidget(
                                    label: 'Chat with Medicate AI....',
                                    validator: AppValidator.validateString(),
                                    onChange: (p0) {
                                      setState(() {
                                        chatText = p0;
                                      });
                                    },
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
                                      GestureDetector(
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            isTappToChat = !isTappToChat;
                                            chatText = chatText;
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 20.h),
              ],
            ),
    );
  }

  Widget conContainer({required String icon, required String text}) =>
      GestureDetector(
        onTap: () {
          isTappToChat = !isTappToChat;
          chatText = text;
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 14.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.inactive),
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppImage.curved_arrow,
                width: 10.20.w,
                height: 10.20.h,
              ),
              SizedBox(width: 6.10.w),
              SvgPicture.asset(
                icon,
                width: 16.20.w,
                height: 16.20.h,
                color: AppColors.lightBlue,
              ),
              SizedBox(width: 6.10.w),
              Flexible(
                child: TextView(
                  text: text,
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14.2.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
}
