// ignore_for_file: strict_top_level_inference, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../../main.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class HmoHospitalNetworkPortalScreen extends StatelessWidget {
  const HmoHospitalNetworkPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) async {
        await model.getListOfHospital(context);
      },
      disposeViewModel: false,
      builder: (_, HMOViewModel model, _) {
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
                      border: Border.all(
                        color: AppColors.inactive.withOpacity(.4),
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
                        Routes.hMOMoreScreen,
                      ), // makes ripple effect round
                    ),
                  ),
                  TextView(
                    text: 'HMO Portal',
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
                      splashRadius: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => navigate.back(),
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.reminder1),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 12.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Hospital Network',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 18.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.deep,
                          ),
                        ),
                        SizedBox(
                          width: 240.w,
                          child: TextView(
                            text: 'Manage hospitals in your network',
                            maxLines: 2,
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 15.2.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              size: 16.20.sp,
                              color: AppColors.white,
                              weight: 10,
                            ),
                            onPressed: () => navigate.navigateTo(
                              Routes.hmoAddHospitalNetworkPortalScreen,
                              arguments:
                                  HmoAddHospitalNetworkPortalScreenArguments(
                                    isEditing: false,
                                  ),
                            ),
                            splashRadius: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.w,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.infoGrey1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormWidget(
                              label: 'Search Hospital',
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
                              onChange: (value) {
                                model.searchHospitalName = value;
                                print(model.searchHospitalName);
                                model.notifyListeners();
                              },
                            ),
                          ),
                          SizedBox(width: 14.w),
                          SvgPicture.asset(
                            AppImage.earth,
                            color: AppColors.lightBlue,
                            height: 14.50.h,
                            width: 22.50.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.grey),
                                borderRadius: BorderRadius.circular(8.0.r),
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      TextView(
                                        text: 'Location: ',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.82.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      TextView(
                                        text: 'All',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.60.sp,
                                          color: AppColors.infoGrey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 40.w),
                                  SvgPicture.asset(AppImage.arrow_down),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 7.20.w),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.grey),
                                borderRadius: BorderRadius.circular(8.0.r),
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      TextView(
                                        text: 'Status: ',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.82.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      TextView(
                                        text: 'All',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 14.60.sp,
                                          color: AppColors.infoGrey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 50.w),
                                  SvgPicture.asset(AppImage.arrow_down),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      if (model.getAllOfHospitalsResponseModel == null ||
                          model.getAllOfHospitalsResponseModel != null &&
                              model.getAllOfHospitalsResponseModel!.data !=
                                  null &&
                              model
                                      .getAllOfHospitalsResponseModel!
                                      .data!
                                      .hospitals ==
                                  null ||
                          model
                              .getAllOfHospitalsResponseModel!
                              .data!
                              .hospitals!
                              .isEmpty)
                        Container()
                      else if (model.searchHospitalName != '')
                        ...model
                            .getAllOfHospitalsResponseModel!
                            .data!
                            .hospitals!
                            .where(
                              (w) => w.name!.toLowerCase().contains(
                                model.searchHospitalName.toLowerCase(),
                              ),
                            )
                            .map(
                              (e) => Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16.w),
                                margin: EdgeInsets.only(bottom: 10.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.grey),
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.w,
                                            vertical: 2.2.h,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              22.r,
                                            ),
                                            border: Border.all(
                                              color: AppColors.app_green,
                                            ),
                                          ),
                                          child: TextView(
                                            text: e.isActive!
                                                ? 'Active'
                                                : 'Not Active',
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: e.isActive!
                                                  ? AppColors.app_green
                                                  : AppColors.appRed,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.w,
                                            vertical: 2.2.h,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              22.r,
                                            ),
                                            border: Border.all(
                                              color: AppColors
                                                  .searchInputFillColor
                                                  .withOpacity(.18),
                                            ),
                                          ),
                                          child: TextView(
                                            text: '${e.type}',
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 14.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
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
                                              onTap: () => navigate.navigateTo(
                                                Routes
                                                    .hmoAddHospitalNetworkPortalScreen,
                                                arguments:
                                                    HmoAddHospitalNetworkPortalScreenArguments(
                                                      isEditing: true,
                                                      hospitalId: e.id,
                                                    ),
                                              ),
                                              child: TextView(
                                                text: 'Edit Hospital',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              onTap: () =>
                                                  showActivationDialog(context),
                                              child: TextView(
                                                text: 'Deactivate',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                            ),
                                          ],
                                          child: Container(
                                            padding: EdgeInsets.all(6.10.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.skyBlue,
                                              border: Border.all(
                                                color: AppColors.skyBlue,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.more_vert,
                                              size: 16.20.sp,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.10.h),
                                    TextView(
                                      text: '${e.name}',
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 16.52.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.reminder,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.locator,
                                              height: 20.h,
                                              width: 20.w,
                                              color: AppColors.infoGrey,
                                            ),
                                            SizedBox(width: 10.w),
                                            SizedBox(
                                              width: 250.w,
                                              child: TextView(
                                                text:
                                                    '${e.address} ${e.city}, ${e.state}',
                                                maxLines: 4,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.phone,
                                              color: AppColors.infoGrey,
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: '${e.phone}',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 15.2.sp,
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
                            )
                      else if (model.getAllOfHospitalsResponseModel != null &&
                          model.getAllOfHospitalsResponseModel!.data != null &&
                          model
                              .getAllOfHospitalsResponseModel!
                              .data!
                              .hospitals!
                              .isNotEmpty)
                        ...model.getAllOfHospitalsResponseModel!.data!.hospitals!.map(
                          (e) => Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.w),
                            margin: EdgeInsets.only(bottom: 10.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey),
                              borderRadius: BorderRadius.circular(8.0.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 2.2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          22.r,
                                        ),
                                        border: Border.all(
                                          color: AppColors.app_green,
                                        ),
                                      ),
                                      child: TextView(
                                        text: e.isActive!
                                            ? 'Active'
                                            : 'Not Active',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 14.2.sp,
                                          fontWeight: FontWeight.w500,
                                          color: e.isActive!
                                              ? AppColors.app_green
                                              : AppColors.appRed,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 2.2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          22.r,
                                        ),
                                        border: Border.all(
                                          color: AppColors.searchInputFillColor
                                              .withOpacity(.18),
                                        ),
                                      ),
                                      child: TextView(
                                        text: '${e.type}',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 14.2.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
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
                                          onTap: () async {
                                            final result = await navigate.navigateTo(
                                              Routes
                                                  .hmoAddHospitalNetworkPortalScreen,
                                              arguments:
                                                  HmoAddHospitalNetworkPortalScreenArguments(
                                                    isEditing: true,
                                                    hospitalId: e.id,
                                                  ),
                                            );
                                            if (result == true) {
                                              await model.getListOfHospital(
                                                context,
                                              );
                                            }
                                          },
                                          child: TextView(
                                            text: 'Edit Hospital',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          onTap: () =>
                                              showActivationDialog(context),
                                          child: TextView(
                                            text: 'Deactivate',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ),
                                      ],
                                      child: Container(
                                        padding: EdgeInsets.all(6.10.w),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.skyBlue,
                                          border: Border.all(
                                            color: AppColors.skyBlue,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.more_vert,
                                          size: 16.20.sp,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.10.h),
                                TextView(
                                  text: '${e.name}',
                                  textStyle: TextStyle(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 16.52.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.reminder,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppImage.locator,
                                          height: 20.h,
                                          width: 20.w,
                                          color: AppColors.infoGrey,
                                        ),
                                        SizedBox(width: 10.w),
                                        SizedBox(
                                          width: 250.w,
                                          child: TextView(
                                            text:
                                                '${e.address} ${e.city}, ${e.state}',
                                            maxLines: 4,
                                            textOverflow: TextOverflow.ellipsis,
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.reminder,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppImage.phone,
                                          color: AppColors.infoGrey,
                                        ),
                                        SizedBox(width: 10.w),
                                        TextView(
                                          text: '${e.phone}',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 15.2.sp,
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
                        ),

                      SizedBox(height: 20.h),

                      Divider(color: AppColors.grey),
                      SizedBox(height: 12.20.h),
                      model.getAllOfHospitalsResponseModel != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (model.page <= 1) {
                                    } else {
                                      model.page--;
                                      model.getListOfHospital(context);
                                      model.notifyListeners();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 22.sp,
                                    color: model.page <= 1
                                        ? AppColors.primary.withOpacity(.3)
                                        : AppColors.primary,
                                  ),
                                ),
                                SizedBox(width: 36.0.w),
                                TextView(
                                  text:
                                      'Page ${model.getAllOfHospitalsResponseModel!.data!.meta!.page} of ${model.getAllOfHospitalsResponseModel!.data!.meta!.totalPages}',
                                  textStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 13.2.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),

                                SizedBox(width: 36.0.w),
                                IconButton(
                                  onPressed: () {
                                    if (model.page >=
                                        model
                                            .getAllOfHospitalsResponseModel!
                                            .data!
                                            .meta!
                                            .totalPages!) {
                                    } else {
                                      model.page++;
                                      model.getListOfHospital(context);
                                      model.notifyListeners();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 22.sp,
                                    color:
                                        model.page >=
                                            model
                                                .getAllOfHospitalsResponseModel!
                                                .data!
                                                .meta!
                                                .totalPages!
                                        ? AppColors.primary.withOpacity(.3)
                                        : AppColors.primary1,
                                  ),
                                ),
                              ],
                            )
                          : SizedBox.shrink(),
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

  showActivationDialog(context) => showDialog(
    context: context,
    barrierDismissible: false, // prevent closing by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 20.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 18.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(28.w),
                    decoration: BoxDecoration(
                      color: AppColors.yellow.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SvgPicture.asset(AppImage.exclam),
                ],
              ),
              SizedBox(height: 12.h),
              TextView(
                text: 'Are you sure?',
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  color: AppColors.black,
                  fontSize: 18.20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              TextView(
                text: 'This action will activate this Hospital.',
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  color: AppColors.success,
                  fontSize: 14.20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.w,
                      ),
                    ),
                    child: TextView(
                      text: "No, Cancel",
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15.6.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  // Continue Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.w,
                        ),
                        elevation: 0,
                      ),
                      child: TextView(
                        text: "Yes, Activate",
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15.6.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  Widget hmoPlanWidget({
    String? text,
    String? svg,
    String? count,
    Color? color,
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
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(svg!, width: 20.w, height: 20.h, color: color),
              SizedBox(width: 5.10.w),
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
          ),
        ],
      ),
    ),
  );
}
