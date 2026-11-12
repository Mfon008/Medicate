// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/ui/fulfilment/service_area_screen.dart';
import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../widget/text.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class FulfilmentDashboard extends StatefulWidget {
  FulfilmentDashboard({super.key, this.index});
  int? index;

  @override
  State<FulfilmentDashboard> createState() => _FulfilmentDashboardState();
}

class _FulfilmentDashboardState extends State<FulfilmentDashboard> {
  int _currentIndex = 0;

  final List<Widget> _body = [
    FulfilmentHomeScreen(),
    ServiceAreaScreen(),
    Container(),
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

  @override
  void initState() {
    _currentIndex = widget.index ?? 0;
    super.initState();
  }

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
                fontFamily: 'Arial',
                fontSize: 14.4.sp,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                fontFamily: 'Arial',
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
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AppImage.locator,
                        color: _currentIndex == 1
                            ? AppColors.primary
                            : AppColors.fineGrey,
                        height: 28.0.h,
                        width: 28.0.w,
                      ),
                      SizedBox(height: 6.0.w),
                    ],
                  ),
                  label: 'Service Area',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AppImage.permission,
                        color: _currentIndex == 2
                            ? AppColors.primary
                            : AppColors.fineGrey,
                        height: 28.0.h,
                        width: 28.0.w,
                      ),

                      SizedBox(height: 6.0.w),
                    ],
                  ),
                  label: 'Permission',
                ),],
            ),
          ),
        ),
      ),
    );
  }
}
