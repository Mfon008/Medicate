import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/ui/widget/text.dart';

import '../../core/config/colors.dart';

class BulletText extends StatelessWidget {
  final String text;

  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•', style: TextStyle(fontSize: 18, height: 1.4)),
          const SizedBox(width: 8),
          Expanded(
            child: TextView(
              text: text,
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14.sp,
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

class NumberBulletText extends StatelessWidget {
  final String text;
  final String noText;

  const NumberBulletText(this.text, this.noText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: '$noText. ',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextView(
              text: text,
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14.sp,
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
