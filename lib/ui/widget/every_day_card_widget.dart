import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/ui/widget/medicate_enum.dart';
import 'package:medicate_app/ui/widget/text.dart';

// ignore: must_be_immutable
class EverydayUserCard extends StatelessWidget {
  EverydayUserCard({
    super.key,
    required this.imge,
    required this.text,
    required this.text2,
    required this.userType,
    required this.selectedUserType,
    required this.onTap,
  });
  String? imge;
  String? text;
  String? text2;
  final UserType userType;
  final UserType? selectedUserType;
  final ValueChanged<UserType> onTap;

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedUserType == userType;
    return GestureDetector(
      onTap: () => onTap(userType),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left image
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
                child: Image.asset(
                  imge ?? "", // Replace with your image path
                  height: 140.h,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),

            // Right text
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12.20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 20.h),
                    TextView(
                      text: text ?? '',
                      letterSpacing: 0,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                        fontFamily: 'GoogleSans',
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 4),
                    TextView(
                      text: text2 ?? '',
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        fontSize: 12.82.sp,
                      ),
                    ),
                    // SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
