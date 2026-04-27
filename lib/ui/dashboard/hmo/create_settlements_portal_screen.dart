// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../main.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class CreateSettlementsPortalScreen extends StatelessWidget {
  const CreateSettlementsPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () => navigate.back(),
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.reminder1),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 12.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
              Center(
                child: TextView(
                  text: 'Create Settlement',
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 18.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.deep,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.infoGrey1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormWidget(
                    hint: 'Hospital',
                    hintSize: 15.6.sp,
                    hintWeight: FontWeight.w400,
                    isFilled: true,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    fillColor: AppColors.grey,

                    onChange: (value) {},
                  ),
                  SizedBox(height: 14.h),
                  TextFormWidget(
                    hint: 'Period Start',
                    hintSize: 15.6.sp,
                    hintWeight: FontWeight.w400,
                    isFilled: true,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    fillColor: AppColors.grey,
                    onChange: (value) {},
                    suffixWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppImage.calendar),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  TextFormWidget(
                    hint: 'Period End',
                    hintSize: 15.6.sp,
                    hintWeight: FontWeight.w400,
                    isFilled: true,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    fillColor: AppColors.grey,
                    onChange: (value) {},
                    suffixWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppImage.calendar),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.w,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Total Claims',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.reminder1,
                              ),
                            ),
                            TextView(
                              text: '0',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.reminder1,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextView(
                              text: 'Total Amount',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.reminder1,
                              ),
                            ),
                            TextView(
                              text: '₦0',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.reminder1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  TextFormWidget(
                    hint: 'Notes',
                    isShowHint: true,
                    hintSize: 15.6.sp,
                    hintWeight: FontWeight.w400,
                    isFilled: true,
                    maxline: 4,
                    borderTopLeft: 10.r,
                    borderTopRight: 10.r,
                    borderBottomLeft: 10.r,
                    borderBottomRight: 10.r,
                    fillColor: AppColors.grey,

                    onChange: (value) {},
                  ),
                  SizedBox(height: 34.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.primary,
                    buttonText: 'Create Settlement',
                    color: AppColors.white,
                    buttonBorderColor: AppColors.primary,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20.60.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
