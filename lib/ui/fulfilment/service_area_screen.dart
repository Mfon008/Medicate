import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/app_assets/image.dart';
import '../../core/config/colors.dart';
import '../widget/text.dart';
import '../widget/text_form_widget.dart';

class ServiceAreaScreen extends StatelessWidget {
  const ServiceAreaScreen({super.key});

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
              SvgPicture.asset(AppImage.applogoSvg, height: 28.h, width: 28.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withValues(alpha: .1),
                      border: Border.all(
                        color: AppColors.inactive.withValues(alpha: .4),
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
                      splashRadius: 24,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 2.4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.inactive.withValues(alpha: .1),
                      border: Border.all(
                        color: AppColors.inactive.withValues(alpha: .4),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImage.profile,
                        height: isTablet(context) ? 40.h : 20.h,
                        width: isTablet(context) ? 40.w : 20.w,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                      splashRadius: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Service Areas &\nCapabilities',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18.20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                IntrinsicWidth(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.w,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 20.sp, color: AppColors.white),
                        TextView(
                          text: 'Request Coverage',
                          textStyle: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15.20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: TextFormWidget(
                    label: 'Search products, manufacturers, SKU...',
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
                    fillColor: AppColors.white,
                    prefixWidget:
                        // model.isLoading
                        //     ? SizedBox(
                        //         width: 20.w,
                        //         height: 20.w,
                        //         child: Center(
                        //           child: SpinKitFadingCircle(
                        //             color: AppColors.primary1,
                        //             size: 18.sp,
                        //           ),
                        //         ),
                        //       )
                        //     :
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 12.6.w,
                          ),
                          child: SvgPicture.asset(AppImage.search),
                        ),
                    onChange: (value) {
                      // model.debouncer.run(() {
                      //   model.getListedMarketPlace(context);
                      // });
                      // model.searchProduct = value;
                    },
                  ),
                ),
                SizedBox(width: 22.40.w),
                GestureDetector(
                  // onTap: () => modalBottomSheetMenu(context),
                  child: SvgPicture.asset(
                    AppImage.filter,
                    color: AppColors.grey1,
                    height: 15.20.h,
                    width: 15.20.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.infoGrey1),
                color: AppColors.appWhite,
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

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
