// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({super.key});

  List transLength = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        surfaceTintColor: Colors.transparent, // removes Material3 tint
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(14.w),
          child: GlobalNavigator(),
        ),
        title: TextView(
          text: 'Transaction History',
          textStyle: TextStyle(
            fontFamily: 'GoogleSans',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: '4 Mar, 2025',
              textStyle: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.infoGrey,
              ),
            ),
            SizedBox(height: 13.20.h),
            ...transLength.asMap().entries.map((entry) {
              final index = entry.key;
              // final e = entry.value;

              final isFirst = index == 0;
              final isLast = index == transLength.length - 1;

              return profileContainer(
                topLeft: isFirst ? 12 : 0,
                topRight: isFirst ? 12 : 0,
                bottomLeft: isLast ? 12 : 0,
                bottomRight: isLast ? 12 : 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0.w),
                          decoration: BoxDecoration(
                            color: AppColors.green.withOpacity(.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SvgPicture.asset(
                            AppImage.down_stroke,
                            height: 13.90.h,
                            width: 13.90.w,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextView(
                              text: 'Wallet Funded',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.9.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                            TextView(
                              text: 'Bank Transfer • 04 Jan 2025',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.infoGrey,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        TextView(
                          text: '₦5,000',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  profileContainer({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    Widget? child,
    Function()? onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(15.8.w),
      margin: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft.r),
          topRight: Radius.circular(topRight.r),
          bottomLeft: Radius.circular(bottomLeft.r),
          bottomRight: Radius.circular(bottomRight.r),
        ),
      ),
      child: child,
    ),
  );
}
