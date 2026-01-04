// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/ui/widget/text.dart';
import '../../core/config/colors.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const InfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: title,
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 12.6.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.infoGrey,
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: 240.w,
            child: TextView(
              text: value,
              maxLines: 4,
              textOverflow: TextOverflow.ellipsis,
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14.6.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.reminder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
