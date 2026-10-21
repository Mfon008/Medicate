// ignore_for_file: prefer_null_aware_operators, deprecated_member_use, must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicate_app/core/app_assets/image.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/core/connect_end/model/submit_healthcare_level_two_kyc_entity_model/proof_of_physical_address.dart';
import 'package:medicate_app/core/connect_end/model/submit_healthcare_level_two_kyc_entity_model/submit_healthcare_level_two_kyc_entity_model.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/app_assets/app_validation.dart';
import '../../../../../core/connect_end/model/submit_healthcare_level_two_kyc_entity_model/bank_details.dart';
import '../../../../../core/connect_end/model/submit_healthcare_level_two_kyc_entity_model/medical_license_certificate.dart';
import '../../../../../core/connect_end/model/submit_healthcare_level_two_kyc_entity_model/tax_identification_number_document.dart';
import '../../../../../core/connect_end/view_model/health_care_view_model.dart';
import '../../../../widget/button.dart';
import '../../../../widget/info_item_widget.dart';
import '../../../../widget/kyc_url_view.dart';
import '../../../../widget/text_form_widget.dart';
import '../../manufacture/dashed_border_painter.dart';

class LevelTwoCard extends StatefulWidget {
  const LevelTwoCard({super.key});

  @override
  State<LevelTwoCard> createState() => _LevelTwoCardState();
}

class _LevelTwoCardState extends State<LevelTwoCard> {
  bool isExpanded = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountNoController = TextEditingController();
  TextEditingController bankAccountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HealthCareViewModel>.reactive(
      viewModelBuilder: () => HealthCareViewModel(),
      onViewModelReady: (model) async {
        await model.getHealthCarePractitionerKyc(context);
        if (model.getHealthcarePractitionerKycResponseModel != null &&
            model.getHealthcarePractitionerKycResponseModel!.data!.level2 !=
                null) {
          final level2 =
              model.getHealthcarePractitionerKycResponseModel!.data!.level2;

          if (level2!.medicalLicenseCertificate != null) {
            model.submitLevelTwoKycEntityModelCAC?.medicalLicenseCertificate =
                MedicalLicenseCertificate.fromJson(
                  level2.medicalLicenseCertificate!.toJson(),
                );
          }
          if (level2.proofOfPhysicalAddress != null) {
            model.submitLevelTwoKycEntityModelProof?.proofOfPhysicalAddress =
                ProofOfPhysicalAddress.fromJson(
                  level2.proofOfPhysicalAddress!.toJson(),
                );
          }
          if (level2.taxIdentificationNumberDocument != null) {
            model
                    .submitLevelTwoKycEntityModelTIN
                    ?.taxIdentificationNumberDocument =
                TaxIdentificationNumberDocument.fromJson(
                  level2.taxIdentificationNumberDocument!.toJson(),
                );
          }
          if (level2.bankDetails != null) {
            bankNameController.text = level2.bankDetails?.bankName ?? '';
            bankAccountNoController.text =
                level2.bankDetails?.accountNumber ?? '';
            bankAccountNameController.text =
                level2.bankDetails?.accountName ?? '';
          }
        }
      },
      disposeViewModel: false,
      builder: (_, HealthCareViewModel model, _) {
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
                  color: const Color(0xFFF1F7FE),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ==========================================
                      // HEADER
                      // ==========================================
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 13.h,
                          ),
                          color: !isExpanded
                              ? AppColors.f1
                              : const Color(0xFFF1F7FE),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              model
                                          .getHealthcarePractitionerKycResponseModel
                                          ?.data
                                          ?.kycLevels?[1]
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
                                  ? SvgPicture.asset(AppImage.open_padlock)
                                  : SvgPicture.asset(AppImage.open_padlock),

                              SizedBox(width: 8.w),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Level 2',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: !isExpanded
                                          ? AppColors.reminder1
                                          : AppColors.primary,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),

                                  SizedBox(height: 2.h),

                                  TextView(
                                    text: 'Professional Verification',
                                    textStyle: TextStyle(
                                      fontSize: 13.22.sp,
                                      fontWeight: FontWeight.w400,
                                      color: !isExpanded
                                          ? AppColors.reminder1
                                          : AppColors.primary,
                                      fontFamily: 'DMSans',
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),
                              !isExpanded
                                  ? AnimatedRotation(
                                      turns: isExpanded ? 0.5 : 0,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 21.sp,
                                        color: const Color(0xFF333333),
                                      ),
                                    )
                                  : AnimatedRotation(
                                      turns: isExpanded ? 0.5 : 0,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 21.sp,
                                        color: const Color(0xFF333333),
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
                          decoration: BoxDecoration(
                            color: AppColors.white,

                            // Curved top corners
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ==================================
                              // KYC MESSAGE
                              // ==================================
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 12.h,
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 22.h,
                                ),
                                decoration: BoxDecoration(
                                  color: model.kycStatusColor(
                                    model
                                        .getHealthcarePractitionerKycResponseModel
                                        ?.data
                                        ?.kycLevels?[1]
                                        .status,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    model
                                                .getHealthcarePractitionerKycResponseModel
                                                ?.data
                                                ?.kycLevels?[1]
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
                                        : Icon(
                                            Icons.info_outline,
                                            size: 18.90.sp,
                                            color: model.kycStatusColorIcon(
                                              model
                                                  .getHealthcarePractitionerKycResponseModel
                                                  ?.data
                                                  ?.kycLevels?[1]
                                                  .status,
                                            ),
                                          ),

                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Text(
                                        model.kycStatusText(
                                          model
                                              .getHealthcarePractitionerKycResponseModel
                                              ?.data
                                              ?.kycLevels?[1]
                                              .status,
                                        ),
                                        style: TextStyle(
                                          fontSize: 12.5.sp,
                                          height: 1.35,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF252525),
                                          fontFamily: 'DMSans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // ==================================
                              // INFORMATION
                              // ==================================
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 14.w),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 20.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.f1),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.10.h),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 16.20.w,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.f1),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
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
                                                text:
                                                    'Business & Professional Documents',
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
                                                    text:
                                                        'Medical license & certificate',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.2.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              model
                                                                  .getHealthcarePractitionerKycResponseModel!
                                                                  .data!
                                                                  .level2 !=
                                                              null &&
                                                          model
                                                                  .getHealthcarePractitionerKycResponseModel!
                                                                  .data!
                                                                  .level2!
                                                                  .medicalLicenseCertificate !=
                                                              null ||
                                                      model.submitLevelTwoKycEntityModelCAC !=
                                                              null &&
                                                          model
                                                                  .submitLevelTwoKycEntityModelCAC!
                                                                  .medicalLicenseCertificate !=
                                                              null
                                                  ? Container(
                                                      padding: EdgeInsets.all(
                                                        10.w,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: AppColors
                                                              .tintColor,
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
                                                          SizedBox(
                                                            width: 14.20.w,
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                            child: TextView(
                                                              text:
                                                                  'Medical license & certificate.jpg',
                                                              maxLines: 1,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize:
                                                                    13.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .black,
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
                                                                          .getHealthcarePractitionerKycResponseModel
                                                                          ?.data
                                                                          ?.level2
                                                                          ?.medicalLicenseCertificate
                                                                          ?.url ??
                                                                      model
                                                                          .submitLevelTwoKycEntityModelCAC
                                                                          ?.medicalLicenseCertificate
                                                                          ?.url ??
                                                                      '',
                                                                ),
                                                              ),
                                                            ),
                                                            child:
                                                                SvgPicture.asset(
                                                                  AppImage
                                                                      .kyc_eye,
                                                                ),
                                                          ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : SizedBox(
                                                                  width: 8.10.w,
                                                                ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : model
                                                                        .submitLevelTwoKycEntityModelCAC
                                                                        ?.medicalLicenseCertificate !=
                                                                    null
                                                              ? GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageCAC(
                                                                        context,
                                                                      ),
                                                                  child:
                                                                      model
                                                                          .isLoadingCAC
                                                                      ? SizedBox(
                                                                          width:
                                                                              10.w,
                                                                          height:
                                                                              10.h,
                                                                          child: CircularProgressIndicator(
                                                                            color:
                                                                                AppColors.primary,
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
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : SizedBox(
                                                                  width: 8.10.w,
                                                                ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : model
                                                                        .submitLevelTwoKycEntityModelCAC
                                                                        ?.medicalLicenseCertificate !=
                                                                    null
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    model
                                                                            .submitLevelTwoKycEntityModelCAC!
                                                                            .medicalLicenseCertificate =
                                                                        null;
                                                                    model
                                                                        .notifyListeners();
                                                                  },
                                                                  child: SvgPicture.asset(
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
                                                              dashPattern: [
                                                                10,
                                                                10,
                                                              ],
                                                              strokeWidth: .94,
                                                              radius:
                                                                  Radius.circular(
                                                                    10,
                                                                  ),
                                                              color: AppColors
                                                                  .primary,
                                                            ),
                                                        child: GestureDetector(
                                                          onTap: () => model
                                                              .pickImageCAC(
                                                                context,
                                                              ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  vertical:
                                                                      16.20.w,
                                                                  horizontal:
                                                                      14.0.w,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10.r,
                                                                      ),
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                model.isLoadingCAC
                                                                    ? SizedBox(
                                                                        width:
                                                                            20.w,
                                                                        height:
                                                                            20.h,
                                                                        child: CircularProgressIndicator(
                                                                          color:
                                                                              AppColors.primary,
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
                                                                            FontWeight.w500,
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          2.0.h,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          130.w,
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
                                                                              FontWeight.w400,
                                                                          color:
                                                                              AppColors.fineGrey,
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
                                                        'Proof of physical address',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.2.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              model
                                                                  .getHealthcarePractitionerKycResponseModel!
                                                                  .data!
                                                                  .level2 !=
                                                              null &&
                                                          model
                                                                  .getHealthcarePractitionerKycResponseModel!
                                                                  .data!
                                                                  .level2!
                                                                  .proofOfPhysicalAddress !=
                                                              null ||
                                                      model.submitLevelTwoKycEntityModelProof !=
                                                              null &&
                                                          model
                                                                  .submitLevelTwoKycEntityModelProof!
                                                                  .proofOfPhysicalAddress !=
                                                              null
                                                  ? Container(
                                                      padding: EdgeInsets.all(
                                                        10.w,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: AppColors
                                                              .tintColor,
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
                                                          SizedBox(
                                                            width: 14.20.w,
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                            child: TextView(
                                                              text:
                                                                  'Proof of..address.jpg',
                                                              maxLines: 1,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize:
                                                                    13.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .black,
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
                                                                          .getHealthcarePractitionerKycResponseModel
                                                                          ?.data
                                                                          ?.level2
                                                                          ?.proofOfPhysicalAddress
                                                                          ?.url ??
                                                                      model
                                                                          .submitLevelTwoKycEntityModelProof!
                                                                          .proofOfPhysicalAddress
                                                                          ?.url ??
                                                                      '',
                                                                ),
                                                              ),
                                                            ),
                                                            child:
                                                                SvgPicture.asset(
                                                                  AppImage
                                                                      .kyc_eye,
                                                                ),
                                                          ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : SizedBox(
                                                                  width: 8.10.w,
                                                                ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : model
                                                                        .submitLevelTwoKycEntityModelProof
                                                                        ?.proofOfPhysicalAddress !=
                                                                    null
                                                              ? GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageProofAdd(
                                                                        context,
                                                                      ),
                                                                  child:
                                                                      model
                                                                          .isLoadingLicense
                                                                      ? SizedBox(
                                                                          width:
                                                                              10.w,
                                                                          height:
                                                                              10.h,
                                                                          child: CircularProgressIndicator(
                                                                            color:
                                                                                AppColors.primary,
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
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : SizedBox(
                                                                  width: 8.10.w,
                                                                ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : model
                                                                        .submitLevelTwoKycEntityModelProof
                                                                        ?.proofOfPhysicalAddress !=
                                                                    null
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    model
                                                                            .submitLevelTwoKycEntityModelProof!
                                                                            .proofOfPhysicalAddress =
                                                                        null;
                                                                    model
                                                                        .notifyListeners();
                                                                  },
                                                                  child: SvgPicture.asset(
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
                                                              dashPattern: [
                                                                10,
                                                                10,
                                                              ],
                                                              strokeWidth: .94,
                                                              radius:
                                                                  Radius.circular(
                                                                    10,
                                                                  ),
                                                              color: AppColors
                                                                  .primary,
                                                            ),
                                                        child: GestureDetector(
                                                          onTap: () => model
                                                              .pickImageProofAdd(
                                                                context,
                                                              ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  vertical:
                                                                      16.20.w,
                                                                  horizontal:
                                                                      14.0.w,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10.r,
                                                                      ),
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                model.isLoadingLicense
                                                                    ? SizedBox(
                                                                        width:
                                                                            20.w,
                                                                        height:
                                                                            20.h,
                                                                        child: CircularProgressIndicator(
                                                                          color:
                                                                              AppColors.primary,
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
                                                                            FontWeight.w500,
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          2.0.h,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          130.w,
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
                                                                              FontWeight.w400,
                                                                          color:
                                                                              AppColors.fineGrey,
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
                                                        'Tax identification number',
                                                    textStyle: TextStyle(
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.2.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),

                                              model
                                                                  .getHealthcarePractitionerKycResponseModel!
                                                                  .data!
                                                                  .level2 !=
                                                              null &&
                                                          model
                                                                  .getHealthcarePractitionerKycResponseModel!
                                                                  .data!
                                                                  .level2!
                                                                  .taxIdentificationNumberDocument !=
                                                              null ||
                                                      model.submitLevelTwoKycEntityModelTIN !=
                                                              null &&
                                                          model
                                                                  .submitLevelTwoKycEntityModelTIN!
                                                                  .taxIdentificationNumberDocument !=
                                                              null
                                                  ? Container(
                                                      padding: EdgeInsets.all(
                                                        10.w,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: AppColors
                                                              .tintColor,
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
                                                          SizedBox(
                                                            width: 14.20.w,
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                            child: TextView(
                                                              text:
                                                                  'Tax ID number.jpg',
                                                              maxLines: 1,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textStyle: TextStyle(
                                                                fontFamily:
                                                                    'Arial',
                                                                fontSize:
                                                                    13.2.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .black,
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
                                                                          .getHealthcarePractitionerKycResponseModel
                                                                          ?.data
                                                                          ?.level2
                                                                          ?.taxIdentificationNumberDocument
                                                                          ?.url ??
                                                                      model
                                                                          .submitLevelTwoKycEntityModelTIN!
                                                                          .taxIdentificationNumberDocument
                                                                          ?.url ??
                                                                      '',
                                                                ),
                                                              ),
                                                            ),
                                                            child:
                                                                SvgPicture.asset(
                                                                  AppImage
                                                                      .kyc_eye,
                                                                ),
                                                          ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : SizedBox(
                                                                  width: 8.10.w,
                                                                ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : model
                                                                        .submitLevelTwoKycEntityModelTIN
                                                                        ?.taxIdentificationNumberDocument !=
                                                                    null
                                                              ? GestureDetector(
                                                                  onTap: () => model
                                                                      .pickImageTIN(
                                                                        context,
                                                                      ),
                                                                  child:
                                                                      model
                                                                          .isLoadingTIN
                                                                      ? SizedBox(
                                                                          width:
                                                                              10.w,
                                                                          height:
                                                                              10.h,
                                                                          child: CircularProgressIndicator(
                                                                            color:
                                                                                AppColors.primary,
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
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : SizedBox(
                                                                  width: 8.10.w,
                                                                ),
                                                          model.getStatusOFKycPractitionerStatus(
                                                                model,
                                                              )
                                                              ? SizedBox.shrink()
                                                              : model
                                                                        .submitLevelTwoKycEntityModelTIN
                                                                        ?.taxIdentificationNumberDocument !=
                                                                    null
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    model
                                                                            .submitLevelTwoKycEntityModelTIN!
                                                                            .taxIdentificationNumberDocument =
                                                                        null;
                                                                    model
                                                                        .notifyListeners();
                                                                  },
                                                                  child: SvgPicture.asset(
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
                                                              dashPattern: [
                                                                10,
                                                                10,
                                                              ],
                                                              strokeWidth: .94,
                                                              radius:
                                                                  Radius.circular(
                                                                    10,
                                                                  ),
                                                              color: AppColors
                                                                  .primary,
                                                            ),
                                                        child: GestureDetector(
                                                          onTap: () => model
                                                              .pickImageTIN(
                                                                context,
                                                              ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  vertical:
                                                                      16.20.w,
                                                                  horizontal:
                                                                      14.0.w,
                                                                ),
                                                            decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10.r,
                                                                      ),
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                model.isLoadingTIN
                                                                    ? SizedBox(
                                                                        width:
                                                                            20.w,
                                                                        height:
                                                                            20.h,
                                                                        child: CircularProgressIndicator(
                                                                          color:
                                                                              AppColors.primary,
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
                                                                            FontWeight.w500,
                                                                        color: AppColors
                                                                            .reminder,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          2.0.h,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          130.w,
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
                                                                              FontWeight.w400,
                                                                          color:
                                                                              AppColors.fineGrey,
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
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: 20.w),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                        vertical: 16.20.w,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.f1),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child:
                                          model
                                                      .getHealthcarePractitionerKycResponseModel!
                                                      .data!
                                                      .level2 ==
                                                  null ||
                                              model
                                                      .getHealthcarePractitionerKycResponseModel!
                                                      .data!
                                                      .level2!
                                                      .bankDetails ==
                                                  null ||
                                              model
                                                      .getHealthcareProviderKycResponseModel!
                                                      .data!
                                                      .level2!
                                                      .bankDetails!
                                                      .accountName ==
                                                  '' ||
                                              model
                                                      .getHealthcareProviderKycResponseModel!
                                                      .data!
                                                      .level2!
                                                      .bankDetails!
                                                      .accountNumber ==
                                                  '' ||
                                              model
                                                      .getHealthcareProviderKycResponseModel!
                                                      .data!
                                                      .level2!
                                                      .bankDetails!
                                                      .bankName ==
                                                  ''
                                          ? Form(
                                              key: formKey,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text: 'Bank Information',
                                                    textStyle: TextStyle(
                                                      fontSize: 16.2.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 6.h),
                                                  Divider(
                                                    color: const Color.fromARGB(
                                                      255,
                                                      227,
                                                      227,
                                                      228,
                                                    ),
                                                  ),
                                                  SizedBox(height: 6.h),

                                                  TextFormWidget(
                                                    hint: 'Bank name',
                                                    hintSize: 14,
                                                    borderColor:
                                                        AppColors.transparent,
                                                    borderTopLeft: 10.r,
                                                    borderTopRight: 10.r,
                                                    borderBottomLeft: 10.r,
                                                    borderBottomRight: 10.r,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    labelStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.2.sp,
                                                      color: AppColors.infoGrey,
                                                    ),
                                                    fillColor: AppColors.grey,
                                                    isFilled: true,
                                                    controller:
                                                        bankNameController,
                                                    validator:
                                                        AppValidator.validateString(),
                                                  ),
                                                  SizedBox(height: 20.h),
                                                  TextFormWidget(
                                                    hint: 'Account number',
                                                    hintSize: 14,
                                                    borderColor:
                                                        AppColors.transparent,
                                                    borderTopLeft: 10.r,
                                                    borderTopRight: 10.r,
                                                    borderBottomLeft: 10.r,
                                                    borderBottomRight: 10.r,
                                                    label:
                                                        'Enter account number',
                                                    keyboardType:
                                                        TextInputType.number,
                                                    labelStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.2.sp,
                                                      color: AppColors.infoGrey,
                                                    ),
                                                    fillColor: AppColors.grey,
                                                    isFilled: true,
                                                    controller:
                                                        bankAccountNoController,
                                                    validator:
                                                        AppValidator.validateString(),
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                      LengthLimitingTextInputFormatter(
                                                        10,
                                                      ),
                                                    ],
                                                    // ),
                                                  ),
                                                  SizedBox(height: 20.h),
                                                  TextFormWidget(
                                                    hint: 'Account name',
                                                    hintSize: 14,
                                                    borderColor:
                                                        AppColors.transparent,
                                                    borderTopLeft: 10.r,
                                                    borderTopRight: 10.r,
                                                    borderBottomLeft: 10.r,
                                                    borderBottomRight: 10.r,
                                                    label: 'Enter account name',
                                                    keyboardType:
                                                        TextInputType.name,
                                                    labelStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Arial',
                                                      fontSize: 14.2.sp,
                                                      color: AppColors.infoGrey,
                                                    ),
                                                    fillColor: AppColors.grey,
                                                    isFilled: true,
                                                    controller:
                                                        bankAccountNameController,
                                                    validator:
                                                        AppValidator.validateString(),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextView(
                                                  text: 'Bank Information',
                                                  textStyle: TextStyle(
                                                    fontSize: 15.86.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.reminder1,
                                                    fontFamily: 'DMSans',
                                                  ),
                                                ),

                                                Divider(color: AppColors.f1),
                                                SizedBox(height: 18.22.h),
                                                InfoItem(
                                                  title: 'Bank name',
                                                  value:
                                                      model
                                                          .getHealthcarePractitionerKycResponseModel
                                                          ?.data
                                                          ?.level2
                                                          ?.bankDetails
                                                          ?.bankName ??
                                                      '--',
                                                ),

                                                SizedBox(height: 18.22.h),
                                                InfoItem(
                                                  title: 'Account number',
                                                  value:
                                                      model
                                                          .getHealthcarePractitionerKycResponseModel
                                                          ?.data
                                                          ?.level2
                                                          ?.bankDetails
                                                          ?.accountNumber ??
                                                      '--',
                                                ),
                                                SizedBox(height: 18.22.h),
                                                InfoItem(
                                                  title: 'Account name',
                                                  value:
                                                      model
                                                          .getHealthcarePractitionerKycResponseModel
                                                          ?.data
                                                          ?.level2
                                                          ?.bankDetails
                                                          ?.accountName ??
                                                      '--',
                                                ),

                                                SizedBox(height: 2.h),
                                              ],
                                            ),
                                    ),

                                    model.getStatusOFKycPractitionerStatus(
                                          model,
                                        )
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
                                                onPressed: () {
                                                  // final isFormValid =
                                                  //     formKey.currentState
                                                  //         ?.validate() ??
                                                  //     false;

                                                  // final hasRequiredDocument =
                                                  //     model
                                                  //             .submitLevelTwoKycEntityModelCAC
                                                  //             ?.medicalLicenseCertificate !=
                                                  //         null ||
                                                  //     model
                                                  //             .submitLevelTwoKycEntityModelProof
                                                  //             ?.proofOfPhysicalAddress !=
                                                  //         null ||
                                                  //     model
                                                  //             .submitLevelTwoKycEntityModelTIN
                                                  //             ?.taxIdentificationNumberDocument !=
                                                  //         null;

                                                  // if (isFormValid &&
                                                  //     hasRequiredDocument) {
                                                  model.updateHealthCarePractitionerKycSave(
                                                    context,
                                                    updateKyc: SubmitHealthcareLevelTwoKycEntityModel(
                                                      medicalLicenseCertificate:
                                                          model.submitLevelTwoKycEntityModelCAC ==
                                                                  null ||
                                                              model
                                                                      .submitLevelTwoKycEntityModelCAC!
                                                                      .medicalLicenseCertificate ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .submitLevelTwoKycEntityModelCAC!
                                                                .medicalLicenseCertificate,
                                                      proofOfPhysicalAddress:
                                                          model.submitLevelTwoKycEntityModelProof ==
                                                                  null ||
                                                              model
                                                                      .submitLevelTwoKycEntityModelProof!
                                                                      .proofOfPhysicalAddress ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .submitLevelTwoKycEntityModelProof!
                                                                .proofOfPhysicalAddress,
                                                      taxIdentificationNumberDocument:
                                                          model.submitLevelTwoKycEntityModelTIN ==
                                                                  null ||
                                                              model
                                                                      .submitLevelTwoKycEntityModelTIN!
                                                                      .taxIdentificationNumberDocument ==
                                                                  null
                                                          ? null
                                                          : model
                                                                .submitLevelTwoKycEntityModelTIN!
                                                                .taxIdentificationNumberDocument,
                                                      bankDetails: BankDetails(
                                                        bankName:
                                                            bankNameController
                                                                .text
                                                                .trim(),
                                                        accountName:
                                                            bankAccountNameController
                                                                .text
                                                                .trim(),
                                                        accountNumber:
                                                            bankAccountNoController
                                                                .text
                                                                .trim(),
                                                      ),
                                                    ),
                                                  );
                                                  // }
                                                },
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
                                                  final isFormValid =
                                                      formKey.currentState
                                                          ?.validate() ??
                                                      false;

                                                  final hasRequiredDocument =
                                                      model
                                                              .submitLevelTwoKycEntityModelCAC
                                                              ?.medicalLicenseCertificate !=
                                                          null ||
                                                      model
                                                              .submitLevelTwoKycEntityModelProof
                                                              ?.proofOfPhysicalAddress !=
                                                          null ||
                                                      model
                                                              .submitLevelTwoKycEntityModelTIN
                                                              ?.taxIdentificationNumberDocument !=
                                                          null;

                                                  if (isFormValid &&
                                                      hasRequiredDocument) {
                                                    model.updateHealthCarePractitionerKycSubmit(
                                                      context,
                                                      updateKyc: SubmitHealthcareLevelTwoKycEntityModel(
                                                        medicalLicenseCertificate:
                                                            model.submitLevelTwoKycEntityModelCAC ==
                                                                null
                                                            ? null
                                                            : model
                                                                  .submitLevelTwoKycEntityModelCAC!
                                                                  .medicalLicenseCertificate,
                                                        proofOfPhysicalAddress:
                                                            model.submitLevelTwoKycEntityModelProof ==
                                                                null
                                                            ? null
                                                            : model
                                                                  .submitLevelTwoKycEntityModelProof!
                                                                  .proofOfPhysicalAddress,
                                                        taxIdentificationNumberDocument:
                                                            model.submitLevelTwoKycEntityModelTIN ==
                                                                null
                                                            ? null
                                                            : model
                                                                  .submitLevelTwoKycEntityModelTIN!
                                                                  .taxIdentificationNumberDocument,
                                                        bankDetails: BankDetails(
                                                          bankName:
                                                              bankNameController
                                                                  .text
                                                                  .trim(),
                                                          accountName:
                                                              bankAccountNameController
                                                                  .text
                                                                  .trim(),
                                                          accountNumber:
                                                              bankAccountNoController
                                                                  .text
                                                                  .trim(),
                                                        ),
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
                              SizedBox(height: 20.h),
                            ],
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
