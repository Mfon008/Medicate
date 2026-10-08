// ignore_for_file: must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/app_assets/app_validation.dart';
import '../../../../../core/connect_end/model/update_hmo_kyc_third_level_entity_model/application_form.dart';
import '../../../../../core/connect_end/model/update_hmo_kyc_third_level_entity_model/list_of_hospitals.dart';
import '../../../../../core/connect_end/model/update_hmo_kyc_third_level_entity_model/schedule_of_plans.dart';
import '../../../../../core/connect_end/model/update_hmo_kyc_third_level_entity_model/update_hmo_kyc_third_level_entity_model.dart';
import '../../../../../core/connect_end/view_model/hmo_view_model.dart';
import '../../../../widget/button.dart';
import '../../../../widget/kyc_url_view.dart';
import '../../../../widget/text_form_widget.dart';
import '../../manufacture/dashed_border_painter.dart';

class LevelThreeCard extends StatefulWidget {
  LevelThreeCard({super.key, this.model});

  HMOViewModel? model;

  @override
  State<LevelThreeCard> createState() => _LevelThreeCardState();
}

class _LevelThreeCardState extends State<LevelThreeCard> {
  bool isExpanded = false;
  bool isSwitched = false;

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankBVNController = TextEditingController();

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  void getKycBankInfo(HMOViewModel model) {
    bankNameController.text =
        model.getHmoKycResponseModel?.data?.level3?.bankInformation?.bankName ??
        '';
    accountNameController.text =
        model
            .getHmoKycResponseModel
            ?.data
            ?.level3
            ?.bankInformation
            ?.accountName ??
        '';
    accountNumberController.text =
        model
            .getHmoKycResponseModel
            ?.data
            ?.level3
            ?.bankInformation
            ?.accountNumber ??
        '';

    if (model.getHmoKycResponseModel != null &&
        model.getHmoKycResponseModel!.data!.level3 != null) {
      final level3 = model.getHmoKycResponseModel!.data!.level3;
      if (level3?.applicationForm != null) {
        model.thirdLevelHmoKycEntityModelAppForm!.applicationForm =
            ApplicationForm.fromJson(level3?.applicationForm?.toJson() ?? {});
      }

      if (level3?.scheduleOfPlans != null) {
        model.thirdLevelHmoKycEntityModelAvPlans!.scheduleOfPlans =
            ScheduleOfPlans.fromJson(level3?.scheduleOfPlans?.toJson() ?? {});
      }
      if (level3?.listOfHospitals != null) {
        model.thirdLevelHmoKycEntityModelAssClinic!.listOfHospitals =
            ListOfHospitals.fromJson(level3?.listOfHospitals?.toJson() ?? {});
      }
    }
    setState(() {});
    model.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HMOViewModel>.reactive(
      viewModelBuilder: () => HMOViewModel(),
      onViewModelReady: (model) async {
        await model.getHMOKyc(context);
        getKycBankInfo(model);
      },
      disposeViewModel: false,
      builder: (_, HMOViewModel model, _) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: CustomPaint(
            painter: DashedBorderPainter(
              color: !isExpanded ? AppColors.transparent : AppColors.primary1,
              strokeWidth: 1.90,
              dashWidth: 4,
              dashSpace: 0,
              radius: 16.r,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: Container(
                  color: AppColors.f1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ==========================================
                      // HEADER
                      // ==========================================
                      InkWell(
                        onTap: () {
                          if (widget
                                  .model!
                                  .getHmoKycResponseModel!
                                  .data!
                                  .kycLevels![1]
                                  .status
                                  ?.toLowerCase() ==
                              'approved') {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 13.h,
                          ),
                          color: AppColors.f1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget
                                          .model!
                                          .getHmoKycResponseModel
                                          ?.data
                                          ?.kycLevels?[2]
                                          .status
                                          ?.toLowerCase() ==
                                      'approved'
                                  ? Container(
                                      width: 14.w,
                                      height: 14.w,
                                      margin: EdgeInsets.only(top: 1.h),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF58C58A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 9.sp,
                                        color: Colors.white,
                                      ),
                                    )
                                  : !isExpanded
                                  ? SvgPicture.asset(AppImage.locked_padlock)
                                  : SvgPicture.asset(AppImage.open_padlock),

                              SizedBox(width: 8.w),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Level 3',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          widget
                                                      .model!
                                                      .getHmoKycResponseModel !=
                                                  null &&
                                              widget
                                                      .model!
                                                      .getHmoKycResponseModel!
                                                      .data!
                                                      .kycLevels![1]
                                                      .status
                                                      ?.toLowerCase() ==
                                                  'approved'
                                          ? AppColors.reminder1
                                          : AppColors.infoGrey,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),

                                  SizedBox(height: 2.h),

                                  TextView(
                                    text: 'Settlement bank details',
                                    textStyle: TextStyle(
                                      fontSize: 13.22.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          widget
                                                      .model!
                                                      .getHmoKycResponseModel !=
                                                  null &&
                                              widget
                                                      .model!
                                                      .getHmoKycResponseModel!
                                                      .data!
                                                      .kycLevels![1]
                                                      .status
                                                      ?.toLowerCase() ==
                                                  'approved'
                                          ? AppColors.reminder1
                                          : AppColors.infoGrey,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),

                              AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 21.sp,
                                  color:
                                      widget.model!.getHmoKycResponseModel !=
                                              null &&
                                          widget
                                                  .model!
                                                  .getHmoKycResponseModel!
                                                  .data!
                                                  .kycLevels![1]
                                                  .status
                                                  ?.toLowerCase() ==
                                              'approved'
                                      ? AppColors.reminder1
                                      : AppColors.infoGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ==========================================
                      // EXPANDED CONTENT
                      // ==========================================
                      if (isExpanded)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 3.6.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.w,
                            horizontal: 18.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,

                            // Curved top corners
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12.h),

                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 16.20.w,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.f1),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 6.10.h),
                                      TextView(
                                        text: 'Bank Information',
                                        textStyle: TextStyle(
                                          fontSize: 15.06.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.reminder1,
                                          fontFamily: 'DMSans',
                                        ),
                                      ),

                                      SizedBox(height: 5.10.h),
                                      TextFormWidget(
                                        hint: 'Bank Name',
                                        label: '--Select--',
                                        rightPos: -14,
                                        hintSize: 14,
                                        readOnly: model.isNotReadable2,
                                        borderColor: AppColors.transparent,
                                        borderTopLeft: 10.r,
                                        borderTopRight: 10.r,
                                        borderBottomLeft: 10.r,
                                        borderBottomRight: 10.r,
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          fontSize: 14.2.sp,
                                          color: AppColors.infoGrey,
                                        ),
                                        fillColor: AppColors.grey,
                                        isFilled: true,
                                        suffixWidget: Padding(
                                          padding: EdgeInsets.all(14.w),
                                          child: SvgPicture.asset(
                                            AppImage.arrow_down,
                                            height: 8.0.h,
                                            width: 8.0.w,
                                          ),
                                        ),
                                        validator:
                                            AppValidator.validateString(),
                                        controller: bankNameController,
                                      ),
                                      SizedBox(height: 20.h),
                                      TextFormWidget(
                                        hint: 'Account Name',
                                        rightPos: -14,
                                        hintSize: 14,
                                        borderColor: AppColors.transparent,
                                        borderTopLeft: 10.r,
                                        readOnly: model.isNotReadable2,
                                        borderTopRight: 10.r,
                                        borderBottomLeft: 10.r,
                                        borderBottomRight: 10.r,
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          fontSize: 14.2.sp,
                                          color: AppColors.infoGrey,
                                        ),
                                        fillColor: AppColors.grey,
                                        isFilled: true,
                                        validator:
                                            AppValidator.validateString(),
                                        controller: accountNameController,
                                      ),
                                      SizedBox(height: 20.h),
                                      TextFormWidget(
                                        hint: 'Account Number',
                                        rightPos: -14,
                                        hintSize: 14,
                                        borderColor: AppColors.transparent,
                                        borderTopLeft: 10.r,
                                        borderTopRight: 10.r,
                                        readOnly: model.isNotReadable2,
                                        borderBottomLeft: 10.r,
                                        borderBottomRight: 10.r,
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Arial',
                                          fontSize: 14.2.sp,
                                          color: AppColors.infoGrey,
                                        ),
                                        fillColor: AppColors.grey,
                                        isFilled: true,
                                        validator:
                                            AppValidator.validateString(),
                                        controller: accountNumberController,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),

                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 16.20.w,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.f1),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 6.10.h),
                                          TextView(
                                            text: 'Process Documents',
                                            textStyle: TextStyle(
                                              fontSize: 15.06.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.reminder1,
                                              fontFamily: 'DMSans',
                                            ),
                                          ),

                                          SizedBox(height: 5.10.h),

                                          Divider(color: AppColors.f1),
                                          SizedBox(height: 10.6.h),
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              TextView(
                                                text: 'Application Form',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                              Positioned(
                                                right: -12.10,
                                                child: TextView(
                                                  text: '*',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          model
                                                              .getHmoKycResponseModel!
                                                              .data!
                                                              .level3 !=
                                                          null &&
                                                      model
                                                              .getHmoKycResponseModel!
                                                              .data!
                                                              .level3!
                                                              .applicationForm !=
                                                          null ||
                                                  model.thirdLevelHmoKycEntityModelAppForm !=
                                                          null &&
                                                      model
                                                              .thirdLevelHmoKycEntityModelAppForm!
                                                              .applicationForm !=
                                                          null
                                              ? Container(
                                                  padding: EdgeInsets.all(10.w),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          AppColors.tintColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.kyc_file,
                                                      ),
                                                      SizedBox(width: 14.20.w),
                                                      SizedBox(
                                                        width: 80.w,
                                                        child: TextView(
                                                          text:
                                                              'Application Form.jpg',
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 13.2.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      GestureDetector(
                                                        onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (_) => ImageWebViewScreen(
                                                              imageUrl:
                                                                  model
                                                                      .getHmoKycResponseModel
                                                                      ?.data
                                                                      ?.level3
                                                                      ?.applicationForm
                                                                      ?.url ??
                                                                  model
                                                                      .thirdLevelHmoKycEntityModelAppForm
                                                                      ?.applicationForm
                                                                      ?.url ??
                                                                  '',
                                                            ),
                                                          ),
                                                        ),
                                                        child: SvgPicture.asset(
                                                          AppImage.kyc_eye,
                                                        ),
                                                      ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : model
                                                                    .thirdLevelHmoKycEntityModelAppForm
                                                                    ?.applicationForm !=
                                                                null
                                                          ? GestureDetector(
                                                              onTap: () => model
                                                                  .pickImageAppForm(
                                                                    context,
                                                                  ),
                                                              child:
                                                                  model
                                                                      .isLoadingAppForm
                                                                  ? SizedBox(
                                                                      width:
                                                                          10.w,
                                                                      height:
                                                                          10.h,
                                                                      child: CircularProgressIndicator(
                                                                        color: AppColors
                                                                            .primary,
                                                                        strokeWidth:
                                                                            2.w,
                                                                      ),
                                                                    )
                                                                  : SvgPicture.asset(
                                                                      AppImage
                                                                          .upload_arr_up,
                                                                    ),
                                                            )
                                                          : SizedBox.shrink(),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : model
                                                                    .thirdLevelHmoKycEntityModelAppForm
                                                                    ?.applicationForm !=
                                                                null
                                                          ? GestureDetector(
                                                              onTap: () {
                                                                model
                                                                        .thirdLevelHmoKycEntityModelAppForm!
                                                                        .applicationForm =
                                                                    null;
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .delete,
                                                                  ),
                                                            )
                                                          : SizedBox.shrink(),
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () => model
                                                          .pickImageAppForm(
                                                            context,
                                                          ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            model.isLoadingAppForm
                                                                ? SizedBox(
                                                                    width: 20.w,
                                                                    height:
                                                                        20.h,
                                                                    child: CircularProgressIndicator(
                                                                      color: AppColors
                                                                          .primary,
                                                                      strokeWidth:
                                                                          2.w,
                                                                    ),
                                                                  )
                                                                : SvgPicture.asset(
                                                                    AppImage
                                                                        .upload_doc,
                                                                  ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextView(
                                                                  text:
                                                                      'Upload Document',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'GoogleSans',
                                                                    fontSize:
                                                                        14.2.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 130.w,
                                                                  child: TextView(
                                                                    text:
                                                                        'Max file size: 2MB (.jpg,'
                                                                        ' .jpeg, .png, or'
                                                                        ' .pdf supported)',
                                                                    textStyle: TextStyle(
                                                                      fontFamily:
                                                                          'Arial',
                                                                      fontSize:
                                                                          13.6.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                ),

                                          SizedBox(height: 20.6.h),
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              TextView(
                                                text:
                                                    'Schedule of available plans',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                              Positioned(
                                                right: -12.10,
                                                child: TextView(
                                                  text: '*',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          model
                                                              .getHmoKycResponseModel!
                                                              .data!
                                                              .level3 !=
                                                          null &&
                                                      model
                                                              .getHmoKycResponseModel!
                                                              .data!
                                                              .level3!
                                                              .scheduleOfPlans !=
                                                          null ||
                                                  model.thirdLevelHmoKycEntityModelAvPlans !=
                                                          null &&
                                                      model
                                                              .thirdLevelHmoKycEntityModelAvPlans!
                                                              .scheduleOfPlans !=
                                                          null
                                              ? Container(
                                                  padding: EdgeInsets.all(10.w),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          AppColors.tintColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.kyc_file,
                                                      ),
                                                      SizedBox(width: 14.20.w),
                                                      SizedBox(
                                                        width: 80.w,
                                                        child: TextView(
                                                          text:
                                                              'Schedule..plans.jpg',
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 13.2.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      GestureDetector(
                                                        onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (_) => ImageWebViewScreen(
                                                              imageUrl:
                                                                  model
                                                                      .getHmoKycResponseModel
                                                                      ?.data
                                                                      ?.level3
                                                                      ?.scheduleOfPlans
                                                                      ?.url ??
                                                                  model
                                                                      .thirdLevelHmoKycEntityModelAvPlans!
                                                                      .scheduleOfPlans
                                                                      ?.url ??
                                                                  '',
                                                            ),
                                                          ),
                                                        ),
                                                        child: SvgPicture.asset(
                                                          AppImage.kyc_eye,
                                                        ),
                                                      ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : model
                                                                    .thirdLevelHmoKycEntityModelAvPlans
                                                                    ?.scheduleOfPlans !=
                                                                null
                                                          ? GestureDetector(
                                                              onTap: () => model
                                                                  .pickImagePlan(
                                                                    context,
                                                                  ),
                                                              child:
                                                                  model
                                                                      .isLoadingPlan
                                                                  ? SizedBox(
                                                                      width:
                                                                          10.w,
                                                                      height:
                                                                          10.h,
                                                                      child: CircularProgressIndicator(
                                                                        color: AppColors
                                                                            .primary,
                                                                        strokeWidth:
                                                                            2.w,
                                                                      ),
                                                                    )
                                                                  : SvgPicture.asset(
                                                                      AppImage
                                                                          .upload_arr_up,
                                                                    ),
                                                            )
                                                          : SizedBox.shrink(),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : model
                                                                    .thirdLevelHmoKycEntityModelAvPlans
                                                                    ?.scheduleOfPlans !=
                                                                null
                                                          ? GestureDetector(
                                                              onTap: () {
                                                                model
                                                                        .thirdLevelHmoKycEntityModelAvPlans!
                                                                        .scheduleOfPlans =
                                                                    null;
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .delete,
                                                                  ),
                                                            )
                                                          : SizedBox.shrink(),
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          model.pickImagePlan(
                                                            context,
                                                          ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            model.isLoadingPlan
                                                                ? SizedBox(
                                                                    width: 20.w,
                                                                    height:
                                                                        20.h,
                                                                    child: CircularProgressIndicator(
                                                                      color: AppColors
                                                                          .primary,
                                                                      strokeWidth:
                                                                          2.w,
                                                                    ),
                                                                  )
                                                                : SvgPicture.asset(
                                                                    AppImage
                                                                        .upload_doc,
                                                                  ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextView(
                                                                  text:
                                                                      'Upload Document',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'GoogleSans',
                                                                    fontSize:
                                                                        14.2.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 130.w,
                                                                  child: TextView(
                                                                    text:
                                                                        'Max file size: 2MB (.jpg,'
                                                                        ' .jpeg, .png, or'
                                                                        ' .pdf supported)',
                                                                    textStyle: TextStyle(
                                                                      fontFamily:
                                                                          'Arial',
                                                                      fontSize:
                                                                          13.6.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                ),

                                          SizedBox(height: 20.6.h),
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              TextView(
                                                text:
                                                    'License of associated clinics/'
                                                    'hospitals',
                                                textStyle: TextStyle(
                                                  fontFamily: 'Arial',
                                                  fontSize: 14.2.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.reminder,
                                                ),
                                              ),
                                              Positioned(
                                                right: -12.10,
                                                child: TextView(
                                                  text: '*',
                                                  textStyle: TextStyle(
                                                    fontFamily: 'Arial',
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),

                                          model
                                                              .getHmoKycResponseModel!
                                                              .data!
                                                              .level3 !=
                                                          null &&
                                                      model
                                                              .getHmoKycResponseModel!
                                                              .data!
                                                              .level3!
                                                              .listOfHospitals !=
                                                          null ||
                                                  model.thirdLevelHmoKycEntityModelAssClinic !=
                                                          null &&
                                                      model
                                                              .thirdLevelHmoKycEntityModelAssClinic!
                                                              .listOfHospitals !=
                                                          null
                                              ? Container(
                                                  padding: EdgeInsets.all(10.w),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          AppColors.tintColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppImage.kyc_file,
                                                      ),
                                                      SizedBox(width: 14.20.w),
                                                      SizedBox(
                                                        width: 80.w,
                                                        child: TextView(
                                                          text:
                                                              'list of ass...clinics..jpg',
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          textStyle: TextStyle(
                                                            fontFamily: 'Arial',
                                                            fontSize: 13.2.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      GestureDetector(
                                                        onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (_) => ImageWebViewScreen(
                                                              imageUrl:
                                                                  model
                                                                      .getHmoKycResponseModel
                                                                      ?.data
                                                                      ?.level3
                                                                      ?.listOfHospitals
                                                                      ?.url ??
                                                                  model
                                                                      .thirdLevelHmoKycEntityModelAssClinic!
                                                                      .listOfHospitals
                                                                      ?.url ??
                                                                  '',
                                                            ),
                                                          ),
                                                        ),
                                                        child: SvgPicture.asset(
                                                          AppImage.kyc_eye,
                                                        ),
                                                      ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : model
                                                                    .thirdLevelHmoKycEntityModelAssClinic
                                                                    ?.listOfHospitals !=
                                                                null
                                                          ? GestureDetector(
                                                              onTap: () => model
                                                                  .pickImageAss(
                                                                    context,
                                                                  ),
                                                              child:
                                                                  model
                                                                      .isLoadingAss
                                                                  ? SizedBox(
                                                                      width:
                                                                          10.w,
                                                                      height:
                                                                          10.h,
                                                                      child: CircularProgressIndicator(
                                                                        color: AppColors
                                                                            .primary,
                                                                        strokeWidth:
                                                                            2.w,
                                                                      ),
                                                                    )
                                                                  : SvgPicture.asset(
                                                                      AppImage
                                                                          .upload_arr_up,
                                                                    ),
                                                            )
                                                          : SizedBox.shrink(),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : SizedBox(
                                                              width: 8.10.w,
                                                            ),
                                                      model.getStatusOFKycProviderStatus(
                                                            model,
                                                          )
                                                          ? SizedBox.shrink()
                                                          : model
                                                                    .thirdLevelHmoKycEntityModelAssClinic
                                                                    ?.listOfHospitals !=
                                                                null
                                                          ? GestureDetector(
                                                              onTap: () {
                                                                model
                                                                        .thirdLevelHmoKycEntityModelAssClinic!
                                                                        .listOfHospitals =
                                                                    null;
                                                                model
                                                                    .notifyListeners();
                                                              },
                                                              child:
                                                                  SvgPicture.asset(
                                                                    AppImage
                                                                        .delete,
                                                                  ),
                                                            )
                                                          : SizedBox.shrink(),
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: double.infinity,
                                                  child: DottedBorder(
                                                    options:
                                                        RoundedRectDottedBorderOptions(
                                                          dashPattern: [10, 10],
                                                          strokeWidth: .94,
                                                          radius:
                                                              Radius.circular(
                                                                10,
                                                              ),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          model.pickImageAss(
                                                            context,
                                                          ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 16.20.w,
                                                              horizontal:
                                                                  14.0.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            model.isLoadingAss
                                                                ? SizedBox(
                                                                    width: 20.w,
                                                                    height:
                                                                        20.h,
                                                                    child: CircularProgressIndicator(
                                                                      color: AppColors
                                                                          .primary,
                                                                      strokeWidth:
                                                                          2.w,
                                                                    ),
                                                                  )
                                                                : SvgPicture.asset(
                                                                    AppImage
                                                                        .upload_doc,
                                                                  ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextView(
                                                                  text:
                                                                      'Upload Document',
                                                                  textStyle: TextStyle(
                                                                    fontFamily:
                                                                        'GoogleSans',
                                                                    fontSize:
                                                                        14.2.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .reminder,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 2.0.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 130.w,
                                                                  child: TextView(
                                                                    text:
                                                                        'Max file size: 2MB (.jpg,'
                                                                        ' .jpeg, .png, or'
                                                                        ' .pdf supported)',
                                                                    textStyle: TextStyle(
                                                                      fontFamily:
                                                                          'Arial',
                                                                      fontSize:
                                                                          13.6.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .fineGrey,
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
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 30.h),
                                model
                                                .getHmoKycResponseModel
                                                ?.data
                                                ?.kycLevels?[1]
                                                .status
                                                ?.toLowerCase() ==
                                            'approved' ||
                                        model
                                                .getHmoKycResponseModel
                                                ?.data
                                                ?.kycLevels?[1]
                                                .status
                                                ?.toLowerCase() ==
                                            'UNDER_REVIEW'.toLowerCase()
                                    ? SizedBox.shrink()
                                    : Column(
                                        children: [
                                          SizedBox(height: 30.h),
                                          ButtonWidget(
                                            border: 100.r,
                                            buttonColor: AppColors.white,
                                            fontSize: 14.sp,
                                            buttonText: 'Save Progress',
                                            color: AppColors.primary,
                                            isLoading: model.isLoading,
                                            buttonBorderColor:
                                                AppColors.primary,
                                            onPressed: () => model.updateThirdHMOKycSave(
                                              context,
                                              updateKyc: UpdateHmoKycThirdLevelEntityModel(
                                                bankName: bankNameController
                                                    .text
                                                    .trim(),
                                                accountName:
                                                    accountNameController.text
                                                        .trim(),
                                                accountNumber:
                                                    accountNumberController.text
                                                        .trim(),
                                                applicationForm: model
                                                    .thirdLevelHmoKycEntityModelAppForm!
                                                    .applicationForm,
                                                listOfHospitals:
                                                    model.thirdLevelHmoKycEntityModelAssClinic ==
                                                            null ||
                                                        model
                                                                .thirdLevelHmoKycEntityModelAssClinic!
                                                                .listOfHospitals ==
                                                            null
                                                    ? null
                                                    : model
                                                          .thirdLevelHmoKycEntityModelAssClinic!
                                                          .listOfHospitals,
                                                scheduleOfPlans:
                                                    model.thirdLevelHmoKycEntityModelAvPlans ==
                                                            null ||
                                                        model
                                                                .thirdLevelHmoKycEntityModelAvPlans!
                                                                .scheduleOfPlans ==
                                                            null
                                                    ? null
                                                    : model
                                                          .thirdLevelHmoKycEntityModelAvPlans!
                                                          .scheduleOfPlans,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20.h),
                                          ButtonWidget(
                                            border: 100.r,
                                            buttonColor: AppColors.primary,
                                            fontSize: 14.sp,
                                            buttonText:
                                                'Submit for Verification',
                                            color: AppColors.white,
                                            isLoading: model.isLoading,
                                            buttonBorderColor:
                                                AppColors.transparent,
                                            onPressed: () {
                                              if (formKey!.currentState!
                                                  .validate()) {
                                                model.updateThirdHMOKycSubmit(
                                                  context,
                                                  updateKyc: UpdateHmoKycThirdLevelEntityModel(
                                                    bankName: bankNameController
                                                        .text
                                                        .trim(),
                                                    accountName:
                                                        accountNameController
                                                            .text
                                                            .trim(),
                                                    accountNumber:
                                                        accountNumberController
                                                            .text
                                                            .trim(),
                                                    applicationForm:
                                                        model.thirdLevelHmoKycEntityModelAppForm ==
                                                                null ||
                                                            model
                                                                    .thirdLevelHmoKycEntityModelAppForm!
                                                                    .applicationForm ==
                                                                null
                                                        ? null
                                                        : model
                                                              .thirdLevelHmoKycEntityModelAppForm!
                                                              .applicationForm,
                                                    listOfHospitals:
                                                        model.thirdLevelHmoKycEntityModelAssClinic ==
                                                                null ||
                                                            model
                                                                    .thirdLevelHmoKycEntityModelAssClinic!
                                                                    .listOfHospitals ==
                                                                null
                                                        ? null
                                                        : model
                                                              .thirdLevelHmoKycEntityModelAssClinic!
                                                              .listOfHospitals,
                                                    scheduleOfPlans:
                                                        model.thirdLevelHmoKycEntityModelAvPlans ==
                                                                null ||
                                                            model
                                                                    .thirdLevelHmoKycEntityModelAvPlans!
                                                                    .scheduleOfPlans ==
                                                                null
                                                        ? null
                                                        : model
                                                              .thirdLevelHmoKycEntityModelAvPlans!
                                                              .scheduleOfPlans,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          SizedBox(height: 10.h),
                                        ],
                                      ),
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
        );
      },
    );
  }
}
