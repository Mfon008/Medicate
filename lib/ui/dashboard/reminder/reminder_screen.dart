// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 10.4.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.inactive.withOpacity(.1),
            border: Border.all(color: AppColors.inactive),
          ),
          child: IconButton(
            icon: SvgPicture.asset(AppImage.burger, color: AppColors.primary,
                    height: 12.h,
                    width: 12.w,),
            onPressed: () => navigate.navigateTo(Routes.moreScreen),
          ),
        ),
        title: TextView(
          text: 'Reminder',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(4.8.w),
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
                  width: 22.h,
                  height: 22.h,
                  color: AppColors.primary,
                ),
                onPressed: () {},
                splashRadius: 28,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
        child: Center(
          child: Column(
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
                  isTapped = !isTapped;
                }),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: !isTapped
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
              !isTapped
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
                            onTap: () => showReminderModal(context),
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
        ),
      ),
    );
  }

  showReminderModal(context) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(maxWidth: double.infinity),
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.75, // Initial height as percentage of screen
        minChildSize: 0.5, // Minimum height
        maxChildSize: 0.94, // Maximum height
        expand: false, // Set to true for full height initially
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: AppColors.white,
            ),
            child: ListView.builder(
              controller: scrollController,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          );
        },
      );
    },
  );
}
