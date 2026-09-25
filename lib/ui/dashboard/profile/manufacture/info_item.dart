import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: unused_element
class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.5.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFAAAAAA),
            fontFamily: 'DMSans',
          ),
        ),

        SizedBox(height: 3.h),

        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF303030),
            fontFamily: 'DMSans',
          ),
        ),
      ],
    );
  }
}
