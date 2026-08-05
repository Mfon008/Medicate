// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../widget/text.dart';
import 'overview_screen.dart';
import 'product/order_management/order_management_screen.dart';
import 'product/product_screen.dart';

class OverviewDashboard extends StatefulWidget {
  const OverviewDashboard({super.key});

  @override
  State<OverviewDashboard> createState() => _OverviewDashboardState();
}

class _OverviewDashboardState extends State<OverviewDashboard> {
   int _currentIndex = 0;

  final List<Widget> _body = [
    OverviewScreen(),
    ProductScreen(),
    OrderManagementScreen(),
    Container()
  ];

  Future<bool> willPopControl() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: TextView(
              text: 'Do you want to exit the app',
              textAlign: TextAlign.center,
              fontSize: 18.0.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.red, // Text Color
                    ),
                    child: TextView(
                      text: 'No',
                      fontSize: 20.sp,
                      color: AppColors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () => exitApp(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.green, // Text Color
                    ),
                    child: TextView(
                      text: 'Yes',
                      fontSize: 20.sp,
                      color: AppColors.green,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )) ??
        false;
  }

  void exitApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
    });
  }

  // @override
  // void initState() {
  //   _currentIndex = widget.index ?? 0;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopControl,
      child: Scaffold(
        body: Center(child: _body[_currentIndex]),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.white,
              splashColor: AppColors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              selectedItemColor: AppColors.primary,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 14.8.sp,
              unselectedFontSize: 14.6.sp,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                fontFamily: 'DMSans',
                fontSize: 14.4.sp,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                fontFamily: 'DMSans',
                fontSize: 14.4.sp,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AppImage.home,
                        color: _currentIndex == 0
                            ? AppColors.primary
                            : AppColors.fineGrey,
                        height: 26.0.h,
                        width: 26.0.w,
                      ),

                      SizedBox(height: 6.0.w),
                    ],
                  ),
                  label: 'Overview',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AppImage.box_cart,
                        color: _currentIndex == 1
                            ? AppColors.primary
                            : AppColors.fineGrey,
                        height: 28.0.h,
                        width: 28.0.w,
                      ),
                      SizedBox(height: 6.0.w),
                    ],
                  ),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AppImage.manu_order,
                        color: _currentIndex == 2
                            ? AppColors.primary
                            : AppColors.fineGrey,
                        height: 28.0.h,
                        width: 28.0.w,
                      ),

                      SizedBox(height: 6.0.w),
                    ],
                  ),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.4.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: SvgPicture.asset(
                          AppImage.wallet,
                          height: 24.0.h,
                          width: 16.20.w,
                          color: _currentIndex == 3
                            ? AppColors.primary
                            : AppColors.fineGrey,
                        ),
                      ),

                      SizedBox(height: 3.90.w),
                    ],
                  ),
                  label: 'Wallet',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}