// ignore_for_file: deprecated_member_use
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../core/core_folder/manager/shared_preference.dart';
import '../../../main.dart';
import '../../widget/text.dart';

class HMOHomeScreen extends StatefulWidget {
  const HMOHomeScreen({super.key});

  @override
  State<HMOHomeScreen> createState() => _HMOHomeScreenState();
}

class _HMOHomeScreenState extends State<HMOHomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: AppColors.dashboard,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 80.0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.burger,
                    color: AppColors.primary,
                    height: isTablet(context) ? 32.h : 12.h,
                    width: isTablet(context) ? 32.w : 12.w,
                  ),
                  onPressed: () => navigate.navigateTo(
                    Routes.hMOMoreScreen,
                  ), // makes ripple effect round
                ),
              ),
              TextView(
                text: 'Dashboard',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 18.2.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deep,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 2.4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withOpacity(.1),
                  border: Border.all(color: AppColors.inactive.withOpacity(.4)),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppImage.bell,
                    height: isTablet(context) ? 40.h : 20.h,
                    width: isTablet(context) ? 40.w : 20.w,
                    color: AppColors.primary,
                  ),
                  onPressed: () {},
                  splashRadius: 28,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => navigate.navigateTo(Routes.hMOProfileInfoScreen),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                padding: EdgeInsets.symmetric(
                  vertical: 12.w,
                  horizontal: 11.4.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color:
                        SharedPreferencesService
                                    .instance
                                    .usersData['memberships'] !=
                                null &&
                            SharedPreferencesService
                                    .instance
                                    .usersData['memberships'][0]['profileCompletionPercentage'] ==
                                100
                        ? AppColors.app_green
                        : AppColors.yellow,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color:
                          SharedPreferencesService
                                      .instance
                                      .usersData['memberships'] !=
                                  null &&
                              SharedPreferencesService
                                      .instance
                                      .usersData['memberships'][0]['profileCompletionPercentage'] ==
                                  100
                          ? AppColors.app_green
                          : AppColors.yellow,
                      size: 20.sp,
                    ),
                    SizedBox(width: 10.12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text:
                              SharedPreferencesService
                                          .instance
                                          .usersData['memberships'] !=
                                      null &&
                                  SharedPreferencesService
                                          .instance
                                          .usersData['memberships'][0] ==
                                      100
                              ? 'Completed'
                              : 'Complete Registration',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        TextView(
                          text:
                              SharedPreferencesService
                                          .instance
                                          .usersData['memberships'] !=
                                      null &&
                                  SharedPreferencesService
                                          .instance
                                          .usersData['memberships'][0]['profileCompletionPercentage'] !=
                                      null
                              ? 'Your registration is ${SharedPreferencesService.instance.usersData['memberships'][0]['profileCompletionPercentage']}% completed'
                              : 'Please enter your new PIN.',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 13.2.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.infoGrey,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      AppImage.arrow_forward,
                      width: 14.20.w,
                      height: 14.20.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.20.h),
            Row(
              children: [
                hmoPlanWidget(
                  isFinance: false,
                  text: 'All Plans',
                  svg: AppImage.hmo_shield,
                  count: '10',
                ),
                SizedBox(width: 7.10.w),
                hmoPlanWidget(
                  isFinance: false,
                  text: 'Plan Request',
                  svg: AppImage.bell_request,
                  count: '10',
                ),
              ],
            ),
            SizedBox(height: 10.20.h),
            Row(
              children: [
                hmoPlanWidget(
                  isFinance: false,
                  text: 'Total Subscribers',
                  svg: AppImage.sub_members,
                  count: '10',
                ),
                SizedBox(width: 7.10.w),
                hmoPlanWidget(
                  isFinance: false,
                  text: 'Renewal Request',
                  svg: AppImage.renewal_request,
                  count: '10',
                ),
              ],
            ),
            SizedBox(height: 10.20.h),
            Row(
              children: [
                hmoPlanWidget(
                  isFinance: true,
                  text: 'Finance',
                  svg: AppImage.sub_members,
                  count: '₦30,000,000',
                ),
                SizedBox(width: 174.0.w),
              ],
            ),
            SizedBox(height: 20.h),
            majorWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Applications by Tier Level',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text:
                        'Compare applications across Ruby, Pearl, and Diamond tiers',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 240.h,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 3,
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              reservedSize: 30,
                              showTitles: true,
                              interval: 0.75,
                              getTitlesWidget: (value, meta) {
                                return TextView(
                                  text: value.toString(),
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.reminder,
                                  ),
                                );
                              },
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              reservedSize: 60,
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 6.w,
                                          height: 4.0.h,
                                          margin: EdgeInsets.all(6.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary1,
                                            borderRadius: BorderRadius.circular(
                                              100.r,
                                            ),
                                          ),
                                        ),
                                        TextView(
                                          text: 'Ruby',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.2.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                      ],
                                    );
                                  case 1:
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 6.w,
                                          height: 4.0.h,
                                          margin: EdgeInsets.all(6.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary1,
                                            borderRadius: BorderRadius.circular(
                                              100.r,
                                            ),
                                          ),
                                        ),
                                        TextView(
                                          text: 'Pearl',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.2.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                      ],
                                    );
                                  case 2:
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 6.w,
                                          height: 4.0.h,
                                          margin: EdgeInsets.all(6.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary1,
                                            borderRadius: BorderRadius.circular(
                                              100.r,
                                            ),
                                          ),
                                        ),
                                        TextView(
                                          text: 'Diamond',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.2.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                      ],
                                    );
                                  default:
                                    return const Text("");
                                }
                              },
                            ),
                          ),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                        barGroups: [
                          _buildBar(0, 3.0, AppColors.red_bar),
                          _buildBar(1, 3.0, AppColors.purple),
                          _buildBar(2, 1.5, AppColors.lightBlue),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            majorWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Applications by Plan Type',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text: 'Individual vs Family vs Corporate plan distribution',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: AppColors.lightBlue,
                            value: 14,
                            title: 'Corporate 43%',
                            titleStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                            radius: 120,
                            titlePositionPercentageOffset: 1.2,
                          ),
                          PieChartSectionData(
                            color: AppColors.greyed_blue,
                            value: 43,
                            title: 'Family 14%',
                            titleStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                            radius: 120,
                            titlePositionPercentageOffset: 1.29,
                          ),
                          PieChartSectionData(
                            color: AppColors.primary,
                            value: 43,
                            title: 'Individual 43%',
                            titleStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                            radius: 120,
                            titlePositionPercentageOffset: 1.2,
                          ),
                        ],
                        centerSpaceRadius: 0, // Set > 0 for a donut chart
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 14.w,
                            height: 7.0.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary1,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          TextView(
                            text: '0',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5.10.h),
                      Row(
                        children: [
                          Container(
                            width: 14.w,
                            height: 7.0.h,
                            decoration: BoxDecoration(
                              color: AppColors.greyed_blue,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          TextView(
                            text: '1',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5.10.h),
                      Row(
                        children: [
                          Container(
                            width: 14.w,
                            height: 7.0.h,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          TextView(
                            text: '2',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            majorWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Monthly Activity Trends',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text:
                        'Applications, and subscribers over the last 6 months',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 320,
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: 8,
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                        titlesData: _titles(),
                        lineBarsData: [_applicationsLine(), _subscribersLine()],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 14.w,
                            height: 7.0.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary1,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          TextView(
                            text: 'Applications',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10.h),
                      Row(
                        children: [
                          Container(
                            width: 14.w,
                            height: 7.0.h,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          TextView(
                            text: 'Subscribers',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            majorWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Renewals vs New Subscriptions',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text:
                        'Track renewal activity against new subscriber growthpp',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 320,
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: 8,

                        gridData: FlGridData(show: false),

                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),

                        titlesData: _titles(),

                        lineBarsData: [_newSubscriptions(), _renewals()],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 14.w,
                            height: 7.0.h,
                            decoration: BoxDecoration(
                              color: AppColors.app_green,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          TextView(
                            text: 'New Subscriptions',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10.h),
                      Row(
                        children: [
                          Container(
                            width: 14.w,
                            height: 7.0.h,
                            decoration: BoxDecoration(color: AppColors.yellow),
                          ),
                          SizedBox(width: 2.w),
                          TextView(
                            text: 'Renewals',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14.2.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.reminder,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            majorWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Claims Overview',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 4.10.h),
                  TextView(
                    text: 'Claims count and amounts by status',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13.42.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                  SizedBox(height: 20.30.h),
                  Row(
                    children: [
                      claimsWidget(
                        text: 'Approved Claims',
                        count: '1',
                        color: AppColors.app_green,
                      ),
                      SizedBox(width: 10.w),
                      claimsWidget(
                        text: 'Pending Claims',
                        count: '1',
                        color: AppColors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(height: 13.20.h),
                  Row(
                    children: [
                      claimsWidget(
                        text: 'Rejected Claims',
                        count: '1',
                        color: AppColors.red,
                      ),
                      SizedBox(width: 10.w),
                      claimsWidget(
                        text: 'Paid Claims',
                        count: '1',
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: 13.20.h),
                  Row(
                    children: [
                      claimsWidget(
                        text: 'Partial approved',
                        count: '1',
                        color: AppColors.lightBlue,
                      ),
                      SizedBox(width: 164.0.w),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: strict_top_level_inference
  Container majorWidget({Widget? child}) => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: AppColors.infoGrey1),
    ),
    padding: EdgeInsets.all(12.w),
    child: child,
  );

  LineChartBarData _newSubscriptions() {
    return LineChartBarData(
      isCurved: true,
      color: Colors.green,
      barWidth: 2,

      spots: const [
        FlSpot(0, 0),
        FlSpot(1, 0),
        FlSpot(2, 0),
        FlSpot(3, 0),
        FlSpot(4, 1.5),
        FlSpot(5, 6.5),
      ],

      dotData: FlDotData(show: false),

      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            Colors.green.withOpacity(0.5),
            Colors.green.withOpacity(0.4),
            Colors.green.withOpacity(0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  LineChartBarData _renewals() {
    return LineChartBarData(
      isCurved: true,
      color: Colors.orange,
      barWidth: 2,
      spots: const [
        FlSpot(0, 0),
        FlSpot(1, 0),
        FlSpot(2, 0),
        FlSpot(3, 0),
        FlSpot(4, 0.5),
        FlSpot(5, 2),
      ],

      dotData: FlDotData(show: false),

      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            Colors.orange.withOpacity(0.5),
            Colors.orange.withOpacity(0.4),
            Colors.orange.withOpacity(0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  FlTitlesData _titles() {
    return FlTitlesData(
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 2,
          getTitlesWidget: (value, meta) {
            return Text(value.toInt().toString());
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 60, // 👈 IMPORTANT
          getTitlesWidget: _bottomTitle,
          interval: 1,
        ),
      ),
    );
  }

  Widget _bottomTitle(double value, TitleMeta meta) {
    const months = ['Aug 25', 'Sep 25', 'Oct 25', 'Nov 25', 'Dec 25', 'Jan 26'];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10.h),
        Container(
          width: 5.4,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        SizedBox(height: 10.h),
        Text(months[value.toInt()]),
      ],
    );
  }

  LineChartBarData _applicationsLine() {
    return LineChartBarData(
      isCurved: true,
      preventCurveOverShooting: true,
      color: Colors.blue.shade900,
      barWidth: 1,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, bar, index) {
          return FlDotCirclePainter(
            radius: 2.6,
            color: Colors.white,
            strokeWidth: 1,
            strokeColor: bar.color!,
          );
        },
      ),
      spots: const [
        FlSpot(0, 0),
        FlSpot(1, 0),
        FlSpot(2, 0),
        FlSpot(3, 0),
        FlSpot(4, 0),
        FlSpot(5, 5.4), // Jan
      ],
    );
  }

  LineChartBarData _subscribersLine() {
    return LineChartBarData(
      isCurved: true,
      preventCurveOverShooting: true,
      color: Colors.blue,
      barWidth: 1,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, bar, index) {
          return FlDotCirclePainter(
            radius: 2.6,
            color: Colors.white,
            strokeWidth: 1,
            strokeColor: bar.color!,
          );
        },
      ),
      spots: const [
        FlSpot(0, 0),
        FlSpot(1, 0),
        FlSpot(2, 0),
        FlSpot(3, 0),
        FlSpot(4, 0),
        FlSpot(5, 4.5),
      ],
    );
  }

  BarChartGroupData _buildBar(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 52.0.w,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ],
    );
  }

  Widget hmoPlanWidget({
    String? text,
    String? svg,
    String? count,
    bool? isFinance,
  }) => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.infoGrey1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: text!,
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15.2.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.reminder,
                ),
              ),
              SvgPicture.asset(AppImage.arrow, width: 10.w, height: 10.h),
            ],
          ),
          SizedBox(height: 10.w),
          !isFinance!
              ? Row(
                  children: [
                    SvgPicture.asset(svg!, width: 20.w, height: 20.h),
                    SizedBox(width: 10.w),
                    TextView(
                      text: count!,
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 20.2.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.reminder,
                      ),
                    ),
                  ],
                )
              : TextView(
                  text: count!,
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 20.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.reminder,
                  ),
                ),
        ],
      ),
    ),
  );

  Widget claimsWidget({String? text, String? count, Color? color}) => Expanded(
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.infoGrey1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: text!,
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 13.42.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
          SizedBox(height: 10.20.h),
          Row(
            children: [
              SvgPicture.asset(
                AppImage.claims,
                height: 20.h,
                width: 20.w,
                color: color,
              ),
              SizedBox(width: 10.20.h),
              TextView(
                text: count!,
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 13.42.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.reminder,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.20.h),
          TextView(
            text: '₦200,000',
            textStyle: TextStyle(
              fontFamily: 'GoogleSans',
              fontSize: 16.42.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.infoGrey,
            ),
          ),
        ],
      ),
    ),
  );
}
