import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        text: message ?? '',
        textStyle: GoogleFonts.lato(
          fontSize: 14.70.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 3),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: error ? AppColors.red : AppColors.green,
      margin: EdgeInsets.all(8.w),
      mainButton: error
          ? Padding(
              padding: EdgeInsets.only(right: 6.w),
              child: Icon(
                Icons.cancel_outlined,
                color: AppColors.white,
                size: 22.0.sp,
              ),
            )
          : Padding(
              padding: EdgeInsets.only(right: 6.w),
              child: Icon(
                Icons.access_alarm,
                color: AppColors.white,
                size: 22.0.sp,
              ),
            ),
      borderRadius: BorderRadius.circular(8.r),
    ).show(context!);
  }
}
