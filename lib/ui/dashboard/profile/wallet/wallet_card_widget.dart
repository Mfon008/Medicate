// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';

import '../../../../core/config/colors.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            // lighter blue
            AppColors.primary.withOpacity(.94), // lighter blue
            AppColors.primary.withOpacity(.94), // lighter blue
            AppColors.primary.withOpacity(.92), // lighter blue
            AppColors.primary.withOpacity(.92), // lighter blue
            AppColors.primary.withOpacity(.92), // lighter blue
            AppColors.primary.withOpacity(.94), // lighter blue
            AppColors.primary.withOpacity(.94), // lighter blue
            AppColors.primary, // lighter blue
          ],
        ),
      ),
      child: Stack(
        children: [
          // Vertical gradient lines overlay
          Positioned.fill(child: CustomPaint(painter: _VerticalLinesPainter())),

          // Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Wallet Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Arial',
                    fontSize: 14.8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "₦150,000.00",
                  style: TextStyle(
                    // fontFamily: 'GoogleSans',
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hide balance",
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    ),
                    SizedBox(width: 5),

                    SvgPicture.asset(
                      AppImage.closed_eye,
                      color: Colors.white70,
                      height: 11.90.h,
                      width: 12.h,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () => navigate.navigateTo(Routes.fundScreen),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15.20.w, right: 15.20.w),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white38, width: 1),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add_circle_outline_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Fund Wallet",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromARGB(255, 25, 103, 205),
          const Color.fromARGB(255, 25, 103, 205),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    double spacing = size.width / 8; // 6 faint vertical lines

    for (double x = spacing; x < size.width - spacing / 2; x += spacing) {
      canvas.drawRect(Rect.fromLTWH(x, 0, 1.5, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
