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
  HmoPlanTiersManagementScreen({super.key});

  List<HmoTeirEntity> listOfTier = [
    HmoTeirEntity(
      name: 'Ruby',
      tierColor: AppColors.appRed,
      tierBackgroundColor: AppColors.faintedRed,
    ),
    HmoTeirEntity(
      name: 'Pearl',
      tierColor: AppColors.lightBlue,
      tierBackgroundColor: AppColors.faintedBlue,
    ),
    HmoTeirEntity(
      name: 'Diamond',
      tierColor: AppColors.purple,
      tierBackgroundColor: AppColors.faintedPurple,
    ),
  ];

  List<String> lsitOfTiersFuture = ['General Consultation','Essential medications','Standard hospital network'];
  var hasManyItems;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    hasManyItems = listOfTier.length > 5;

    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => locator<HMOViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {});
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
                              listOfTier
                                      .isEmpty
                              ? Column(
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
                                    SizedBox(height: 26.0.h),
                                    GestureDetector(
                                      onTap: () async {
                                        bool? didAddOrEdit = await model
                                            .modalBottomSheetMenuAddRole(
                                              context: context,
                                            );
                                        if (didAddOrEdit == true) {
                                          await Future.delayed(
                                            Duration(seconds: 2),
                                          );
                                        } else {}
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.10.w),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primary,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.white,
                                          size: 24.30.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: EdgeInsets.all(22.0),
                                  child: Column(
                                    children: [
                                      TextFormWidget(
                                        // borderColor: AppColors.f1,
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
                                          model.searchRoles = p0;
                                          model.notifyListeners();
                                        },
                                      ),
                                      SizedBox(height: 20.h),
                                      if (listOfTier.isNotEmpty)
                                        if (model.searchRoles != '')
                                          ...listOfTier
                                              .where(
                                                (e) => e.name!
                                                    .toLowerCase()
                                                    .contains(
                                                      model.searchRoles
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
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        4.w,
                                                                    horizontal:
                                                                        12.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      22,
                                                                    ),
                                                                color: e
                                                                    .tierBackgroundColor,
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
                                                                  color: e
                                                                      .tierColor,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 6.10.h,
                                                            ),
                                                            Container(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    vertical:
                                                                        4.w,
                                                                    horizontal:
                                                                        12.w,
                                                                  ),
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      22,
                                                                    ),
                                                                border: Border.all(
                                                                  color: AppColors
                                                                      .infoGrey1,
                                                                ),
                                                              ),
                                                              child: TextView(
                                                                text:
                                                                    '12 Months',
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColors
                                                                      .reminder,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 40.h,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                model.hmoTeirEntity =
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
                                                              itemBuilder: (context) => [
                                                                PopupMenuItem(
                                                                  value:
                                                                      "Edit Tier",
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
                                                                  value:
                                                                      "Delete",
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
                                                        model.hmoTeirEntity == e
                                                            ? Container(
                                                                width: double
                                                                    .infinity,
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
                                                                          'Basic individual health coverage',
                                                                      textStyle: TextStyle(
                                                                        fontFamily:
                                                                            'Arial',
                                                                        fontSize:
                                                                            14.52.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          14.20
                                                                              .h,
                                                                    ),
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
                                                                              'General Consultation',
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
                                                                        SizedBox(
                                                                          width:
                                                                              6.90.w,
                                                                        ),
                                                                        Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                12.w,
                                                                            vertical:
                                                                                2.2.h,
                                                                          ),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                              22.r,
                                                                            ),
                                                                            color:
                                                                                AppColors.white,
                                                                            border: Border.all(
                                                                              color: AppColors.fineGrey.withOpacity(
                                                                                .3,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          child: TextView(
                                                                            text:
                                                                                'Unlimited',
                                                                            textStyle: TextStyle(
                                                                              fontFamily: 'Arial',
                                                                              fontSize: 13.2.sp,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: AppColors.reminder,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          14.20
                                                                              .h,
                                                                    ),
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
                                                                              'Emergency Care',
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
                                                                        SizedBox(
                                                                          width:
                                                                              3.90.w,
                                                                        ),
                                                                        Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                8.w,
                                                                            vertical:
                                                                                2.2.h,
                                                                          ),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(
                                                                              22.r,
                                                                            ),
                                                                            color:
                                                                                AppColors.white,
                                                                            border: Border.all(
                                                                              color: AppColors.fineGrey.withOpacity(
                                                                                .3,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          child: TextView(
                                                                            text:
                                                                                'Up to ₦500,000',
                                                                            textStyle: TextStyle(
                                                                              fontFamily: 'Arial',
                                                                              fontSize: 13.2.sp,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: AppColors.reminder,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            : SizedBox.shrink(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                        else
                                          ...listOfTier.map(
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
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
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
                                                            color: e
                                                                .tierBackgroundColor,
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
                                                              color:
                                                                  e.tierColor,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.10.h),
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
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .infoGrey1,
                                                            ),
                                                          ),
                                                          child: TextView(
                                                            text: '12 Months',
                                                            textStyle: TextStyle(
                                                              fontFamily:
                                                                  'GoogleSans',
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .reminder,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width:model.hmoTeirEntity == e?60.w: 40.w),
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (model
                                                                    .hmoTeirEntity !=
                                                                e) {
                                                              model.hmoTeirEntity =
                                                                  e;
                                                            } else {
                                                              model.hmoTeirEntity =
                                                                  null;
                                                            }
                                                            model
                                                                .notifyListeners();
                                                          },
                                                          child: TextView(
                                                            text:
                                                                model.hmoTeirEntity ==
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
                                                                  model.hmoTeirEntity ==
                                                                      e
                                                                  ? AppColors
                                                                        .primary
                                                                  : AppColors
                                                                        .fineGrey,

                                                              color:
                                                                  model.hmoTeirEntity ==
                                                                      e
                                                                  ? AppColors
                                                                        .primary
                                                                  : AppColors
                                                                        .fineGrey,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10.w),
                                                        PopupMenuButton<String>(
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
                                                          itemBuilder: (context) => [
                                                            PopupMenuItem(
                                                              value:
                                                                  "Edit Tier",
                                                              child: TextView(
                                                                text:
                                                                    'Edit Tier',
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      13.70.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                ),
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                              value: "Delete",
                                                              child: TextView(
                                                                text: 'Delete',
                                                                textStyle: TextStyle(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      13.70.sp,
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
                                                    model.hmoTeirEntity == e
                                                        ? Container(
                                                          margin: EdgeInsets.only(top: 20.w),
                                                            width:MediaQuery.of(context).size.width,
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
                                                               ...lsitOfTiersFuture.map((e)=>Column(crossAxisAlignment: CrossAxisAlignment.start,children: [ Row(
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
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      14.20.h,
                                                                ),
                                                               ],))
                                                               ],
                                                            ),
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
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: hasManyItems ? 24.h : screenHeight * .30),
                ButtonWidget(
                  border: 100.r,
                  buttonColor: AppColors.primary,
                  buttonText: 'Create Plan Tier',
                  fontSize: 16.8.sp,
                  color: AppColors.white,
                  isLoading: model.isLoading,
                  buttonBorderColor: AppColors.transparent,
                  onPressed: () => navigate.navigateTo(Routes.hmoCreateTiersPlanManagementScreen),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HmoTeirEntity {
  String? name;
  Color? tierColor;
  Color? tierBackgroundColor;

  HmoTeirEntity({this.name, this.tierColor, this.tierBackgroundColor});
}
