import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../widget/button.dart';
import '../../../widget/divider_widget.dart';
import '../../../widget/text.dart';
import '../../../widget/xela_divider_models.dart';

class ProHealthSubScreen extends StatefulWidget {
  const ProHealthSubScreen({super.key});

  @override
  State<ProHealthSubScreen> createState() => _ProHealthSubScreenState();
}

class _ProHealthSubScreenState extends State<ProHealthSubScreen> {
  @override
  Widget build(BuildContext context) {
    // bool isTablet(BuildContext context) =>
    //     MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => HMOViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, HMOViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.dashboard,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
            toolbarHeight: 80.0,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlobalNavigator(),
                  TextView(
                    text: 'ProHealth',
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.deep,
                    ),
                  ),
                  SizedBox(width: 50.w, height: 50.h),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 14.50.w, horizontal: 16.w),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.w,
                          horizontal: 16.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        model.isProSubStatus = 'individual';
                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                        ),
                                        decoration:
                                            model.isProSubStatus == 'individual'
                                            ? BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                              )
                                            : BoxDecoration(),
                                        alignment: Alignment.center,
                                        child: TextView(
                                          text: 'Individual',
                                          textStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Arial',
                                            color:
                                                model.isProSubStatus ==
                                                    'individual'
                                                ? AppColors.white
                                                : AppColors.grey1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        model.isProSubStatus = 'family';
                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                        ),
                                        decoration:
                                            model.isProSubStatus == 'family'
                                            ? BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                              )
                                            : BoxDecoration(),
                                        alignment: Alignment.center,
                                        child: TextView(
                                          text: 'Family',
                                          textStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Arial',
                                            color:
                                                model.isProSubStatus == 'family'
                                                ? AppColors.white
                                                : AppColors.grey1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        model.isProSubStatus = 'corporate';
                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                        ),
                                        decoration:
                                            model.isProSubStatus == 'corporate'
                                            ? BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                              )
                                            : BoxDecoration(),
                                        alignment: Alignment.center,
                                        child: TextView(
                                          text: 'Corporate',
                                          textStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Arial',
                                            color:
                                                model.isProSubStatus ==
                                                    'corporate'
                                                ? AppColors.white
                                                : AppColors.grey1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 12.w,
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(color: AppColors.infoGrey1),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'All Tiers',
                                    textStyle: TextStyle(
                                      fontSize: 15.6.sp,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.infoGrey,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: TextView(
                                text: 'Individual Plans',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 17.2.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.deep,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.10.h),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: TextView(
                                text:
                                    'Personal health coverage designed for single individuals. Choose your tier based on your coverage needs.',
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 15.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.fineGrey,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            rowthickCheckWidget(
                              text: 'Must provide medical history declaration',
                              color: AppColors.app_green,
                            ),
                            rowthickCheckWidget(
                              text: 'Valid identification documents required',
                              color: AppColors.app_green,
                            ),
                            rowthickCheckWidget(
                              text: 'Hospital choice from network',
                              color: AppColors.app_green,
                            ),
                            rowthickCheckWidget(
                              text: 'Processing time: 2 weeks',
                              color: AppColors.app_green,
                            ),
                            SizedBox(height: 10.h),
                            Divider(color: AppColors.infoGrey1),
                            SizedBox(height: 20.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 22.w,
                                horizontal: 22.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0.r),
                                border: Border.all(color: AppColors.infoGrey1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppImage.person2),
                                          SizedBox(width: 6.w),
                                          TextView(
                                            text: 'Basic Plan',
                                            textStyle: TextStyle(
                                              fontSize: 18.6.sp,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.deep,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.w,
                                          horizontal: 10.w,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.appRed,
                                          ),
                                          color: AppColors.faintedRed,
                                          borderRadius: BorderRadius.circular(
                                            100.r,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.star,
                                              color: AppColors.red,
                                            ),
                                            SizedBox(width: 6.w),
                                            TextView(
                                              text: 'Ruby',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 15.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  TextView(
                                    text:
                                        'Essential healthcare coverage for individuals with access to quality medical services at affordable rates.',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.fineGrey,
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: '₦75,000 ',
                                        textStyle: TextStyle(
                                          fontSize: 28.8.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.deep,
                                        ),
                                      ),
                                      TextView(
                                        text: '/12 months',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 15.8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.fineGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  TextView(
                                    text: '3 hospitals in network',
                                    textStyle: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.fineGrey,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  rowlightCheckWidget(
                                    'Outpatient consultations',
                                  ),
                                  rowlightCheckWidget('Inpatient care'),
                                  rowlightCheckWidget('Laboratory tests'),
                                  rowlightCheckWidget('Pharmacy benefits'),
                                  SizedBox(height: 10.h),
                                  TextView(
                                    text: '+1 more benefits',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.w,
                                    ),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        100.r,
                                      ),
                                      color: AppColors.primary,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextView(
                                          text: 'Subscribe Now',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 15.8.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 24.w),
                        decoration: BoxDecoration(
                          color: AppColors.nearDashboard,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            TextView(
                              text: 'How it works',
                              textStyle: TextStyle(
                                fontSize: 20.4.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'GoogleSans',
                                color: AppColors.deep,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                              child: TextView(
                                text: '1',
                                textStyle: TextStyle(
                                  fontSize: 16.8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'GoogleSans',
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.10.h),
                            TextView(
                              text: 'Choose a Plan',
                              textStyle: TextStyle(
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'GoogleSans',
                                color: AppColors.deep,
                              ),
                            ),
                            SizedBox(height: 4.10.h),
                            SizedBox(
                              width: 240.w,
                              child: TextView(
                                text:
                                    'Browse HMOs and select your preferred tier',
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  color: AppColors.fineGrey,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              height: 40.50.h, // 👈 MUST specify height
                              child: XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                orientation: XelaDividerOrientation.VERTICAL,
                                color: AppColors.primary,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                              child: TextView(
                                text: '2',
                                textStyle: TextStyle(
                                  fontSize: 16.8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'GoogleSans',
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.10.h),
                            TextView(
                              text: 'Complete Application',
                              textStyle: TextStyle(
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'GoogleSans',
                                color: AppColors.deep,
                              ),
                            ),
                            SizedBox(height: 4.10.h),
                            SizedBox(
                              width: 240.w,
                              child: TextView(
                                text: 'Fill out the form and upload documents',
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  color: AppColors.fineGrey,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              height: 40.50.h, // 👈 MUST specify height
                              child: XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                orientation: XelaDividerOrientation.VERTICAL,
                                color: AppColors.primary,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                              child: TextView(
                                text: '3',
                                textStyle: TextStyle(
                                  fontSize: 16.8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'GoogleSans',
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.10.h),
                            TextView(
                              text: 'Make Payment',
                              textStyle: TextStyle(
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'GoogleSans',
                                color: AppColors.deep,
                              ),
                            ),
                            SizedBox(height: 4.10.h),
                            SizedBox(
                              width: 240.w,
                              child: TextView(
                                text: 'Complete payment and accept agreement',
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  color: AppColors.fineGrey,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              height: 40.50.h, // 👈 MUST specify height
                              child: XelaDivider(
                                style: XelaDividerStyle.DOTTED,
                                orientation: XelaDividerOrientation.VERTICAL,
                                color: AppColors.primary,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                              ),
                              child: TextView(
                                text: '4',
                                textStyle: TextStyle(
                                  fontSize: 16.8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'GoogleSans',
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.10.h),
                            TextView(
                              text: 'Get Covered',
                              textStyle: TextStyle(
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'GoogleSans',
                                color: AppColors.deep,
                              ),
                            ),
                            SizedBox(height: 4.10.h),
                            SizedBox(
                              width: 240.w,
                              child: TextView(
                                text:
                                    'Receive your HMO card and start using benefits',
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  color: AppColors.fineGrey,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 24.w),
                        decoration: BoxDecoration(color: AppColors.white),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            TextView(
                              text: 'Plan Tiers',
                              textStyle: TextStyle(
                                fontSize: 20.4.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'GoogleSans',
                                color: AppColors.deep,
                              ),
                            ),
                            SizedBox(height: 6.10.h),
                            TextView(
                              text: 'Choose the tier that fits your needs',
                              textStyle: TextStyle(
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                color: AppColors.fineGrey,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 24.w,
                                horizontal: 24.w,
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 42.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.faintedRed),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.faintedRed,
                                    ),
                                    padding: EdgeInsets.all(12.w),
                                    child: SvgPicture.asset(
                                      AppImage.star,
                                      height: 16.6.h,
                                      width: 16.6.w,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  TextView(
                                    text: 'Ruby',
                                    textStyle: TextStyle(
                                      fontSize: 18.4.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Arial',
                                      color: AppColors.deep,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  rowthickCheckWidget(
                                    text: 'Basic coverage',
                                    color: AppColors.infoGrey,
                                  ),
                                  rowthickCheckWidget(
                                    text: 'Essential medications',
                                    color: AppColors.infoGrey,
                                  ),
                                  rowthickCheckWidget(
                                    text: 'Standard hospital network',
                                    color: AppColors.infoGrey,
                                  ),
                                  SizedBox(height: 30.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget rowthickCheckWidget({String? text, Color? color}) => Padding(
    padding: EdgeInsets.only(bottom: 10.w, left: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImage.thick_check, color: color),
        SizedBox(width: 10.w),
        Expanded(
          child: TextView(
            text: text ?? '',
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
        ),
      ],
    ),
  );
  Widget rowlightCheckWidget(String text) => Padding(
    padding: EdgeInsets.only(bottom: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImage.light_check),
        SizedBox(width: 10.w),
        Expanded(
          child: TextView(
            text: text,
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
        ),
      ],
    ),
  );
}
