// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/colors.dart';
import '../../../main.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class HmoAddHospitalNetworkPortalScreen extends StatelessWidget {
  HmoAddHospitalNetworkPortalScreen({super.key, required this.isEditing});
  bool? isEditing;

  @override
  Widget build(BuildContext context) {
    // bool isTablet(BuildContext context) =>
    //     MediaQuery.of(context).size.shortestSide >= 600;
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
                  text: isEditing! ? 'Edit Hospital' : 'Add New Hospital',
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
                    hint: 'Hospital Name',
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
                    hint: 'Hospital Type',
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
                    hint: 'State',
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
                    hint: 'Address',
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
                    hint: 'Phone',
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
                    hint: 'Email',
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
                  SizedBox(height: 24.h),
                  ButtonWidget(
                    border: 100.r,
                    buttonColor: AppColors.primary,
                    buttonText: isEditing! ? 'Save Changes' : 'Add',
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
  }}
