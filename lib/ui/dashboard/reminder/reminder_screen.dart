// ignore_for_file: deprecated_member_use, strict_top_level_inference
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  String isReminderStatus = 'ongoing';
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        toolbarHeight: 80.0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                    height: isTablet(context) ? 34.h : 14.h,
                    width: isTablet(context) ? 34.w : 14.w,
                  ),
                  onPressed: () => navigate.navigateTo(Routes.moreScreen),
                ),
              ),
              TextView(
                text: 'Reminder',
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(
                    color: AppColors.inactive..withOpacity(.4),
                  ),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.bell,
                    height: isTablet(context) ? 40.h : 20.h,
                    width: isTablet(context) ? 40.w : 20.w,
                    color: AppColors.primary,
                  ),
                  onPressed: () {},
                  splashRadius: 28,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 16.w),
        child: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => locator<AuthViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          onDispose: (viewModel) {},
          builder: (_, AuthViewModel model, _) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 130.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              isReminderStatus = 'ongoing';
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.w),
                              decoration: isReminderStatus == 'ongoing'
                                  ? BoxDecoration(
                                      color: AppColors.primary.withOpacity(.04),
                                      borderRadius: BorderRadius.circular(22.r),
                                    )
                                  : BoxDecoration(),
                              alignment: Alignment.center,
                              child: TextView(
                                text: 'Ongoing',
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: isReminderStatus == 'ongoing'
                                      ? AppColors.primary
                                      : AppColors.grey1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              isReminderStatus = 'completed';
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.w),
                              decoration: isReminderStatus == 'completed'
                                  ? BoxDecoration(
                                      color: AppColors.primary.withOpacity(.04),
                                      borderRadius: BorderRadius.circular(22.r),
                                    )
                                  : BoxDecoration(),
                              alignment: Alignment.center,
                              child: TextView(
                                text: 'Completed',
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: isReminderStatus == 'completed'
                                      ? AppColors.primary
                                      : AppColors.grey1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              isReminderStatus = 'today';
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10.w),
                              decoration: isReminderStatus == 'today'
                                  ? BoxDecoration(
                                      color: AppColors.primary.withOpacity(.04),
                                      borderRadius: BorderRadius.circular(22.r),
                                    )
                                  : BoxDecoration(),
                              alignment: Alignment.center,
                              child: TextView(
                                text: 'Today’s Med',
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: isReminderStatus == 'today'
                                      ? AppColors.primary
                                      : AppColors.grey1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),

                  reminderWidget(context: context, isTab: isTablet(context)),
                  SvgPicture.asset(AppImage.reminder),
                  SizedBox(height: 20.h),
                  TextView(
                    text: 'Here you’ll see your schedule for the day',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 2.10.h),
                  TextView(
                    text: 'Tap on the plus button to add one',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.infoGrey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () => setState(() {
                      model.isTapped = !model.isTapped;
                    }),
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: !model.isTapped
                          ? Icon(Icons.add, color: AppColors.white, size: 20.sp)
                          : SvgPicture.asset(
                              AppImage.x,
                              color: AppColors.white,
                              height: 20.h,
                              width: 20.w,
                            ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  !model.isTapped
                      ? SizedBox.shrink()
                      : Container(
                          width: 156.0.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.22.w,
                            vertical: 18.20.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20.w),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
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
                              SizedBox(height: 10.h),
                              Row(
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
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  reminderWidget({context, isTab}) => Container(
    padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 10.w),
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 40.w),
          width: MediaQuery.of(context).size.width / 2.5,
          height: 150.h,
          decoration: BoxDecoration(
            color: AppColors.dashboard,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Image.asset(AppImage.panadol, height: 76.h, width: 76.w),
        ),
        SizedBox(width: 15.20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Panadol',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 16.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(height: 4.h),
            TextView(
              text: 'Feb 13 - Feb 18',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 13.2.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey1,
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: isTab ? 230.w : 130.w,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ), // Adjust radius as needed
                    child: LinearProgressIndicator(
                      minHeight: 4.0, // Adjust height as needed
                      value: 3 / 5,
                      color: AppColors.lightBlue, // Progress bar color
                      backgroundColor:
                          Colors.grey[300], // Background track color
                    ),
                  ),
                ),
                SizedBox(width: 7.10.w),
                TextView(
                  text: '3/5',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            TextView(
              text: 'Dosage',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 13.2.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.infoGrey,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                TextView(
                  text: '2 Tablets',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14.2.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.reminder,
                  ),
                ),
                SizedBox(width: 4.6.w),
                TextView(
                  text: 'x3 daily',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.2.w),
                  decoration: BoxDecoration(
                    color: AppColors.app_green,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4.6.w),
                TextView(
                  text: 'Successful',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.reminder,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
