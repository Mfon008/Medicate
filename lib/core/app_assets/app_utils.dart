import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicate_app/core/app_assets/constant.dart';

import '../../ui/widget/text.dart';
import '../config/colors.dart';

class AppUtils {
  static Future<void> snackbar(
    BuildContext? context, {
    required String? message,
    bool error = false,
  }) {
    return Flushbar(
      messageText: TextView(
        text: message?.capitalize() ?? '',
        textStyle: GoogleFonts.lato(
          fontSize: 14.70.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 3),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: AppColors.white,
      margin: EdgeInsets.all(16.w),
      icon: error
          ? Padding(
              padding: EdgeInsets.only(left: 10.6.w),
              child: Icon(Icons.cancel, color: AppColors.red, size: 22.0.sp),
            )
          : Padding(
              padding: EdgeInsets.only(left: 10.6.w),
              child: Icon(
                Icons.check_circle,
                color: AppColors.green,
                size: 22.0.sp,
              ),
            ),
      borderRadius: BorderRadius.circular(8.r),
    ).show(context!);
  }
  
  static Future<void> snackbarNoCap(
    BuildContext? context, {
    required String? message,
    bool error = false,
  }) {
    return Flushbar(
      messageText: TextView(
        text: message ?? '',
        textStyle: GoogleFonts.lato(
          fontSize: 14.70.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 3),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: AppColors.white,
      // margin: EdgeInsets.all(16.w),
      icon: error
          ? Padding(
              padding: EdgeInsets.only(left: 10.6.w),
              child: Icon(Icons.cancel, color: AppColors.red, size: 22.0.sp),
            )
          : Padding(
              padding: EdgeInsets.only(left: 10.6.w),
              child: Icon(
                Icons.check_circle,
                color: AppColors.green,
                size: 22.0.sp,
              ),
            ),
      borderRadius: BorderRadius.circular(8.r),
    ).show(context!);
  }
}
