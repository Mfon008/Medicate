// ignore_for_file: deprecated_member_use
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  TextEditingController medNameController = TextEditingController();
  TextEditingController drugNameController = TextEditingController();
  TextEditingController medTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;

    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Container(
          margin: EdgeInsets.only(left: isTablet(context) ? 5.2.w : 12.4.w),
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
            padding: EdgeInsets.all(isTablet(context) ? 2.0.w : 6.8.w),
            child: Container(
              margin: EdgeInsets.only(right: 4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.inactive.withOpacity(.1),
                border: Border.all(color: AppColors.inactive..withOpacity(.4)),
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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 20, width: 20),
                      TextView(
                        text: 'Add Medication',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.deep,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 4.w),
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            AppImage.cancel,
                            height: 14.20,
                            width: 14.20,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13.60.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 300.w,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ), // Adjust radius as needed
                          child: LinearProgressIndicator(
                            minHeight: 4.0, // Adjust height as needed
                            value: 0.59,
                            color: AppColors.primary, // Progress bar color
                            backgroundColor:
                                Colors.grey[300], // Background track color
                          ),
                        ),
                      ),
                      SizedBox(width: 8.2.h),
                      TextView(
                        text: '1/4',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Medication Name',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '',
                    hintSize: 16.60.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    controller: medNameController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),
                  TextFormWidget(
                    hint: 'Drug Name',
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '',
                    hintSize: 16.60.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    suffixWidget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.greyee,
                      ),
                    ),
                    controller: drugNameController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),
                  TextView(
                    text: 'Medication Type',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16.60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 12.h),
                  TextFormWidget(
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '',
                    hintSize: 16.60.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,
                    suffixWidget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.greyee,
                      ),
                    ),
                    controller: medTypeController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),
                  TextView(
                    text: 'Description',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16.60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormWidget(
                    borderColor: AppColors.transparent,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    label: '',
                    hintSize: 16.60.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.grey,
                    isFilled: true,

                    controller: descriptionController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 16.h),
                  TextView(
                    text: 'Medication picture upload',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16.60.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  SizedBox(
                    width: double.infinity,
                    child: DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        dashPattern: [3, 3],
                        strokeWidth: .94,
                        radius: Radius.circular(10),
                        color: AppColors.infoGrey1,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 16.20.w,
                          horizontal: 16.0.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 140.w,
                              height: 84.h,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SvgPicture.asset(AppImage.image_icon),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 36.w,
                                vertical: 13.80.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: AppColors.grey,
                              ),
                              child: TextView(
                                text: 'Upload',
                                textStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 15.60.sp,
                                  color: AppColors.deep,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
