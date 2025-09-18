// ignore_for_file: must_be_immutable, deprecated_member_use
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import '../../../../core/config/colors.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import 'wallet_card_widget.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  List transLength = [1, 2, 3, 4, 5, 5, 5, 5, 5];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        surfaceTintColor: Colors.transparent, // removes Material3 tint
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(14.w),
          child: GlobalNavigator(),
        ),
        title: TextView(
          text: 'Wallet',
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
        padding: EdgeInsets.symmetric(vertical: 32.0.w, horizontal: 20.w),
        child: Column(
          children: [
            WalletCard(),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Recent Transactions',
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                TextView(
                  text: 'See all',
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 13.9.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 4.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Column(
                children: [
                  ...transLength.asMap().entries.map((entry) {
                    final index = entry.key;
                    // final e = entry.value;

                    final isLast = index == transLength.length - 1;
                    return GestureDetector(
                      onTap: () =>
                          navigate.navigateTo(Routes.transactionScreen),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 12.w),
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
                                    // fontFamily: 'GoogleSans',
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.reminder,
                                  ),
                                ),
                              ],
                            ),
                            if (!isLast) SizedBox(height: 10),
                            if (!isLast)
                              DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double
                                    .infinity, // To make it span the full width
                                lineThickness: 1.0,
                                dashLength: 4.0,
                                dashColor: AppColors.dottedGrey,
                                dashGapLength: 4.0,
                                dashGapColor:
                                    Colors.transparent, // Or a background color
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
