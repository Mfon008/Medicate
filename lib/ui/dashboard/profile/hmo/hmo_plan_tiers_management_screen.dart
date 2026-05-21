// ignore_for_file: must_be_immutable, use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/core_folder/app/app.router.dart';
import 'package:medicate_app/main.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app_assets/image.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/button.dart';
import '../../../widget/text.dart';
import '../../../widget/text_form_widget.dart';

class HmoPlanTiersManagementScreen extends StatelessWidget {
  const HmoPlanTiersManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getListedPlanTiersForHMO(context);
        });
      },
      disposeViewModel: false,
      builder: (_, HMOViewModel model, _) {
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
              text: 'Plan Management',
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
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 200.h,
                    maxHeight: MediaQuery.of(context).size.height * .68,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        // model.getRoles(context);
                      },
                      child: SizedBox(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(vertical: 20.w),
                          child:
                              model.getAllListedPlanTiersResponseModel !=
                                      null &&
                                  model
                                          .getAllListedPlanTiersResponseModel!
                                          .data ==
                                      null
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppImage.no_user_data),
                                      SizedBox(height: 20.h),
                                      TextView(
                                        text: 'Create a Tier',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 15.2.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.reminder,
                                        ),
                                      ),
                                      SizedBox(height: 4.20.h),
                                      TextView(
                                        text:
                                            'Tap on the plus button to create one',
                                        textStyle: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 13.2.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.faintedGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(22.0),
                                  child: Column(
                                    children: [
                                      TextFormWidget(
                                        borderTopLeft: 10.r,
                                        borderTopRight: 10.r,
                                        borderBottomLeft: 10.r,
                                        borderBottomRight: 10.r,
                                        label: 'Search Tier',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          fontSize: 15.2.sp,
                                          color: AppColors.infoGrey,
                                        ),
                                        fillColor: AppColors.grey,
                                        isFilled: true,
                                        prefixWidget: Padding(
                                          padding: EdgeInsets.all(12.4.w),
                                          child: SvgPicture.asset(
                                            AppImage.search,
                                            height: 20.h,
                                            width: 20.w,
                                            color: AppColors.grey1,
                                          ),
                                        ),
                                        onChange: (p0) {
                                          model.searchedPlansTiers = p0;
                                          model.notifyListeners();
                                        },
                                      ),
                                      SizedBox(height: 20.h),
                                      if (model.getAllListedPlanTiersResponseModel !=
                                              null &&
                                          model
                                              .getAllListedPlanTiersResponseModel!
                                              .data!
                                              .planTiers!
                                              .isNotEmpty)
                                        if (model.searchedPlansTiers != '')
                                          ...model
                                              .getAllListedPlanTiersResponseModel!
                                              .data!
                                              .planTiers!
                                              .where(
                                                (e) => e.name!
                                                    .toLowerCase()
                                                    .contains(
                                                      model.searchedPlansTiers
                                                          .toLowerCase(),
                                                    ),
                                              )
                                              .map(
                                                (e) => Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 14.w,
                                                    horizontal: 12.w,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                    bottom: 10.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          AppColors.infoGrey1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  vertical: 4.w,
                                                                  horizontal:
                                                                      12.w,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    22,
                                                                  ),
                                                              color: hexToColor(
                                                                e.secondaryColor,
                                                              ),
                                                            ),
                                                            child: TextView(
                                                              text: e.name!,
                                                              maxLines: 1,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'GoogleSans',
                                                                fontSize:
                                                                    14.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: hexToColor(
                                                                  e.primaryColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  model.planTiers =
                                                                      e;
                                                                  model
                                                                      .notifyListeners();
                                                                },
                                                                child: TextView(
                                                                  text:
                                                                      'Show more',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                    decorationColor:
                                                                        AppColors
                                                                            .fineGrey,

                                                                    color: AppColors
                                                                        .fineGrey,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 6.10.h,
                                                              ),
                                                              PopupMenuButton<
                                                                String
                                                              >(
                                                                color: AppColors
                                                                    .white,
                                                                onSelected:
                                                                    (value) {},
                                                                child: Container(
                                                                  padding:
                                                                      EdgeInsets.all(
                                                                        2.w,
                                                                      ),
                                                                  decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: AppColors
                                                                        .cool_blue
                                                                        .withOpacity(
                                                                          .4,
                                                                        ),
                                                                    border: Border.all(
                                                                      color: AppColors
                                                                          .primaryLight
                                                                          .withOpacity(
                                                                            .2,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    color: AppColors
                                                                        .primary1,
                                                                  ),
                                                                ),
                                                                itemBuilder: (_) => [
                                                                  PopupMenuItem(
                                                                    value:
                                                                        "Edit Tier",
                                                                    onTap: () async {
                                                                      final result = await navigate.navigateTo(
                                                                        Routes
                                                                            .hmoCreateTiersPlanManagementScreen,
                                                                        arguments: HmoCreateTiersPlanManagementScreenArguments(
                                                                          isEditing:
                                                                              true,
                                                                          editedPlanTier:
                                                                              e,
                                                                        ),
                                                                      );
                                                                      if (result ==
                                                                          true) {
                                                                        await model.getListedPlanTiersForHMO(
                                                                          context,
                                                                        );
                                                                      }
                                                                    },
                                                                    child: TextView(
                                                                      text:
                                                                          'Edit Tier',
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'GoogleSans',
                                                                        fontSize:
                                                                            13.70.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: AppColors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  PopupMenuItem(
                                                                    value:
                                                                        "Delete",
                                                                    onTap: () {
                                                                      model.deletePlanTierDialog(
                                                                        context:
                                                                            context,
                                                                        planTierId:
                                                                            e.id,
                                                                      );
                                                                    },
                                                                    child: TextView(
                                                                      text:
                                                                          'Delete',
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'GoogleSans',
                                                                        fontSize:
                                                                            13.70.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      model.planTiers == e
                                                          ? Container(
                                                              margin:
                                                                  EdgeInsets.only(
                                                                    top: 20.w,
                                                                  ),
                                                              width:
                                                                  MediaQuery.of(
                                                                    context,
                                                                  ).size.width,
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        16.w,
                                                                    horizontal:
                                                                        12.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .skyBlue,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      8.r,
                                                                    ),
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .cool_blue,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  TextView(
                                                                    text:
                                                                        'Tier Features',
                                                                    textStyle: TextStyle(
                                                                      fontFamily:
                                                                          'GooogleSans',
                                                                      fontSize:
                                                                          14.52
                                                                              .sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: AppColors
                                                                          .reminder,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        14.20.h,
                                                                  ),
                                                                  ...e.features!.map(
                                                                    (
                                                                      e,
                                                                    ) => Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            SvgPicture.asset(
                                                                              AppImage.light_check,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 8.10.w,
                                                                            ),
                                                                            TextView(
                                                                              text: e,
                                                                              textStyle: TextStyle(
                                                                                fontFamily: 'Arial',
                                                                                fontSize: 14.52.sp,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: AppColors.reminder,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              14.20.h,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : SizedBox.shrink(),
                                                    ],
                                                  ),
                                                ),
                                              )
                                        else
                                          ...model.getAllListedPlanTiersResponseModel!.data!.planTiers!.map(
                                            (e) => Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 14.w,
                                                horizontal: 12.w,
                                              ),
                                              margin: EdgeInsets.only(
                                                bottom: 10.w,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: AppColors.infoGrey1,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints(
                                                              maxWidth: 160.w,
                                                            ),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 4.w,
                                                                horizontal:
                                                                    12.w,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  22,
                                                                ),
                                                            color: hexToColor(
                                                              e.secondaryColor,
                                                            ),
                                                          ),
                                                          child: TextView(
                                                            text: e.name!,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'GoogleSans',
                                                              fontSize: 14.2.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: hexToColor(
                                                                e.primaryColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (model
                                                                      .planTiers !=
                                                                  e) {
                                                                model.planTiers =
                                                                    e;
                                                              } else {
                                                                model.planTiers =
                                                                    null;
                                                              }
                                                              model
                                                                  .notifyListeners();
                                                            },
                                                            child: TextView(
                                                              text:
                                                                  model.planTiers ==
                                                                      e
                                                                  ? 'Hide'
                                                                  : 'Show more',
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                decorationColor:
                                                                    model.planTiers ==
                                                                        e
                                                                    ? AppColors
                                                                          .primary
                                                                    : AppColors
                                                                          .fineGrey,

                                                                color:
                                                                    model.planTiers ==
                                                                        e
                                                                    ? AppColors
                                                                          .primary
                                                                    : AppColors
                                                                          .fineGrey,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10.w),
                                                          PopupMenuButton<
                                                            String
                                                          >(
                                                            color:
                                                                AppColors.white,
                                                            onSelected:
                                                                (value) {},
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    2.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .cool_blue
                                                                    .withOpacity(
                                                                      .4,
                                                                    ),
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .primaryLight
                                                                      .withOpacity(
                                                                        .2,
                                                                      ),
                                                                ),
                                                              ),
                                                              child: Icon(
                                                                Icons.more_vert,
                                                                color: AppColors
                                                                    .primary1,
                                                              ),
                                                            ),
                                                            itemBuilder: (_) => [
                                                              PopupMenuItem(
                                                                value:
                                                                    "Edit Tier",
                                                                onTap: () async {
                                                                  final result = await navigate.navigateTo(
                                                                    Routes
                                                                        .hmoCreateTiersPlanManagementScreen,
                                                                    arguments: HmoCreateTiersPlanManagementScreenArguments(
                                                                      isEditing:
                                                                          true,
                                                                      editedPlanTier:
                                                                          e,
                                                                    ),
                                                                  );
                                                                  if (result ==
                                                                      true) {
                                                                    await model
                                                                        .getListedPlanTiersForHMO(
                                                                          context,
                                                                        );
                                                                  }
                                                                },
                                                                child: TextView(
                                                                  text:
                                                                      'Edit Tier',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'GoogleSans',
                                                                    fontSize:
                                                                        13.70
                                                                            .sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ),
                                                              PopupMenuItem(
                                                                value: "Delete",
                                                                onTap: () {
                                                                  model.deletePlanTierDialog(
                                                                    context:
                                                                        context,
                                                                    planTierId:
                                                                        e.id,
                                                                  );
                                                                },
                                                                child: TextView(
                                                                  text:
                                                                      'Delete',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'GoogleSans',
                                                                    fontSize:
                                                                        13.70
                                                                            .sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  model.planTiers == e
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                top: 20.w,
                                                              ),
                                                          width: MediaQuery.of(
                                                            context,
                                                          ).size.width,
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                vertical: 16.w,
                                                                horizontal:
                                                                    12.w,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color: AppColors
                                                                .skyBlue,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  8.r,
                                                                ),
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .cool_blue,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              TextView(
                                                                text:
                                                                    'Tier Features',
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'GooogleSans',
                                                                  fontSize:
                                                                      14.52.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: AppColors
                                                                      .reminder,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 14.20.h,
                                                              ),
                                                              ...e.features!.map(
                                                                (e) => Column(
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
                                                                          width:
                                                                              8.10.w,
                                                                        ),
                                                                        TextView(
                                                                          text:
                                                                              e,
                                                                          textStyle: TextStyle(
                                                                            fontFamily:
                                                                                'Arial',
                                                                            fontSize:
                                                                                14.52.sp,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                AppColors.reminder,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          14.20
                                                                              .h,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : SizedBox.shrink(),
                                                ],
                                              ),
                                            ),
                                          ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70),
                ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.primary,
                  buttonText: 'Create Plan Tier',
                  fontSize: 16.8.sp,
                  color: AppColors.white,
                  isLoading: model.isLoading,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () async {
                    final result = await navigate.navigateTo(
                      Routes.hmoCreateTiersPlanManagementScreen,
                    );
                    if (result == true) {
                      await model.getListedPlanTiersForHMO(context);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
