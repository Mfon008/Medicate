// ignore_for_file: strict_top_level_inference, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/connect_end/model/active_hmo_plan_response_model/datum.dart';
import 'package:medicate_app/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';

class SubsribersScreen extends StatefulWidget {
  SubsribersScreen({super.key, this.isSubStatus, this.mySubPlans});
  String? isSubStatus;
  String? mySubPlans;

  @override
  State<SubsribersScreen> createState() => _SubsribersScreenState();
}

class _SubsribersScreenState extends State<SubsribersScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        if (widget.isSubStatus != null) {
          model.isSubStatus = widget.isSubStatus!;
        }
        if (widget.mySubPlans != '') {
          model.mySubPlans = widget.mySubPlans ?? '';
        }
        model.getHMOActivePlan(context);
      },
      disposeViewModel: false,
      onDispose: (viewModel) {},
      builder: (_, AuthViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColors.dashboard,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.50.w, horizontal: 16.w),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            model.isSubStatus = 'Plans';
                            model.notifyListeners();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.w),
                            decoration: model.isSubStatus == 'Plans'
                                ? BoxDecoration(
                                    color: AppColors.primary.withOpacity(.04),
                                    borderRadius: BorderRadius.circular(22.r),
                                  )
                                : BoxDecoration(),
                            alignment: Alignment.center,
                            child: TextView(
                              text: 'HMO Plans',
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: model.isSubStatus == 'Plans'
                                    ? AppColors.primary
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
                            model.isSubStatus = 'subscribers';
                            model.notifyListeners();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.w),
                            decoration: model.isSubStatus == 'subscribers'
                                ? BoxDecoration(
                                    color: AppColors.primary.withOpacity(.04),
                                    borderRadius: BorderRadius.circular(22.r),
                                  )
                                : BoxDecoration(),
                            alignment: Alignment.center,
                            child: TextView(
                              text: 'My Subsription',
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: model.isSubStatus == 'subscribers'
                                    ? AppColors.primary
                                    : AppColors.grey1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.90.h),
                model.isSubStatus == 'Plans'
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * .62,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormWidget(
                                      label: 'Search HMOs..',
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
                                      prefixWidget: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                          vertical: 12.6.w,
                                        ),
                                        child: SvgPicture.asset(
                                          AppImage.search,
                                        ),
                                      ),
                                      onChange: (value) {},
                                    ),
                                  ),
                                  SizedBox(width: 22.40.w),
                                  SvgPicture.asset(
                                    AppImage.filter,
                                    color: AppColors.grey1,
                                    height: 15.20.h,
                                    width: 15.20.w,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),

                              if (model.activeHmoPlanResponseModel != null &&
                                  model
                                      .activeHmoPlanResponseModel!
                                      .data!
                                      .isNotEmpty)
                                ...model.activeHmoPlanResponseModel!.data!.map(
                                  (e) => subscriberWidget(
                                    context: context,
                                    data: e,
                                    isTab: isTablet(context),
                                  ),
                                ),
                              SizedBox(height: 20.40.h),
                              Divider(
                                color: AppColors.buttonGrey1,
                                thickness: .4,
                              ),
                              SizedBox(height: 4.0.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              SizedBox(height: 50.h),
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .62,
                          child: RefreshIndicator(
                            onRefresh: () async {},
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(height: 10.h),
                                  TextFormWidget(
                                    label: 'Search HMOs..',
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
                                    prefixWidget: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 12.6.w,
                                      ),
                                      child: SvgPicture.asset(AppImage.search),
                                    ),
                                    onChange: (value) {},
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      subStatusWidget(
                                        color: AppColors.app_green,
                                        mainText: 'All Plans',
                                        statusText: '10',
                                        onTap: () {
                                          model.mySubPlans = 'All Plans';
                                          model.notifyListeners();
                                        },
                                        borderColor:
                                            model.mySubPlans == 'All Plans'
                                            ? AppColors.primary
                                            : AppColors.transparent,
                                      ),
                                      SizedBox(width: 12.30.w),
                                      subStatusWidget(
                                        color: AppColors.yellow,
                                        mainText: 'Under Review',
                                        statusText: '1',
                                        onTap: () {
                                          model.mySubPlans = 'Under Review';
                                          model.notifyListeners();
                                        },
                                        borderColor:
                                            model.mySubPlans == 'Under Review'
                                            ? AppColors.primary
                                            : AppColors.transparent,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.70.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      subStatusWidget(
                                        color: AppColors.grey1,
                                        mainText: 'Draft',
                                        statusText: '1',
                                        onTap: () {
                                          model.mySubPlans = 'Draft';
                                          model.notifyListeners();
                                        },
                                        borderColor: model.mySubPlans == 'Draft'
                                            ? AppColors.primary
                                            : AppColors.transparent,
                                      ),
                                      SizedBox(width: 12.30.w),
                                      subStatusWidget(
                                        color: AppColors.red,
                                        mainText: 'Rejected',
                                        statusText: '1',
                                        onTap: () {
                                          model.mySubPlans = 'Rejected';
                                          model.notifyListeners();
                                        },
                                        borderColor:
                                            model.mySubPlans == 'Rejected'
                                            ? AppColors.primary
                                            : AppColors.transparent,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  model.mySubPlans == 'All Plans'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text: 'All Plans',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 18.4.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.deep,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(12.w),
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      TextView(
                                                        text: 'Status: ',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 15.4.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                      TextView(
                                                        text: 'All',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 15.4.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .infoGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 12.w),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: AppColors.infoGrey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : Align(
                                          alignment: Alignment.topLeft,
                                          child: TextView(
                                            text: model.mySubPlans,
                                            textAlign: TextAlign.left,
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 18.4.sp,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.deep,
                                            ),
                                          ),
                                        ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.w,
                                      horizontal: 10.4.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.fadedyellow,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: AppColors.yellow,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: AppColors.yellow,
                                          size: 20.sp,
                                        ),
                                        SizedBox(width: 10.12.w),
                                        SizedBox(
                                          width: 268.0.w,
                                          child: TextView(
                                            text:
                                                'You have 1 plan expiring within the next 30 days. Renew now to maintain uninterrupted coverage.',
                                            maxLines: 3,
                                            textOverflow: TextOverflow.ellipsis,
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 13.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.deep,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16.20.h),
                                  plansSubWidget(statusText: 'Active'),
                                  SizedBox(height: 40.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  GestureDetector subscriberWidget({
    context,
    isTab,
    Datum? data,
    bool isComplete = false,
  }) => GestureDetector(
    onTap: () => navigate.navigateTo(
      Routes.proHealthSubScreen,
      arguments: ProHealthSubScreenArguments(hmoId: data.id),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 14.w),
      margin: EdgeInsets.only(bottom: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 36.0.w, horizontal: 40.w),
            width: MediaQuery.of(context).size.width / 0.5,
            height: 250.h,
            decoration: BoxDecoration(
              color: AppColors.dashboard,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.network(
              data?.logo?.url ?? '',
              height: 76.h,
              width: 76.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Padding(
                padding: EdgeInsets.all(18.w),
                child: Image.asset(
                  AppImage.pro_health,
                  height: 76.h,
                  width: 76.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 220.w,
                child: TextView(
                  text: data?.name ?? '',
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.reminder,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SvgPicture.asset(AppImage.locator, height: 10.h, width: 10.w),
                  SizedBox(width: 6.8.w),
                  TextView(
                    text: data!.businessAddress! == ""
                        ? 'Not Available'
                        : data.businessAddress!,
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.reminder,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImage.phone,
                        height: 10.h,
                        width: 10.w,
                      ),
                      SizedBox(width: 6.8.w),
                      TextView(
                        text: data.phone ?? '',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 20.6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextView(
                        text: 'Open 24 hours',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.app_green,
                        ),
                      ),
                      TextView(
                        text: '• Hospital',
                        textStyle: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.reminder,
                        ),
                      ),
                    ],
                  ),
                  TextView(
                    text: 'HMO Plans',
                    textStyle: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary1,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );

  subStatusWidget({
    required Color color,
    required String mainText,
    required String statusText,
    Function()? onTap,
    Color borderColor = AppColors.transparent,
  }) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: mainText,
              textStyle: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15.2.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.reminder,
              ),
            ),
            SizedBox(height: 4.2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImage.sub_frame, color: color),
                SizedBox(width: 6.2.w),
                TextView(
                  text: statusText,
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.reminder,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  plansSubWidget({required String statusText}) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColors.infoGrey1),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.yellow),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: TextView(
                text: statusText,
                maxLines: 3,
                textOverflow: TextOverflow.ellipsis,
                textStyle: TextStyle(
                  fontFamily: 'GoogleSans',
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.yellow,
                ),
              ),
            ),
            SizedBox(width: 6.w),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.appRed),
                color: AppColors.faintedRed,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppImage.star, color: AppColors.red),
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
            SizedBox(width: 10.w),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: TextView(
                  text: 'ID: MED-RUBY-001',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 15.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.infoGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        TextView(
          text: 'Individual Basic Plan',
          textStyle: TextStyle(
            fontFamily: 'GoogleSans',
            fontSize: 17.2.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.reminder,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Start Date',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 13.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                TextView(
                  text: '2023-12-10',
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 15.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.thickGrey,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'End Date',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 13.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),
                TextView(
                  text: '2023-12-10',
                  textStyle: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 15.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.thickGrey,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Amonut',
                  textStyle: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 13.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.infoGrey,
                  ),
                ),

                TextView(
                  text: '₦65,000',
                  textStyle: TextStyle(
                    fontSize: 15.8.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.thickGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.w),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: AppColors.grey,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImage.infinity_arrow,
                color: AppColors.infoGrey,
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 10.w),
              TextView(
                text: 'Renew Subscription',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15.8.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.infoGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
