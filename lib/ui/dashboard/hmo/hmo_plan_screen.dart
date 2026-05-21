// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../core/app_assets/image.dart';
import '../../../core/config/colors.dart';
import '../../../core/connect_end/model/get_my_hmo_plan_response_model/plan.dart';
import '../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../../core/core_folder/app/app.router.dart';
import '../../../main.dart';
import '../../widget/text.dart';
import '../../widget/text_form_widget.dart';

class HmoPlanScreen extends StatefulWidget {
  const HmoPlanScreen({super.key});

  @override
  State<HmoPlanScreen> createState() => _HmoPlanScreenState();
}

// make value a class variable so you can pass the index of the plan to hide and unhide
Plan? isHmo;

class _HmoPlanScreenState extends State<HmoPlanScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) async {
        await model.getMyPlan(context);
        await model.getListedPlanTypesForHMO(context);
        await model.getListedPlanTiersForHMO(context);
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
                    text: 'HMO Plans',
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
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Your Plans',
                          textStyle: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 18.2.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.reminder,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 210.w,
                          child: TextView(
                            text:
                                'Create and manage your HMO subscription plans',
                            maxLines: 2,
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 15.20.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.reminder,
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        final result = await navigate.navigateTo(
                          Routes.createHmoPlan,
                        );
                        if (result == true) {
                          await model.getMyPlan(context);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 20.0.sp,
                              weight: 10,
                            ),
                            SizedBox(width: 3.6.w),
                            TextView(
                              text: 'Create Plan',
                              textStyle: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14.82.sp,
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
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    hmoPlanWidget(
                      count: '17',
                      svg: AppImage.hmo_shield,
                      text: 'All Plans',
                      svgColor: AppColors.lightBlue,
                    ),
                    SizedBox(width: 10.w),
                    hmoPlanWidget(
                      count: '15',
                      svg: AppImage.hmo_shield,
                      text: 'Pending Review',
                      svgColor: AppColors.yellow,
                    ),
                  ],
                ),
                SizedBox(height: 14.20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    hmoPlanWidget(
                      count: '10',
                      svg: AppImage.hmo_shield,
                      text: 'Active Plans',
                      svgColor: AppColors.app_green,
                    ),
                    SizedBox(width: 10.w),
                    hmoPlanWidget(
                      count: '5',
                      svg: AppImage.hmo_shield,
                      text: 'Reject plans',
                      svgColor: AppColors.red,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
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
                      TextFormWidget(
                        label: 'Search Plan',
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
                          model.searchHmoPlanName = value;
                          model.notifyListeners();
                        },
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PopupMenuButton<String>(
                              position: PopupMenuPosition.under,
                              offset: Offset(50, 10),
                              color: AppColors.white,
                              onSelected: (value) async {
                                model.filterPlanTypes = value;
                                model.groupByPlanType(context, model, value);
                                model.notifyListeners();
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(14.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.grey),
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        TextView(
                                          text: 'Type: ',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.82.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: TextView(
                                            text: model.filterPlanTypes,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.fade,
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.60.sp,
                                              color: AppColors.infoGrey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(AppImage.arrow_down),
                                  ],
                                ),
                              ),

                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: () {
                                    model.filterPlanTypes = 'All';
                                    model.notifyListeners();
                                  },
                                  value: "All",
                                  child: TextView(
                                    text: "All",
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 13.70.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                if (model.getAllListedPlanTypesResponseModel !=
                                        null &&
                                    model
                                            .getAllListedPlanTypesResponseModel!
                                            .data !=
                                        null &&
                                    model
                                        .getAllListedPlanTypesResponseModel!
                                        .data!
                                        .planTypes!
                                        .isNotEmpty)
                                  ...model
                                      .getAllListedPlanTypesResponseModel!
                                      .data!
                                      .planTypes!
                                      .map(
                                        (e) => PopupMenuItem(
                                          value: e.name!,
                                          child: TextView(
                                            text: e.name ?? "",
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 13.70.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: PopupMenuButton<String>(
                              position: PopupMenuPosition.under,
                              offset: Offset(50, 10),
                              color: AppColors.white,
                              onSelected: (value) async {
                                model.filterPlanTiers = value;
                                model.groupByPlanTiers(context, model, value);
                                model.notifyListeners();
                              },

                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: () {
                                    model.filterPlanTiers = 'All';
                                    model.notifyListeners();
                                  },
                                  value: "All",
                                  child: TextView(
                                    text: "All",
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 13.70.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                if (model.getAllListedPlanTiersResponseModel !=
                                        null &&
                                    model
                                            .getAllListedPlanTiersResponseModel!
                                            .data !=
                                        null &&
                                    model
                                        .getAllListedPlanTiersResponseModel!
                                        .data!
                                        .planTiers!
                                        .isNotEmpty)
                                  ...model
                                      .getAllListedPlanTiersResponseModel!
                                      .data!
                                      .planTiers!
                                      .map(
                                        (e) => PopupMenuItem(
                                          value: e.name!,
                                          child: TextView(
                                            text: e.name ?? "",
                                            textStyle: TextStyle(
                                              fontFamily: 'GoogleSans',
                                              fontSize: 13.70.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                              ],

                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(14.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.grey),
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        TextView(
                                          text: 'Tier: ',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.82.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: TextView(
                                            text: model.filterPlanTiers,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.fade,
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 14.60.sp,
                                              color: AppColors.infoGrey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(width: 40.w),
                                    SvgPicture.asset(AppImage.arrow_down),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      if (model.getMyHmoPlanResponseModel == null)
                        const Center(child: CircularProgressIndicator())
                      else if (model.getMyHmoPlanResponseModel?.data?.plans ==
                              null ||
                          model.getMyHmoPlanResponseModel!.data!.plans!.isEmpty)
                        Center(
                          child: Text(
                            'No plans available',
                            style: TextStyle(
                              color: AppColors.fineGrey,
                              fontFamily: 'GoogleSans',
                              fontSize: 16.2.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      else if (model.searchHmoPlanName != '')
                        ...model.getMyHmoPlanResponseModelList!.data!.plans!
                            .where(
                              (w) => w.planName!.toLowerCase().contains(
                                model.searchHmoPlanName.toLowerCase(),
                              ),
                            )
                            .map(
                              (e) => GestureDetector(
                                onTap: () async {
                                  final result = await navigate.navigateTo(
                                    Routes.createHmoPlan,
                                    arguments: CreateHmoPlanArguments(
                                      isEdited: false,
                                      plan: e,
                                    ),
                                  );
                                  if (result == true) {
                                    await model.getMyPlan(context);
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10.w),
                                  margin: EdgeInsets.only(bottom: 13.20.w),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(8.0.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                              vertical: 2.2.h,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(22.r),
                                              border: Border.all(
                                                color:
                                                    e.approvalStatus
                                                            ?.toLowerCase() ==
                                                        'pending'
                                                    ? AppColors.yellow
                                                    : AppColors.app_green,
                                              ),
                                            ),
                                            child: TextView(
                                              text: '${e.approvalStatus}',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 14.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    e.approvalStatus
                                                            ?.toLowerCase() ==
                                                        'pending'
                                                    ? AppColors.yellow
                                                    : AppColors.app_green,
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
                                              borderRadius:
                                                  BorderRadius.circular(22.r),
                                              color: hexToColor(
                                                '${e.planTierSecondaryColor?.substring(0)}',
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                TextView(
                                                  text: '${e.planTier}',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'GoogleSans',
                                                    fontSize: 14.2.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: hexToColor(
                                                      '${e.planTierPrimaryColor?.substring(0)}',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () => setState(() {
                                              if (isHmo == e) {
                                                isHmo = null;
                                              } else {
                                                isHmo = e;
                                              }
                                            }),
                                            child: TextView(
                                              text: isHmo == e
                                                  ? 'Show more'
                                                  : 'Hide',
                                              textStyle: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 14.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color: isHmo == e
                                                    ? AppColors.fineGrey
                                                    : AppColors.primary,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: isHmo == e
                                                    ? AppColors.fineGrey
                                                    : AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      TextView(
                                        text: '${e.planName}',
                                        textStyle: TextStyle(
                                          fontFamily: 'GoogleSans',
                                          fontSize: 16.52.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'Renewal Price',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.fineGrey,
                                                ),
                                              ),
                                              SizedBox(height: 4.10.h),
                                              TextView(
                                                text: formatNairaNoDecimal(
                                                  e.price!,
                                                ),
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.thickGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 40.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'Renewal Price',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.fineGrey,
                                                ),
                                              ),
                                              SizedBox(height: 4.10.h),
                                              TextView(
                                                text: formatNairaNoDecimal(
                                                  e.price!,
                                                ),
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.thickGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'Duration',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.fineGrey,
                                                ),
                                              ),
                                              SizedBox(height: 4.10.h),
                                              TextView(
                                                text: model.getDurationAmount(
                                                  e.duration,
                                                ),
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.thickGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 80.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'Max Dependent',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.fineGrey,
                                                ),
                                              ),
                                              SizedBox(height: 4.10.h),
                                              TextView(
                                                text:
                                                    e.maximumDependents != null
                                                    ? '${e.maximumDependents}'
                                                    : 'No Dependent',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 15.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.thickGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: isHmo == e ? 15.20.h : 0.h,
                                      ),
                                      isHmo == e
                                          ? Column(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 16.w,
                                                    horizontal: 12.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.skyBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.r,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          AppColors.cool_blue,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextView(
                                                        text:
                                                            'Basic individual health coverage',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.52.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                      SizedBox(height: 14.20.h),
                                                      ...e.benefits!.map(
                                                        (ben) => Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                  AppImage
                                                                      .light_check,
                                                                ),
                                                                SizedBox(
                                                                  width: 8.10.w,
                                                                ),
                                                                TextView(
                                                                  text:
                                                                      ben.description ??
                                                                      '',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontSize:
                                                                        14.52
                                                                            .sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 4.10.w,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        12.w,
                                                                    vertical:
                                                                        2.2.h,
                                                                  ),
                                                              margin:
                                                                  EdgeInsets.only(
                                                                    left:
                                                                        13.90.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      22.r,
                                                                    ),
                                                                color: AppColors
                                                                    .white,
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .fineGrey
                                                                      .withOpacity(
                                                                        .3,
                                                                      ),
                                                                ),
                                                              ),
                                                              child: TextView(
                                                                text:
                                                                    ben.coverageLimit ??
                                                                    '',
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontSize:
                                                                      13.2.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .reminder,
                                                                ),
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: 12.20.h,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20.h),

                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 16.w,
                                                    horizontal: 12.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.skyBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.r,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          AppColors.cool_blue,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextView(
                                                        text:
                                                            'Hospital Networks',
                                                        textStyle: TextStyle(
                                                          fontFamily: 'Arial',
                                                          fontSize: 14.52.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .reminder,
                                                        ),
                                                      ),
                                                      SizedBox(height: 14.20.h),
                                                      ViewModelBuilder<
                                                        HMOViewModel
                                                      >.reactive(
                                                        viewModelBuilder: () =>
                                                            locator<
                                                              HMOViewModel
                                                            >(),
                                                        onViewModelReady:
                                                            (model) async {
                                                              model
                                                                  .getPlanHospitalNetworkByPlanId(
                                                                    context:
                                                                        context,
                                                                    planId:
                                                                        e.id!,
                                                                  );
                                                            },
                                                        disposeViewModel: false,
                                                        builder: (_, HMOViewModel model, _) {
                                                          return Wrap(
                                                            spacing: 10.0,
                                                            runSpacing: 8.0,
                                                            children: [
                                                              if (model.getPlanHospitalNetworkResponseModel !=
                                                                      null &&
                                                                  model
                                                                      .getPlanHospitalNetworkResponseModel!
                                                                      .data!
                                                                      .hospitals!
                                                                      .isNotEmpty)
                                                                ...model.getPlanHospitalNetworkResponseModel!.data!.hospitals!.map(
                                                                  (
                                                                    o,
                                                                  ) => IntrinsicWidth(
                                                                    child: Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            12.w,
                                                                        vertical:
                                                                            2.2.h,
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              22.r,
                                                                            ),
                                                                        border: Border.all(
                                                                          color:
                                                                              AppColors.primary,
                                                                        ),
                                                                      ),
                                                                      child: TextView(
                                                                        text:
                                                                            o.state ??
                                                                            "",
                                                                        textStyle: TextStyle(
                                                                          fontFamily:
                                                                              'Arial',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color:
                                                                              AppColors.primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                      SizedBox(height: 20.w),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                            )
                      else
                        ...model.getMyHmoPlanResponseModel!.data!.plans!.map(
                          (e) => GestureDetector(
                            onTap: () async {
                              final result = await navigate.navigateTo(
                                Routes.createHmoPlan,
                                arguments: CreateHmoPlanArguments(
                                  isEdited: false,
                                  plan: e,
                                ),
                              );
                              if (result == true) {
                                await model.getMyPlan(context);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10.w),
                              margin: EdgeInsets.only(bottom: 13.20.w),
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
                                            color:
                                                e.approvalStatus
                                                        ?.toLowerCase() ==
                                                    'pending'
                                                ? AppColors.yellow
                                                : AppColors.app_green,
                                          ),
                                        ),
                                        child: TextView(
                                          text: '${e.approvalStatus}',
                                          textStyle: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 14.2.sp,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                e.approvalStatus
                                                        ?.toLowerCase() ==
                                                    'pending'
                                                ? AppColors.yellow
                                                : AppColors.app_green,
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
                                          color: hexToColor(
                                            '${e.planTierSecondaryColor?.substring(0)}',
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextView(
                                              text: '${e.planTier}',
                                              textStyle: TextStyle(
                                                fontFamily: 'GoogleSans',
                                                fontSize: 14.2.sp,
                                                fontWeight: FontWeight.w500,
                                                color: hexToColor(
                                                  '${e.planTierPrimaryColor?.substring(0)}',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () => setState(() {
                                          if (isHmo == e) {
                                            isHmo = null;
                                          } else {
                                            isHmo = e;
                                          }
                                        }),
                                        child: TextView(
                                          text: isHmo == e
                                              ? 'Hide'
                                              : 'Show more',
                                          textStyle: TextStyle(
                                            fontFamily: 'Arial',
                                            fontSize: 14.2.sp,
                                            fontWeight: FontWeight.w500,
                                            color: isHmo == e
                                                ? AppColors.fineGrey
                                                : AppColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: isHmo == e
                                                ? AppColors.fineGrey
                                                : AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  TextView(
                                    text: '${e.planName}',
                                    textStyle: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 16.52.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.reminder,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Renewal Price',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(height: 4.10.h),
                                          TextView(
                                            text: formatNairaNoDecimal(
                                              e.renewalPrice!,
                                            ),
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.thickGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 40.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Price',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(height: 4.10.h),
                                          TextView(
                                            text: formatNairaNoDecimal(
                                              e.price!,
                                            ),
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.thickGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Duration',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(height: 4.10.h),
                                          TextView(
                                            text: model.getDurationAmount(
                                              e.duration,
                                            ),
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.thickGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 80.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Max Dependent',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.fineGrey,
                                            ),
                                          ),
                                          SizedBox(height: 4.10.h),
                                          TextView(
                                            text: e.maximumDependents != null
                                                ? '${e.maximumDependents}'
                                                : 'No Dependent',
                                            textStyle: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.thickGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: isHmo == e ? 15.20.h : 0.h),
                                  isHmo == e
                                      ? Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 16.w,
                                                horizontal: 12.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.skyBlue,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                border: Border.all(
                                                  color: AppColors.cool_blue,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text:
                                                        'Basic individual health coverage',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.52.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.reminder,
                                                    ),
                                                  ),
                                                  SizedBox(height: 14.20.h),
                                                  ...e.benefits!.map(
                                                    (ben) => Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              AppImage
                                                                  .light_check,
                                                            ),
                                                            SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                            TextView(
                                                              text:
                                                                  ben.description ??
                                                                  '',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize:
                                                                    14.52.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .reminder,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 4.10.w,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                horizontal:
                                                                    12.w,
                                                                vertical: 2.2.h,
                                                              ),
                                                          margin:
                                                              EdgeInsets.only(
                                                                left: 13.90.w,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  22.r,
                                                                ),
                                                            color:
                                                                AppColors.white,
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .fineGrey
                                                                  .withOpacity(
                                                                    .3,
                                                                  ),
                                                            ),
                                                          ),
                                                          child: TextView(
                                                            text:
                                                                ben.coverageLimit ??
                                                                '',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'Arial',
                                                              fontSize: 13.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                        ),

                                                        SizedBox(
                                                          height: 12.20.h,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20.h),

                                            Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 16.w,
                                                horizontal: 12.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.skyBlue,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                border: Border.all(
                                                  color: AppColors.cool_blue,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text: 'Hospital Networks',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.52.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.reminder,
                                                    ),
                                                  ),
                                                  SizedBox(height: 14.20.h),
                                                  ViewModelBuilder<
                                                    HMOViewModel
                                                  >.reactive(
                                                    viewModelBuilder: () =>
                                                        locator<HMOViewModel>(),
                                                    onViewModelReady:
                                                        (model) async {
                                                          model
                                                              .getPlanHospitalNetworkByPlanId(
                                                                context:
                                                                    context,
                                                                planId: e.id!,
                                                              );
                                                        },
                                                    disposeViewModel: false,
                                                    builder: (_, HMOViewModel model, _) {
                                                      return Wrap(
                                                        spacing: 10.0,
                                                        runSpacing: 8.0,
                                                        children: [
                                                          if (model.getPlanHospitalNetworkResponseModel !=
                                                                  null &&
                                                              model
                                                                  .getPlanHospitalNetworkResponseModel!
                                                                  .data!
                                                                  .hospitals!
                                                                  .isNotEmpty)
                                                            ...model.getPlanHospitalNetworkResponseModel!.data!.hospitals!.map(
                                                              (
                                                                o,
                                                              ) => IntrinsicWidth(
                                                                child: Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        12.w,
                                                                    vertical:
                                                                        2.2.h,
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          22.r,
                                                                        ),
                                                                    border: Border.all(
                                                                      color: AppColors
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                  child: TextView(
                                                                    text:
                                                                        o.state ??
                                                                        "",
                                                                    textStyle: TextStyle(
                                                                      fontFamily:
                                                                          'Arial',
                                                                      fontSize:
                                                                          14.2.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          SizedBox(width: 10.w),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(height: 20.w),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
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

  Widget hmoPlanWidget({
    String? text,
    String? svg,
    String? count,
    Color? svgColor,
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
          TextView(
            text: text!,
            textStyle: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.reminder,
            ),
          ),
          SizedBox(height: 10.w),
          Row(
            children: [
              SvgPicture.asset(
                svg!,
                width: 20.w,
                height: 20.h,
                color: svgColor,
              ),
              SizedBox(width: 6.10.w),
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
