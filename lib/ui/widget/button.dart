import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medicate_app/ui/widget/text.dart';
import '../../core/config/colors.dart';
import '../../main.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.buttonText,
    this.color,
    this.buttonColor,
    this.buttonHeight = 52.60,
    this.buttonWidth = double.infinity,
    this.isLight = true,
    this.buttonBorderColor,
    this.border = 10.0,
    this.onPressed,
    this.textStyle,
    this.isLoading = false,
    this.fontSize = 18.0,
  });
  final String? buttonText;
  final double? border;
  final double? fontSize;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? color;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final bool? isLight;
  final bool? isLoading;
  final Function()? onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: buttonWidth!.w,
        height: buttonHeight!.h,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(buttonColor!),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border!),
              side: BorderSide(color: buttonBorderColor!, width: 1.w),
            ),
          ),
        ),
        child: isLoading == false || isLoading == null
            ? TextView(
                text: buttonText!,
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize!.sp,
                  color: color,
                ),
              )
            : SpinKitThreeBounce(color: color, size: 24),
      ),
    );
  }
}

class GlobalNavigator extends StatelessWidget {
  const GlobalNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigate.back(),
      child: Container(
        padding: Platform.isAndroid
            ? EdgeInsets.all(5.10.w)
            : EdgeInsets.only(
                right: 8.w,
                left: 2.w,
                top: 3.0.w,
                bottom: 2.40.w,
              ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.10.r),
          border: Border.all(color: AppColors.black),
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 14.sp,
          color: AppColors.black,
        ),
      ),
    );
  }
}
