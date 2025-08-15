// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/ui/widget/button.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:medicate_app/ui/widget/text_form_widget.dart';
import '../../core/app_assets/app_validation.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(vertical: 60.w, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalNavigator(),
                SvgPicture.asset(
                  AppImage.applogoSvg,
                  width: 116.w,
                  height: 28.h,
                ),
                SizedBox(height: 30.h, width: 30.w),
              ],
            ),
            SizedBox(height: 26.0.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                TextView(
                  text: 'Phone Number',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),

                Positioned(
                  right: -12.10,
                  child: TextView(
                    text: '*',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldFill,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(0.r),
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(0.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImage.nigeria),
                      SizedBox(width: 4.w),
                      TextView(
                        text: '+234',
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          fontSize: 14.2.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: TextFormWidget(
                    hint: null,
                    borderColor: AppColors.transparent,
                    borderTopLeft: 0,
                    borderTopRight: 10,
                    borderBottomLeft: 0,
                    borderBottomRight: 10,
                    label: 'Best number to reach you?',

                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      color: AppColors.infoGrey,
                    ),
                    fillColor: AppColors.textFieldFill,
                    isFilled: true,
                    controller: nameController,
                    validator: AppValidator.validatePhone(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextFormWidget(
              hint: 'Name',
              borderColor: AppColors.transparent,
              borderTopLeft: 10.r,
              borderTopRight: 10.r,
              borderBottomLeft: 10.r,
              borderBottomRight: 10.r,
              label: 'What should we call you?',

              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                fontSize: 14.2.sp,
                color: AppColors.infoGrey,
              ),
              fillColor: AppColors.textFieldFill,
              isFilled: true,
              controller: phoneController,
              validator: AppValidator.validateString(),
            ),
            SizedBox(height: 16.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 1.1,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    activeColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ), // Matches your screenshot style
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        const TextSpan(text: "I agree to the "),
                        TextSpan(
                          text: "Terms of Use",
                          style: TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Open Terms of Use page
                              print("Terms of Use clicked");
                            },
                        ),
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Open Privacy Policy page
                              print("Privacy Policy clicked");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            ButtonWidget(
              border: 100.r,
              buttonColor: AppColors.buttonGrey1,
              buttonText: 'Sign Up',
              color: AppColors.white,
              buttonBorderColor: AppColors.transparent,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
