// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';

import '../widget/text.dart';

class MoreScreen extends StatefulWidget {
  MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  List<String> textHistoryList = [
    'Today’s Medication',
    'Good Morning! To keep you on track, here’s your morning medication schedule:',
  ];

  String selectHistory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 16.20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'More',
                  textStyle: TextStyle(
                    fontSize: 16.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => navigate.back(),
                  icon: SvgPicture.asset(AppImage.cancel),
                ),
              ],
            ),
            Divider(color: AppColors.f1),
            SizedBox(height: 10.h),
            Row(
              children: [
                moreContainer(
                  context,
                  icon: AppImage.appointment,
                  text: 'Appointment',
                ),
                SizedBox(width: 14.w),
                moreContainer(
                  context,
                  icon: AppImage.profile,
                  text: 'Profile',
                  onTap: () => navigate.navigateTo(Routes.profileScreen),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                moreContainer(
                  context,
                  icon: AppImage.timer,
                  text: 'Track Reminder',
                ),
                SizedBox(width: 14.w),
                moreContainer(
                  context,
                  icon: AppImage.timer,
                  text: 'Reminder History',
                ),
              ],
            ),
            SizedBox(height: 200.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'History',
                  textStyle: TextStyle(
                    fontSize: 16.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                SvgPicture.asset(
                  AppImage.filter,
                  height: 16.20.h,
                  width: 12.22.w,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Today',
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14.2.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.infoGrey,
              ),
            ),
            SizedBox(height: 2.20.h),
            ...textHistoryList.map(
              (e) => GestureDetector(
                onTap: () {
                  selectHistory = e;
                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 6.10.w),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.w,
                    horizontal: 12.w,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: selectHistory == e
                        ? AppColors.inactive.withOpacity(.3)
                        : AppColors.transparent,
                  ),
                  child: TextView(
                    text: e,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: TextView(
                text: 'Show all',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  moreContainer(context, {String? icon, String? text, Function()? onTap}) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 34.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.dashboard,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  icon!,
                  color: AppColors.primary,
                  height: 26.h,
                  width: 26.w,
                ),
                SizedBox(height: 12.h),
                TextView(
                  text: text ?? '',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 13.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
