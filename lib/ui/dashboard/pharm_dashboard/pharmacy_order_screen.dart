// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/pharm_auth_view_model.dart';
import '../../widget/button.dart';
import '../../widget/text.dart';

class PharmacyOrderScreen extends StatelessWidget {
  const PharmacyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, PharmViewModel model, _) {
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
              text: 'My Orders',
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
            padding: EdgeInsets.symmetric(horizontal: 16.20.w, vertical: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 14.20,
                  runSpacing: 13.20,
                  children: [
                    ...model.myOrderListCategory.map(
                      (e) => GestureDetector(
                        onTap: () {
                          model.orderCategory = e;
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.64.w,
                            vertical: 7.2.w,
                          ),
                          decoration: BoxDecoration(
                            color: model.orderCategory == e
                                ? AppColors.primary
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextView(
                            text: e,
                            textStyle: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 13.12.sp,
                              fontWeight: FontWeight.w500,
                              color: model.orderCategory == e
                                  ? AppColors.white
                                  : AppColors.infoGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.2.w,
                    horizontal: 14.60.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.infoGrey1),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Filter by date',
                        textStyle: TextStyle(
                          fontFamily: 'GoogleSans',
                          fontSize: 15.62.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: GestureDetector(
                          onTap: () => model.selectDateCheckout(
                            context: context,
                            model: model,
                          ),
                          child: SvgPicture.asset(
                            AppImage.calendar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),
                  clipBehavior: Clip
                      .antiAlias, // Keeps children inside the rounded corners
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Blue Header
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.20.w),
                        decoration: const BoxDecoration(
                          color: Color(0xFF0057C2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'W0-2026-583',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 17.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.64.w,
                                    vertical: 3.42.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.appWhite,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: TextView(
                                    text: 'In transit',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 14.2.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lightBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.10.h),
                            TextView(
                              text: 'Placed on Jul 14, 2026, 11:22 AM',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(107, 255, 255, 255),
                                letterSpacing: -0.12,
                              ),
                            ),

                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: '₦42,000',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 17.2.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4.10.h),
                                    TextView(
                                      text: 'INSTANT DISPATCH',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 13.44.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(
                                          107,
                                          255,
                                          255,
                                          255,
                                        ),
                                        letterSpacing: -0.1,
                                      ),
                                    ),
                                  ],
                                ),

                                Container(
                                  padding: EdgeInsets.all(8.10.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_up_sharp,
                                    size: 22.sp,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          vertical: 16.w,
                          horizontal: 16.20.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 16.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.infoGrey1,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Order Tracking',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 15.4.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                            SizedBox(height: 5.60.h),
                            Row(
                              children: [
                                TextView(
                                  text: 'Est. Delivery:',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 12.4.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoGrey,
                                  ),
                                ),
                                TextView(
                                  text: ' 2026-07-14',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 13.4.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.reminder,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 14.h),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.64.w,
                                    vertical: 3.42.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.app_green,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        size: 15.80.sp,
                                        color: AppColors.white,
                                      ),
                                      SizedBox(width: 4.w),
                                      TextView(
                                        text: 'Order Confirmed',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.64.w,
                                    vertical: 3.42.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.app_green,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        size: 15.80.sp,
                                        color: AppColors.white,
                                      ),
                                      SizedBox(width: 4.w),
                                      TextView(
                                        text: 'Packaging',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 14.h),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.64.w,
                                    vertical: 3.42.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlue,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        AppImage.delivery,
                                        color: AppColors.appWhite,
                                      ),
                                      SizedBox(width: 4.w),
                                      TextView(
                                        text: 'In Transit',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.64.w,
                                    vertical: 3.42.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.infoGrey1,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        size: 14.sp,
                                        color: AppColors.infoGrey,
                                      ),
                                      SizedBox(width: 4.w),
                                      TextView(
                                        text: 'Delivery',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          vertical: 6.w,
                          horizontal: 16.20.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 16.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.infoGrey1,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Delivery Details',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 15.4.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10.w),
                                  child: SvgPicture.asset(
                                    AppImage.locator,
                                    height: 15.20.h,
                                    width: 15.20.w,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Delivery Destination',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12.4.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230.w,
                                      child: TextView(
                                        text:
                                            'Apex Medical Clinic, 42 Broad Street, Lagos',
                                        maxLines: 4,
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 12.4.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Divider(color: AppColors.infoGrey1),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10.w),
                                  child: SvgPicture.asset(
                                    AppImage.phone,
                                    height: 15.20.h,
                                    width: 15.20.w,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Phone Number',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12.4.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230.w,
                                      child: TextView(
                                        text: '+234 80 4256789',
                                        maxLines: 4,
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 12.4.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(color: AppColors.infoGrey1),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12.w),
                                  child: SvgPicture.asset(
                                    AppImage.order_notes,
                                    height: 15.20.h,
                                    width: 15.20.w,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Order Notes',
                                      textStyle: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12.4.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230.w,
                                      child: TextView(
                                        text:
                                            'Call this number {Phone number} for pick up ',
                                        maxLines: 4,
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 12.4.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 7.10.w,
                          horizontal: 16.20.w,
                        ),
                        child: Divider(color: AppColors.infoGrey1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.20.w,
                          vertical: 1.0.w,
                        ),
                        child: TextView(
                          text: 'Items(1)',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 13.4.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.reminder,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          left: 16.20.w,
                          right: 16.20.w,
                        ),
                        padding: EdgeInsets.all(17.20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52.w,
                              height: 52.h,
                              padding: EdgeInsets.all(2.0.w),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    236,
                                    237,
                                    237,
                                  ),
                                ),
                              ),
                              child: Image.asset(
                                AppImage.med_image,
                                height: 24.0.h,
                                width: 24.0.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextView(
                                    text: 'Antacid Tablets',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextView(
                                        text: 'Qty 4 | ₦18,500',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 13.20.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.infoGrey,
                                          letterSpacing: -0.1,
                                        ),
                                      ),
                                      TextView(
                                        text: '₦37,000',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 15.20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.w,
                                      horizontal: 14.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22.r),
                                      color: AppColors.grey,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: 'Manufacturer: ',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 13.20.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.infoGrey,
                                            letterSpacing: -0.21,
                                          ),
                                        ),
                                        TextView(
                                          text: ' Fidson',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 13.20.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.reminder,
                                            letterSpacing: -0.21,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.20.w,
                          vertical: 20.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.infoGrey1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Subtotal',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                TextView(
                                  text: '₦37,000',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.42.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Delivery',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                TextView(
                                  text: '₦5,000',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.42.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),

                            Divider(color: AppColors.infoGrey1),
                            SizedBox(height: 4.10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Total:',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 16.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                                TextView(
                                  text: '₦42,000',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 16.42.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.reminder1,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16.20.w),
                        width: double.infinity,
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.03),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Order Number
                            TextView(
                              text: "WO-2026-882",
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 18.20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.reminder,
                              ),
                            ),

                            SizedBox(height: 12.h),

                            /// Status Badge
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xffEDF5FF),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: TextView(
                                text: "1 InTransit • 1 Packaging • 1 Confirmed",
                                textStyle: TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 13.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),

                            SizedBox(height: 12.h),
                            TextView(
                              text: "Placed on Jul 14, 2026, 11:22 AM",
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.infoGrey,
                              ),
                            ),
                            SizedBox(height: 12.h),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// Amount & Delivery
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: "₦100,000",
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff3A3A3A),
                                        ),
                                      ),

                                      SizedBox(height: 4.h),

                                      TextView(
                                        text: "SCHEDULED DELIVERY",
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                          letterSpacing: .1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                /// Expand Button
                                Container(
                                  height: 44.w,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF3F7FC),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xffD9E7FF),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xff0F56C3),
                                    size: 28,
                                  ),
                                ),
                              ],
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
}
