// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class OrderManagementScreen extends StatefulWidget {
  const OrderManagementScreen({super.key});

  @override
  State<OrderManagementScreen> createState() => _OrderManagementScreenState();
}

class _OrderManagementScreenState extends State<OrderManagementScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, PharmViewModel model, _) {
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
                      color: AppColors.inactive.withValues(alpha: .1),
                      border: Border.all(
                        color: AppColors.inactive.withValues(alpha: .4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.burger,
                        color: AppColors.primary,
                        height: isTablet(context) ? 32.h : 12.h,
                        width: isTablet(context) ? 32.w : 12.w,
                      ),
                      onPressed: () => navigate.navigateTo(
                        Routes.pharmMoreScreen,
                      ), // makes ripple effect round
                    ),
                  ),
                  SvgPicture.asset(
                    AppImage.applogoSvg,
                    height: 28.h,
                    width: 28.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 2.4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withOpacity(.1),
                      border: Border.all(
                        color: AppColors.inactive.withOpacity(.4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.bell,
                        height: isTablet(context) ? 40.h : 20.h,
                        width: isTablet(context) ? 40.w : 20.w,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                      // navigate.navigateTo(Routes.emptyNotification),
                      splashRadius: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Order management',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18.20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      "Track incoming orders and move them through fulfilment. Status changes update the customer's dashboard in real time.",
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 14.20.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet(context) ? 16.w : 13.0.w,
                    vertical: isTablet(context) ? 12.w : 9.2.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppImage.download_icon,
                        height: 13.8.h,
                        width: 14.8.w,
                      ),
                      SizedBox(width: 6.w),
                      TextView(
                        text: 'Export CSV',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.22.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.w,
                    horizontal: 12.4.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.infoGrey1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormWidget(
                        label: 'Search by products',
                        labelStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14.60.sp,
                          color: AppColors.fineGrey,
                          fontWeight: FontWeight.w400,
                        ),
                        isFilled: true,
                        borderTopLeft: 10.r,
                        borderTopRight: 10.r,
                        borderBottomLeft: 10.r,
                        borderBottomRight: 10.r,
                        fillColor: AppColors.grey,
                        prefixWidget: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 12.6.w,
                          ),
                          child: SvgPicture.asset(
                            AppImage.search,
                            color: AppColors.infoGrey,
                          ),
                        ),
                        onChange: (value) {},
                      ),
                      SizedBox(height: 14.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 2.w,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 4.w),
                            TextView(
                              text: 'Status: ',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14.22.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                            TextView(
                              text: 'All',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14.22.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 20.0.sp,
                                color: AppColors.infoGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 15.22.w,
                          horizontal: 13.0.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IntrinsicWidth(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.w,
                                  horizontal: 12.0.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.fadedyellow,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: TextView(
                                    text: 'Pending',
                                    textStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 12.2.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.yellow,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.2.h),
                            TextView(
                              text: 'WO-260712-aa8408',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16.22.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.reminder,
                              ),
                            ),
                            SizedBox(height: 8.2.h),
                            TextView(
                              text:
                                  'Apex Medical Clinic, 42 Broad Street, Lagos',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 15.22.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                                letterSpacing: -0.52
                                
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'items Ordered',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                        letterSpacing: -0.92
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    TextView(
                                      text: '2',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Order Total',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                        letterSpacing: -0.92
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    TextView(
                                      text: '₦50,000',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Date Ordered',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                        letterSpacing: -0.92
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    TextView(
                                      text: 'Jul 12, 2026',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16.20.h),
                            GestureDetector(
                              onTap: () => navigate.navigateTo(Routes.viewOrderManagementScreen),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 1.42,
                                  ),
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.van,
                                      height: isTablet(context)
                                          ? 28.40.h
                                          : 14.20.h,
                                      width: isTablet(context)
                                          ? 28.40.w
                                          : 14.20.w,
                                      color: AppColors.primary,
                                    ),
                                    SizedBox(width: 7.10.w),
                                    TextView(
                                      text: 'Advance',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 17.20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 2.0.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 6.w, right: 6.w),
                        child: Divider(
                          color: AppColors.infoGrey,
                          height: 1.h,
                          thickness: 0.2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.primary1,
                              size: 20.sp,
                            ),
                          ),
                          TextView(
                            text: 'Page 1 of 10',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 15.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: AppColors.primary1,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.0.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
