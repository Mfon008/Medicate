// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import '../../../core/app_assets/app_validation.dart';
import '../../../core/config/colors.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        surfaceTintColor: Colors.transparent, // removes Material3 tint
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(14.w),
          child: GlobalNavigator(),
        ),
        title: TextView(
          text: 'Support',
          textStyle: TextStyle(
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 22.w,
                horizontal: 12.20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  conContainer(
                    icon: AppImage.phone,
                    text1: 'Call Extension',
                    text2: '+234 9058 590309',
                  ),
                  conContainer(
                    icon: AppImage.whatsapp,
                    text1: 'Join Chat',
                    text2:
                        'Click the link “Join Chat” above to join the Whatsapp group for more Information.',
                  ),
                  conContainer(
                    icon: AppImage.phone,
                    text1: 'Product@medicate.com',
                    text2:
                        'Email us directly if you need any help. Our Agents will help you.',
                  ),
                  SizedBox(height: 30.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Subject Type',
                          textStyle: TextStyle(
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextFormWidget(
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          label: 'Enter subject type',

                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          // controller: nameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 20.h),
                        TextView(
                          text: 'Description',
                          textStyle: TextStyle(
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextFormWidget(
                          borderColor: AppColors.transparent,
                          borderTopLeft: 10.r,
                          borderTopRight: 10.r,
                          borderBottomLeft: 10.r,
                          borderBottomRight: 10.r,
                          alignLabelWithHint: true,
                          maxline: 7,
                          label: 'Write your message',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                            fontSize: 14.2.sp,
                            color: AppColors.infoGrey,
                          ),
                          fillColor: AppColors.grey,
                          isFilled: true,
                          // controller: nameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(height: 40.h),
                        Center(
                          child: ButtonWidget(
                            border: 100.r,
                            buttonWidth: 200.w,
                            buttonColor: AppColors.primary,
                            buttonText: 'Submit',
                            color: AppColors.white,
                            buttonBorderColor: AppColors.transparent,
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              //   // _modalBottomSheetMenu(phoneNo: phoneController.text);
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  conContainer({String? icon, String? text1, String? text2}) => Container(
    margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.w),
    decoration: BoxDecoration(
      color: AppColors.primary.withOpacity(.03),
      border: Border.all(color: AppColors.primary.withOpacity(.07)),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.w),
          child: SvgPicture.asset(icon!),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: text1 ?? '',
              textStyle: TextStyle(
                fontSize: 15.2.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 5.10.h),
            SizedBox(
              width: 200.w,
              child: TextView(
                text: text2 ?? '',
                textStyle: TextStyle(
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
