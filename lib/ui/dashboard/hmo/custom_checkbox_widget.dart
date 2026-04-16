import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCheckbox({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: isSelected
            ? EdgeInsets.all(4.0.w)
            : EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: isSelected
              ? AppColors.primary
              : AppColors.transparent,
          border: Border.all(
            color: isSelected
                ? AppColors.transparent
                : AppColors.infoGrey,
            width: .78,
          ),
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                size: 12.sp,
                color: AppColors.white,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}