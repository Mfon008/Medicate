// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/app_validation.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/dashboard/ask_me_screen.dart';
import 'package:medicate_app/ui/dashboard/subscribers/subsribers_screen.dart';
import 'package:medicate_app/ui/widget/ai_text_form_widget.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../core/core_folder/manager/shared_preference.dart';
import '../widget/text.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key, this.isTapHMOPlan,this.isSubStatus,this.mySubPlans});
  String? isSubStatus;
  String? mySubPlans;
   bool? isTapHMOPlan;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTappToChat = false;
  bool isTapHMOPlan = false;
  String chatText = '';
  String isSubStatus = '';
  String mySubPlans = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

    @override
  void initState() {
    isTapHMOPlan = widget.isTapHMOPlan??false;
    isSubStatus = widget.isSubStatus??'Plans';
    mySubPlans = widget.mySubPlans??'';
    super.initState();
  }
  

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
                    Routes.moreScreen,
                  ), // makes ripple effect round
                ),
              ),
              isTapHMOPlan?TextView(
                    text: 'HMO Plans',
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ): GestureDetector(
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
                  onPressed: () =>
                      navigate.navigateTo(Routes.emptyNotification),
                  splashRadius: 28,
                ),
              ),
            ],
          ),
        ),
      ),
      body: isTappToChat
          ? AskMeScreen(inText: chatText, isDashboard: true)
          : isTapHMOPlan
          ? SubsribersScreen(isSubStatus: isSubStatus,mySubPlans: mySubPlans)
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
                                                .usersData['user'] !=
                                            null &&
                                        SharedPreferencesService
                                                .instance
                                                .usersData['user']['profileCompletionPercentage'] ==
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
                                                  .usersData['user'] !=
                                              null &&
                                          SharedPreferencesService
                                                  .instance
                                                  .usersData['user']['profileCompletionPercentage'] ==
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
                                                      .usersData['user'] !=
                                                  null &&
                                              SharedPreferencesService
                                                      .instance
                                                      .usersData['user']['profileCompletionPercentage'] ==
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
                                                      .usersData['user'] !=
                                                  null &&
                                              SharedPreferencesService
                                                      .instance
                                                      .usersData['user']['profileCompletionPercentage'] !=
                                                  null
                                          ? 'Your registration is ${SharedPreferencesService.instance.usersData['user']['profileCompletionPercentage']}% completed'
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
                                  text:
                                      SharedPreferencesService
                                              .instance
                                              .usersData['user'] !=
                                          null
                                      ? 'Good Morning, ${SharedPreferencesService.instance.usersData['user']['fullName'] ?? ''}!'
                                      : 'Good Morning,',
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
                              child: conContainerReminder(
                                icon: AppImage.bell_small,
                                text: 'Create Reminder',
                                ontapAi: () {
                                  isTappToChat = !isTappToChat;
                                  chatText = 'Create Reminder';
                                  isTapHMOPlan = false;
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(width: 12.w),

                            Expanded(
                              child: conContainer(
                                icon: AppImage.today_pills,
                                text: 'Today’s Med',
                                ontap: () {
                                  isTappToChat = !isTappToChat;
                                  chatText = 'Today’s Med';
                                  isTapHMOPlan = false;
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 22.10.h),
                        Row(
                          children: [
                            Expanded(
                              child: conContainer(
                                icon: AppImage.today_pills,
                                text: 'Tomorrow’s Med',
                                ontap: () {
                                  isTappToChat = !isTappToChat;
                                  chatText = 'Tomorrow’s Med';
                                  isTapHMOPlan = false;
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: conContainer(
                                icon: AppImage.hmo_plan,
                                text: 'HMO Plans',
                                ontap: () {
                                  isTapHMOPlan = true;
                                  chatText = 'hmo_plans';
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Health Tips',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                            TextView(
                              text: 'View more',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.10.h),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...[1, 2, 3].map(
                                (o) => Container(
                                  width: 298.w,
                                  margin: EdgeInsets.only(right: 20.w),
                                  padding: EdgeInsets.all(24.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.r),
                                    color: AppColors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppImage.tips,
                                            color: AppColors.fineGrey,
                                            height: 25.30.h,
                                            width: 25.30.w,
                                          ),
                                          SizedBox(width: 12.2.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: o == 1
                                                    ? 'Today’s Health Tip'
                                                    : o == 2
                                                    ? 'Tomorrow’s Health Tip'
                                                    : 'Next Tomorrow’s Health Tip',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.infoGrey,
                                                ),
                                              ),
                                              SizedBox(height: 8.10.h),
                                              TextView(
                                                text: 'Don’t Skip Breakfast',
                                                textStyle: TextStyle(
                                                  fontSize: 17.2.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 100.h),
                                      Row(
                                        children: [
                                          TextView(
                                            text: 'Read more',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.lightBlue,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          SvgPicture.asset(
                                            AppImage.arrow_forward,
                                            color: AppColors.lightBlue,
                                            height: 16.20.h,
                                            width: 15.20.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Container(
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
                                        if (formKey.currentState!.validate()) {
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
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget conContainer({
    required String icon,
    required String text,
    required Function()? ontap,
  }) => GestureDetector(
    onTap: ontap,
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
          SvgPicture.asset(icon, width: 16.20.w, height: 16.20.h),
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

  Widget conContainerReminder({
    required String icon,
    required String text,
    required Function()? ontapAi,
  }) => ViewModelBuilder<AuthViewModel>.reactive(
    viewModelBuilder: () => AuthViewModel(),
    onViewModelReady: (model) {},
    disposeViewModel: false,
    onDispose: (viewModel) {},
    builder: (_, AuthViewModel model, _) {
      return PopupMenuButton(
        color: AppColors.white,
        offset: const Offset(0, 50),
        padding: EdgeInsets.symmetric(horizontal: 18.22.w, vertical: 18.20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.w),
        ),
        onSelected: (String value) {},
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              value: 'setup yourself',
              padding: EdgeInsets.symmetric(
                horizontal: 18.22.w,
                vertical: 12.w,
              ),
              onTap: () => model.showReminderModal(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppImage.person_plus),
                  SizedBox(width: 6.10.w),
                  TextView(
                    text: 'Set up Yourself',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'ai setup',
              padding: EdgeInsets.symmetric(
                horizontal: 18.22.w,
                vertical: 12.w,
              ),
              onTap: ontapAi,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppImage.ai_star),
                  SizedBox(width: 6.10.w),
                  TextView(
                    text: 'AI Setup',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                ],
              ),
            ),
          ];
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
    },
  );
}
