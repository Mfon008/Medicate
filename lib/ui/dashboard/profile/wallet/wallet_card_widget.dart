// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/widget/text.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({super.key});

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              AppImage.wallet_card,
              width: double.infinity,
              height: isTablet(context) ? 290.h : 205.0.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 20.h),
            TextView(
              text: "Wallet Balance",
              textStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Arial',
                fontSize: 14.8.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.0.h),
            TextView(
              text: !onTap ? "₦*.**" : "₦150,000.00",
              textStyle: TextStyle(
                // fontFamily: 'GoogleSans',
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextView(
                  text: !onTap ? "View Balance" : "Hide balance",
                  textStyle: TextStyle(color: Colors.white70, fontSize: 14.sp),
                ),
                SizedBox(width: 5),

                GestureDetector(
                  onTap: () => setState(() => onTap = !onTap),
                  child: SvgPicture.asset(
                    onTap ? AppImage.opened_eye : AppImage.closed_eye,
                    color: Colors.white70,
                    height: onTap ? 20.h : 11.90.h,
                    width: onTap ? 19.20 : 12.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            GestureDetector(
              onTap: () => navigate.navigateTo(Routes.fundScreen),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 23.0.w, right: 23.0.w),
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 24.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white38, width: 1),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline_outlined,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                    SizedBox(width: 8),
                    TextView(
                      text: "Fund Wallet",
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ],
    );
  }
}
