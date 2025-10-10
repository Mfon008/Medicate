// ignore_for_file: deprecated_member_use, strict_top_level_inference
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/model/get_reminder_response_model/reminder.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
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
      body: ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.getReminder(
              context,
              status: model.isReminderStatus,
              page: model.page.toString(),
              limit: 10.toString(),
            );
          });
        },
        disposeViewModel: false,
        onDispose: (viewModel) {},
        builder: (_, AuthViewModel model, _) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: model.checkReminderEmpty() ? 20.w : 50.w,
              horizontal: 16.w,
            ),
            child: Column(
              children: [
                model.checkReminderEmpty()
                    ? Container(
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
                                  model.isReminderStatus = 'ongoing';
                                  model.getReminder(
                                    context,
                                    status: model.isReminderStatus,
                                    page: model.page.toString(),
                                    limit: 10.toString(),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  decoration:
                                      model.isReminderStatus == 'ongoing'
                                      ? BoxDecoration(
                                          color: AppColors.primary.withOpacity(
                                            .04,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            22.r,
                                          ),
                                        )
                                      : BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: TextView(
                                    text: 'Ongoing',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: model.isReminderStatus == 'ongoing'
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
                                  model.isReminderStatus = 'completed';
                                  model.getReminder(
                                    context,
                                    status: model.isReminderStatus,
                                    page: model.page.toString(),
                                    limit: 10.toString(),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  decoration:
                                      model.isReminderStatus == 'completed'
                                      ? BoxDecoration(
                                          color: AppColors.primary.withOpacity(
                                            .04,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            22.r,
                                          ),
                                        )
                                      : BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: TextView(
                                    text: 'Completed',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          model.isReminderStatus == 'completed'
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
                                  model.isReminderStatus = 'today';
                                  model.getReminder(
                                    context,
                                    status: model.isReminderStatus,
                                    page: model.page.toString(),
                                    limit: 10.toString(),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  decoration: model.isReminderStatus == 'today'
                                      ? BoxDecoration(
                                          color: AppColors.primary.withOpacity(
                                            .04,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            22.r,
                                          ),
                                        )
                                      : BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: TextView(
                                    text: 'Today’s Med',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: model.isReminderStatus == 'today'
                                          ? AppColors.primary
                                          : AppColors.grey1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),

                Center(
                  child:
                      model.getReminderResponseModel != null &&
                          model
                              .getReminderResponseModel!
                              .data!
                              .reminders!
                              .isNotEmpty
                      ? Column(
                          children: [
                            SizedBox(height: 30.h),
                            if (model.isReminderStatus == 'ongoing')
                              ...model
                                  .getReminderResponseModel!
                                  .data!
                                  .reminders!
                                  .map(
                                    (e) => reminderWidget(
                                      context: context,
                                      isTab: isTablet(context),
                                      reminder: e,
                                      model: model,
                                    ),
                                  ),
                            if (model.isReminderStatus == 'completed')
                              ...model
                                  .getReminderResponseModel!
                                  .data!
                                  .reminders!
                                  .map(
                                    (e) => reminderWidget(
                                      context: context,
                                      isTab: isTablet(context),
                                      reminder: e,
                                      model: model,
                                    ),
                                  ),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(height: 130.h),
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
                                    ? Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                        size: 20.sp,
                                      )
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
                                          onTap: () =>
                                              model.showReminderModal(context),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                AppImage.person_plus,
                                              ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  reminderWidget({
    context,
    isTab,
    Reminder? reminder,
    AuthViewModel? model,
  }) => Container(
    padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 10.w),
    margin: EdgeInsets.only(bottom: 16.w),
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
          child: Image.network(
            reminder?.medication?.medicationImage?.url ?? '',
            height: 76.h,
            width: 76.w,
            errorBuilder: (context, error, stackTrace) => Padding(
              padding: EdgeInsets.all(18.w),
              child: SvgPicture.asset(
                color: AppColors.primary,
                model!.errorRemidnderImage(
                  reminder!.medication!.medicationType,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15.20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: reminder?.medication?.medicationName ?? '',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 16.2.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(height: 4.h),
            TextView(
              text:
                  '${DateFormat('MMM d').format(reminder!.medication!.startDateTime!)} - ${DateFormat('MMM d').format(reminder.medication!.endDateTime!)}',
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
                      value: 0 / 4,
                      color: AppColors.lightBlue, // Progress bar color
                      backgroundColor:
                          Colors.grey[300], // Background track color
                    ),
                  ),
                ),
                SizedBox(width: 7.10.w),
                TextView(
                  text: '0/4',
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
                  text: reminder.medication?.dosage ?? '',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14.2.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.reminder,
                  ),
                ),
                SizedBox(width: 4.6.w),
                TextView(
                  text: 'x${reminder.medication?.timesPerDay} daily',
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
                    color: AppColors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4.6.w),
                TextView(
                  text: 'Pending',
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
