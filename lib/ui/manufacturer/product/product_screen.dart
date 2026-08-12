// ignore_for_file: deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/manufacturer_view_model.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';
import 'custom_switch_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isSwitched = false;
  var i;

  GlobalKey<FormState> formKeyBulkUploads = GlobalKey<FormState>();

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
                  onPressed: () {},
                  // onPressed: () => navigate.navigateTo(
                  //   Routes.moreScreen,
                  // ), // makes ripple effect round
                ),
              ),
              SvgPicture.asset(AppImage.applogoSvg, height: 28.h, width: 28.w),
              Container(
                margin: EdgeInsets.only(right: 2.4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.inactive.withValues(alpha: .1),
                  border: Border.all(
                    color: AppColors.inactive.withValues(alpha: .4),
                  ),
                ),
                child: Stack(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        AppImage.bell,
                        height: isTablet(context) ? 40.h : 20.h,
                        width: isTablet(context) ? 40.w : 20.w,
                        color: AppColors.primary,
                      ),
                      onPressed: () {},
                      // onPressed: () =>
                      //     navigate.navigateTo(Routes.notificationScreen),
                      splashRadius: 28,
                    ),
                    // model.getUnreadNotificationCountModel != null &&
                    //         model
                    //                 .getUnreadNotificationCountModel!
                    //                 .data!
                    //                 .count! >
                    //             0
                    //     ? Positioned(
                    //         left: 28,
                    //         top: 8,
                    //         child: Container(
                    //           padding: EdgeInsets.all(3.14.w),
                    //           decoration: BoxDecoration(
                    //             color: AppColors.appRed.withOpacity(.88),
                    //             shape: BoxShape.circle,
                    //           ),
                    //         ),
                    //       )
                    //     : SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.88.w, vertical: 24.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Products',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 18.2.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.reminder,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      TextView(
                        text: isTablet(context)
                            ? 'Manage wholesale products'
                            : 'Manage wholesale\nproducts',
                        maxLines: 2,
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _showModalBottomSheet(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet(context) ? 16.w : 13.0.w,
                      vertical: isTablet(context) ? 12.w : 9.2.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 20.0.sp,
                          weight: 10,
                        ),
                        SizedBox(width: 2.6.w),
                        TextView(
                          text: 'Add Product',
                          textStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14.22.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 12.4.w),
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
                          text: 'Categories: ',
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

                  ...[1, 2].map((e) {
                    return GestureDetector(
                      onTap: () {
                        navigate.navigateTo(
                          Routes.manufacturerViewProductScreen,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 12.20.w),
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
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.w,
                                    horizontal: 9.0.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Center(
                                    child: TextView(
                                      text: 'antibiotics ',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 12.2.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                TextView(
                                  text: 'Exp: ',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14.22.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.infoGrey,
                                  ),
                                ),
                                TextView(
                                  text: '11/2028',
                                  textStyle: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14.22.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.red,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(8.8.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.skyBlue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    AppImage.pen,
                                    height: 16.10.h,
                                    width: 16.10.w,
                                  ),
                                ),
                                SizedBox(width: 6.w),

                                PopupMenuButton(
                                  color: AppColors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 10.w,
                                  ),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      onTap: () {},
                                      enabled: false,
                                      child: TextView(
                                        text: 'More Actions',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.infoGrey,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {},
                                      child: TextView(
                                        text: 'Duplicate',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16.2.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {},
                                      child: TextView(
                                        text: 'Delete Product',
                                        textStyle: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ),
                                  ],
                                  child: Container(
                                    padding: EdgeInsets.all(7.10.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.skyBlue,
                                      border: Border.all(
                                        color: AppColors.skyBlue,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 18.80.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            TextView(
                              text: 'Panadol Extra Tablets',
                              textStyle: TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 14.22.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.reminder,
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
                                      text: 'NAFDAC No',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    TextView(
                                      text: '04-1290',
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
                                      text: 'Price',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    TextView(
                                      text: '₦75,000',
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
                                      text: 'Stock',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Row(
                                      children: [
                                        Container(
                                          width: 6.28.w,
                                          height: 6.28.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.app_green,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 4.h),
                                        TextView(
                                          text: '90 units',
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
                                SizedBox(width: 10.h),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Pack',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    TextView(
                                      text: '100 /carton',
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
                                      text: 'MOQ',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    TextView(
                                      text: '2 carton(s)',
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
                                      text: 'Published',
                                      textStyle: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 15.22.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.infoGrey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomSwitch(
                                          value: i == e && isSwitched,
                                          onChanged: (bool val) {
                                            setState(() {
                                              isSwitched = val;
                                              i = e;
                                            });
                                          },
                                        ),
                                        SizedBox(width: 6.10.h),
                                        TextView(
                                          text: e == i && isSwitched
                                              ? 'Yes'
                                              : 'No',
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14.22.sp,
                                            fontWeight: FontWeight.w600,
                                            color: e == i && isSwitched
                                                ? AppColors.app_green
                                                : AppColors.reminder,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.h),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
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
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(22.6.w),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Keeps sheet height minimal
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextView(
                      text: 'Select Option',
                      color: AppColors.deep,
                      fontWeight: FontWeight.w700,
                      textStyle: TextStyle(
                        fontFamily: 'GoogleSans',
                        fontSize: 15.60.sp,
                        color: AppColors.deep,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context), // Closes the sheet
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0.w),
                        child: SvgPicture.asset(
                          AppImage.cancel,
                          height: 14.20.h,
                          width: 14.20.w,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  navigate.navigateTo(Routes.addProductScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.30.w,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AppColors.white, size: 24.sp),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'Add Manually',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.90.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  bulkUploadShowDialog(context:context,model: ManufacturerViewModel());
                  // Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.30.w,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImage.upload_icon,
                        width: 20.w,
                        height: 17.20.h,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'Bulk upload',
                        textStyle: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16.90.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.30.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImage.download_icon,
                            width: 12.20.w,
                            height: 14.20.h,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10.w),
                          TextView(
                            text: 'CSV Template',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14.90.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 14.46.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.30.w,
                        horizontal: 5.10.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImage.download_icon,
                            width: 12.20.w,
                            height: 14.20.h,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10.w),
                          TextView(
                            text: 'Export Products',
                            textStyle: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14.90.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }

  void bulkUploadShowDialog({context, ManufacturerViewModel? model}) {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing by tapping outside
      builder: (BuildContext context) {
        return ListenableBuilder(
          listenable: model!,
          builder: (_, _) {
            return Container(
              color: AppColors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: Colors.white, size: 18),
                      label: Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.10.h),
                  Dialog(
                    insetPadding: EdgeInsets.all(16.20.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.all(14.w),
                      child: Form(
                        key: formKeyBulkUploads,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextView(
                              text: 'Bulk Upload Products',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                color: AppColors.reminder,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            TextView(
                              text:
                                  'Upload a CSV file containing your product roster.',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                color: AppColors.reminder,
                                fontSize: 15.10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            SizedBox(
                              width: double.infinity,
                              child: DottedBorder(
                                options: RoundedRectDottedBorderOptions(
                                  dashPattern: [20, 20],
                                  strokeWidth: .94,
                                  radius: Radius.circular(10),
                                  color: AppColors.grey,
                                ),
                                child: GestureDetector(
                                  // onTap: () => model.pickImageMeansIdPractitioner(context),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 24.30.w,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.grey,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppImage.upload_doc,
                                          height: 24.0.h,
                                          width: 24.0.h,
                                        ),
                                        SizedBox(height: 10.h),
                                        TextView(
                                          text: 'Click to upload or drag and drop CSV file',
                                          textAlign: TextAlign.center,
                                          textStyle: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14.2.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.reminder,
                                          ),
                                        ),
                                        SizedBox(height: 2.0.h),
                                        SizedBox(
                                          width: 220.w,
                                          child: TextView(
                                            text:
                                                'Support format: CSV',
                                             textAlign: TextAlign.center,
                                            textStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 13.6.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2.0.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.50.h),
                            TextView(
                              text:
                                  'Note: Use our downloadable CSV Template to structure columns.',
                              textStyle: TextStyle(
                                fontFamily: 'DMSans',
                                color: AppColors.reminder,
                                fontSize: 15.10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 25.h),
                            // 🔹 Save button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  // width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.grey,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: model.isLoading
                                        ? SpinKitCircle(
                                            color: AppColors.deep,
                                            size: 22.sp,
                                          )
                                        : Text(
                                            "Cancel",
                                            style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.sp,
                                              color: AppColors.deep,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(width: 20.w,),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: model.isLoading
                                        ? SpinKitCircle(
                                            color: AppColors.white,
                                            size: 22.sp,
                                          )
                                        : Text(
                                            "Upload",
                                            style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 16.sp,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
