// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/ui/dashboard/home_screen.dart';
import '../../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../widget/text.dart';
import 'ask_me_screen.dart';
import 'reminder/reminder_screen.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  Dashboard({super.key, this.index,this.isTapHMOPlan,this.isSubStatus});
  String? isSubStatus;
  bool? isTapHMOPlan;
  int? index;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  bool _isTapHMOPlan = false;
  String? _isSubStatus;

  List<Widget> get _body => [
    HomeScreen(isTapHMOPlan: _isTapHMOPlan,isSubStatus: _isSubStatus),
    ReminderScreen(),
    Container(),
    AskMeScreen(),
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
    _isTapHMOPlan = widget.isTapHMOPlan?? false;
    _isSubStatus = widget.isSubStatus;
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
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AppImage.pills_filled,
                        color: _currentIndex == 1
                            ? AppColors.primary
                            : AppColors.fineGrey,
                        height: 28.0.h,
                        width: 28.0.w,
                      ),
                      SizedBox(height: 6.0.w),
                    ],
                  ),
                  label: 'Reminder',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AppImage.cart,
                        color: _currentIndex == 2
                            ? AppColors.primary
                            : AppColors.fineGrey,
                        height: 28.0.h,
                        width: 28.0.w,
                      ),

                      SizedBox(height: 6.0.w),
                    ],
                  ),
                  label: 'Pharmacy',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.4.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.inactive.withOpacity(.1),
                        ),
                        child: SvgPicture.asset(
                          AppImage.big_logo,
                          height: 24.0.h,
                          width: 16.20.w,
                        ),
                      ),

                      SizedBox(height: 3.90.w),
                    ],
                  ),
                  label: 'AskMed',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
